# Listing: one-two-one

Het verradelijk verslavende blok-kantelspel, naar voorbeeld van het oudere Flash-spel Bloxorz (vroeger waren veel online spellen gemaakt in Flash), gemaakt door [Wiktor Toporek](https://github.com/vViktorPL/one-two-one). De uitgeklede versie hieronder is aangepast zodat het in één geheel in [Try Elm](https://elm-lang.org/try) kan worden gekopieerd en worden gespeeld.

## Packages

Pas op: Omdat dit spel gebruikt maakt van 3D, moet je een aantal "packages" installeren. Dat installeren kan niet in de CompuRob workshop, maar wel bij Try Elm.

Je kunt packages installeren door **op "packages" te klikken en in het zoekveld steeds de naam van een package te typen, en dan op het plusje naast de juiste te klikken**. De benodigde packages zijn:

- elm/**json**
- avh4/**elm-color**
- ianmackenzie/**elm-units** (je kunt `elm-units` typen, maar pas op dat je de juiste hebt, met ianmackenzie)
- ianmackenzie/**elm-geometry** (je kunt `elm-geometry` typen)
- ianmackenzie/**elm-3d-scene**
- ianmackenzie/**elm-3d-camera**

Als je het blok wilt bewegen met de pijltjestoetsen op een toetsenbord, dan moet je eerst even in het spel klikken; daarna luistert het spel naar de toetsen.

## Challenges (vragen en uitdagingen)

- Kun je de kleur van het blok aanpassen?
- Maak eens wat extra gaten in de vloer van bijvoorbeeld level 1..
- Hoe zou je het blok op een andere tegel kunnen laten vallen in het begin van het level?
- Snap je hoe je een brug kan laten open- of dichtklappen?
- Hoe zou je een nieuwe soort tegel aan de vloeren kunnen toevoegen? In welke gedeeltes van de code moet dan wat veranderd worden?

## De code

```haskell
module Main exposing (main)

import Angle
import Array exposing (Array)
import Axis3d
import Block3d exposing (Block3d)
import Browser
import Browser.Dom
import Browser.Events
import Camera3d
import Color exposing (Color)
import Dict exposing (Dict)
import Direction3d
import Html exposing (Html)
import Html.Attributes as Html
import Html.Events as Event
import Json.Decode as Decode
import Length exposing (Length)
import Pixels
import Point3d
import Scene3d
import Scene3d.Material as Material
import Task
import Vector3d
import Viewpoint3d



-- SETTINGS --


tileSize =
    Length.centimeters 1


tileSizeCm =
    Length.inCentimeters tileSize


playerWidthCm =
    1 * tileSizeCm


playerHeightCm =
    2 * tileSizeCm


animationSpeed =
    1 / 250



-- THE GAME --


type alias Model =
    { screen : { width : Int, height : Int }
    , player : Player
    , level : Level
    , nextLevels : List Level
    , control : Maybe Direction
    }


type Direction
    = Up
    | Right
    | Left
    | Down


type Msg
    = ViewportSize ( Int, Int )
    | AnimationTick Float
    | KeyDown String
    | KeyUp String


init : () -> ( Model, Cmd Msg )
init () =
    ( { screen = { width = 0, height = 0 }
      , player = playerInit (getStartingPosition level1)
      , level = level1
      , nextLevels = List.drop 1 levels
      , control = Nothing
      }
    , Browser.Dom.getViewport
        |> Task.perform (\{ viewport } -> ViewportSize ( floor viewport.width, floor viewport.height ))
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ViewportSize ( width, height ) ->
            ( { model | screen = { width = width, height = height } }, Cmd.none )

        AnimationTick delta ->
            let
                controlledPlayer =
                    controlPlayer model.control model.player

                ( animatedPlayer, playerCmd ) =
                    controlledPlayer
                        |> playerUpdate delta model.level

                ( updatedPlayer, interactionMsg ) =
                    animatedPlayer
                        |> interact model.level

                updatedLevel =
                    model.level
                        |> levelUpdate delta
            in
            case interactionMsg of
                InternalUpdate ->
                    ( { model | player = updatedPlayer, level = updatedLevel }, playerCmd )

                FinishedLevel ->
                    case model.nextLevels of
                        [] ->
                            ( { model
                                | player = playerInit (getStartingPosition level1)
                                , level = level1
                                , nextLevels = List.drop 1 levels
                              }
                            , playerCmd
                            )

                        nextLevel :: otherLevels ->
                            ( { model
                                | player = playerInit (getStartingPosition nextLevel)
                                , level = nextLevel
                                , nextLevels = otherLevels
                              }
                            , playerCmd
                            )

                PushDownTile zOffset ->
                    ( { model
                        | player = updatedPlayer
                        , level = shiftTile (getPosition updatedPlayer) zOffset model.level
                      }
                    , playerCmd
                    )

                TriggerActions actions ->
                    let
                        previousInteractionMsg =
                            model.player
                                |> interact model.level
                                |> Tuple.second

                        ( actionUpdatedLevel, actionCommand ) =
                            case previousInteractionMsg of
                                TriggerActions _ ->
                                    ( updatedLevel, playerCmd )

                                _ ->
                                    -- Trigger only if not trigged in last update already
                                    triggerActions actions updatedLevel
                    in
                    ( { model
                        | player = updatedPlayer
                        , level = actionUpdatedLevel
                      }
                    , actionCommand
                    )

                RestartedLevel ->
                    ( { model
                        | player = updatedPlayer
                        , level = restart model.level
                      }
                    , playerCmd
                    )

                _ ->
                    ( { model
                        | player = updatedPlayer
                        , level = updatedLevel
                      }
                    , playerCmd
                    )

        KeyDown key ->
            ( key
                |> keyToDirection
                |> Maybe.map (\direction -> { model | control = Just direction })
                |> Maybe.withDefault model
            , Cmd.none
            )

        KeyUp key ->
            ( if keyToDirection key == model.control then
                { model | control = Nothing }

              else
                model
            , Cmd.none
            )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ case ( model.player, model.control, levelIsBusy model.level ) of
            ( Cuboid Standing _, Nothing, False ) ->
                Sub.none

            ( Cuboid (Lying _) _, Nothing, False ) ->
                Sub.none

            _ ->
                Browser.Events.onAnimationFrameDelta AnimationTick
        , Browser.Events.onKeyDown (Decode.map KeyDown keyDecoder)
        , Browser.Events.onKeyUp (Decode.map KeyUp keyDecoder)
        ]


keyDecoder : Decode.Decoder String
keyDecoder =
    Decode.field "key" Decode.string


keyToDirection : String -> Maybe Direction
keyToDirection string =
    case string of
        "ArrowLeft" ->
            Just Left

        "ArrowRight" ->
            Just Right

        "ArrowUp" ->
            Just Up

        "ArrowDown" ->
            Just Down

        _ ->
            Nothing


controlPlayer : Maybe Direction -> Player -> Player
controlPlayer control player =
    case control of
        Just direction ->
            move direction player

        Nothing ->
            player


main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


view : Model -> Html Msg
view { screen, player, level, control } =
    let
        zoomOut =
            max (800 / toFloat screen.width) 1

        camera =
            Camera3d.perspective
                { viewpoint =
                    Viewpoint3d.orbitZ
                        { focalPoint = Point3d.centimeters 5 5 0
                        , azimuth = Angle.degrees 35
                        , elevation = Angle.degrees 25
                        , distance = Length.centimeters (15 * zoomOut)
                        }
                , verticalFieldOfView = Angle.degrees 30
                }

        info =
            String.join "; "
                [ playerInfo, controlInfo, levelInfo ]

        playerInfo =
            "player = "
                ++ (case player of
                        Cuboid Standing _ ->
                            "standing"

                        Cuboid (Lying _) _ ->
                            "lying"

                        Cuboid (KnockingOver _ _) _ ->
                            "being knocked over"

                        Cuboid (GettingUp _ _) _ ->
                            "getting up"

                        Cuboid (Rolling _ _) _ ->
                            "rolling"

                        Cuboid (SlideIn _) _ ->
                            "sliding in"

                        Cuboid (FallingUnbalanced _ _) _ ->
                            "falling unbalanced"

                        Cuboid (FallingInHorizontalOrientation _ _) _ ->
                            "falling horizontally"

                        Cuboid (FallingInVerticalOrientation _) _ ->
                            "falling vertically"

                        Cuboid (FallingFromTheSky _) _ ->
                            "falling from the sky"

                        Cuboid (FallingWithTheFloor _) _ ->
                            "falling with the floor"
                   )

        controlInfo =
            "control = "
                ++ (case control of
                        Nothing ->
                            "stay"

                        Just Left ->
                            "left"

                        Just Right ->
                            "right"

                        Just Up ->
                            "up"

                        Just Down ->
                            "down"
                   )

        levelInfo =
            "level = "
                ++ (if levelIsBusy level then
                        "in action"

                    else
                        "idle"
                   )
    in
    Html.div []
        [ Html.div
            [ Html.style "position" "absolute"
            , Html.style "top" "0"
            , Html.style "left" "0"
            , Html.style "right" "0"
            , Html.style "font-size" "25px"
            , Html.style "text-align" "center"
            , Html.style "white-space" "pre"
            ]
            [ Html.text info ]
        , Scene3d.sunny
            { entities = [ playerView player, levelView level ]
            , camera = camera
            , upDirection = Direction3d.z
            , sunlightDirection = Direction3d.xz (Angle.degrees -120)
            , background = Scene3d.transparentBackground
            , clipDepth = Length.centimeters 1
            , shadows = True
            , dimensions = ( Pixels.int screen.width, Pixels.int screen.height )
            }
        , mobileControls player
        ]


onTouchStart msg =
    Event.on "touchstart" (Decode.succeed msg)


onTouchEnd msg =
    Event.on "touchend" (Decode.succeed msg)


mobileControls : Player -> Html Msg
mobileControls player =
    Html.div
        [ Html.style "position" "absolute"
        , Html.style "right" "0"
        , Html.style "bottom" "0"
        , Html.style "width" "30vw"
        , Html.style "height" "30vw"
        , Html.style "font-size" "10vw"
        ]
        [ Html.div
            [ onTouchStart (KeyDown "ArrowUp")
            , onTouchEnd (KeyUp "ArrowUp")
            , Html.style "position" "absolute"
            , Html.style "top" "0"
            , Html.style "left" "10vw"
            ]
            [ Html.text "⬆️️" ]
        , Html.div
            [ onTouchStart (KeyDown "ArrowLeft")
            , onTouchEnd (KeyUp "ArrowLeft")
            , Html.style "position" "absolute"
            , Html.style "top" "9vw"
            , Html.style "left" "0"
            ]
            [ Html.text "⬅️" ]
        , Html.div
            [ onTouchStart (KeyDown "ArrowRight")
            , onTouchEnd (KeyUp "ArrowRight")
            , Html.style "position" "absolute"
            , Html.style "top" "9vw"
            , Html.style "right" "0"
            ]
            [ Html.text "➡️️" ]
        , Html.div
            [ onTouchStart (KeyDown "ArrowDown")
            , onTouchEnd (KeyUp "ArrowDown")
            , Html.style "position" "absolute"
            , Html.style "bottom" "0"
            , Html.style "left" "10vw"
            ]
            [ Html.text "⬇️️️" ]
        ]



-- PLAYER --


type Player
    = Cuboid BlockAnimationState ( Int, Int )


type BlockAnimationState
    = Standing
    | Lying Direction
    | KnockingOver Direction Float
    | GettingUp Direction Float
    | Rolling Direction Float
    | SlideIn Float
    | FallingUnbalanced Direction Float
    | FallingInHorizontalOrientation Direction Float
    | FallingInVerticalOrientation { zOffset : Length, progress : Float }
    | FallingFromTheSky Float
    | FallingWithTheFloor Float


type Cube
    = Cube CubeAnimationState ( Int, Int )


type CubeAnimationState
    = Stable
    | Rotating Direction Float
    | Falling Float


type InteractionMsg
    = InternalUpdate
    | FinishedLevel
    | PushDownTile Length
    | RestartedLevel
    | TriggerActions (List TriggerAction)
    | EmitSound String


playerInit : ( Int, Int ) -> Player
playerInit ( x, y ) =
    Cuboid (FallingFromTheSky 0) ( x, y )


move : Direction -> Player -> Player
move direction player =
    case player of
        Cuboid orientation ( x, y ) ->
            case ( orientation, direction ) of
                ( Standing, fallDirection ) ->
                    Cuboid (KnockingOver fallDirection 0) ( x, y )

                -- Lying Up
                ( Lying Up, Left ) ->
                    Cuboid (Rolling Left 0) ( x, y )

                ( Lying Up, Right ) ->
                    Cuboid (Rolling Right 0) ( x, y )

                ( Lying Up, Up ) ->
                    Cuboid (GettingUp Up 0) ( x - 2, y )

                ( Lying Up, Down ) ->
                    Cuboid (GettingUp Down 0) ( x + 1, y )

                -- Lying Right
                ( Lying Right, Up ) ->
                    Cuboid (Rolling Up 0) ( x, y )

                ( Lying Right, Down ) ->
                    Cuboid (Rolling Down 0) ( x, y )

                ( Lying Right, Left ) ->
                    Cuboid (GettingUp Left 0) ( x, y - 1 )

                ( Lying Right, Right ) ->
                    Cuboid (GettingUp Right 0) ( x, y + 2 )

                -- Lying Down
                ( Lying Down, Up ) ->
                    Cuboid (GettingUp Up 0) ( x - 1, y )

                ( Lying Down, Down ) ->
                    Cuboid (GettingUp Down 0) ( x + 2, y )

                ( Lying Down, Left ) ->
                    Cuboid (Rolling Left 0) ( x + 1, y )

                ( Lying Down, Right ) ->
                    Cuboid (Rolling Right 0) ( x + 1, y )

                -- Lying Left
                ( Lying Left, Up ) ->
                    Cuboid (Rolling Up 0) ( x, y - 1 )

                ( Lying Left, Down ) ->
                    Cuboid (Rolling Down 0) ( x, y - 1 )

                ( Lying Left, Left ) ->
                    Cuboid (GettingUp Left 0) ( x, y - 2 )

                ( Lying Left, Right ) ->
                    Cuboid (GettingUp Right 0) ( x, y + 1 )

                -- Player already in motion (ignore)
                _ ->
                    Cuboid orientation ( x, y )


playerView : Player -> Scene3d.Entity coordinates
playerView player =
    player
        |> playerBlock
        |> Scene3d.blockWithShadow (Material.metal { baseColor = Color.orange, roughness = 2.5 })


playerBlock : Player -> Block3d Length.Meters coordinates
playerBlock player =
    case player of
        Cuboid orientation ( x, y ) ->
            let
                positionX =
                    toFloat x * tileSizeCm

                positionY =
                    toFloat y * tileSizeCm

                block =
                    Block3d.with
                        { x1 = Length.centimeters 0
                        , x2 = Length.centimeters playerWidthCm
                        , y1 = Length.centimeters 0
                        , y2 = Length.centimeters playerWidthCm
                        , z1 = Length.centimeters 0
                        , z2 = Length.centimeters playerHeightCm
                        }
            in
            (case orientation of
                -- +
                Standing ->
                    block

                -- |
                -- 0
                Lying Up ->
                    block
                        |> Block3d.rotateAround topAxis (Angle.degrees 90)
                        |> Block3d.translateIn Direction3d.x tileSize

                -- 0-
                Lying Right ->
                    block
                        |> Block3d.rotateAround rightAxis (Angle.degrees 90)
                        |> Block3d.translateIn Direction3d.negativeY tileSize

                -- 0
                -- |
                Lying Down ->
                    block
                        |> Block3d.rotateAround bottomAxis (Angle.degrees 90)
                        |> Block3d.translateIn Direction3d.negativeX tileSize

                -- -0
                Lying Left ->
                    block
                        |> Block3d.rotateAround leftAxis (Angle.degrees 90)
                        |> Block3d.translateIn Direction3d.y tileSize

                KnockingOver Up progress ->
                    block
                        |> Block3d.rotateAround topAxis (Angle.degrees (progress * 90))

                KnockingOver Right progress ->
                    block
                        |> Block3d.rotateAround rightAxis (Angle.degrees (progress * 90))

                KnockingOver Down progress ->
                    block
                        |> Block3d.rotateAround bottomAxis (Angle.degrees (progress * 90))

                KnockingOver Left progress ->
                    block
                        |> Block3d.rotateAround leftAxis (Angle.degrees (progress * 90))

                GettingUp Up progress ->
                    block
                        |> Block3d.rotateAround bottomAxis (Angle.degrees ((1 - progress) * 90))

                GettingUp Right progress ->
                    block
                        |> Block3d.rotateAround leftAxis (Angle.degrees ((1 - progress) * 90))

                GettingUp Down progress ->
                    block
                        |> Block3d.rotateAround topAxis (Angle.degrees ((1 - progress) * 90))

                GettingUp Left progress ->
                    block
                        |> Block3d.rotateAround rightAxis (Angle.degrees ((1 - progress) * 90))

                Rolling Left progress ->
                    block
                        |> Block3d.rotateAround topAxis (Angle.degrees 90)
                        |> Block3d.translateIn Direction3d.x tileSize
                        |> Block3d.rotateAround leftAxis (Angle.degrees (progress * 90))

                Rolling Right progress ->
                    block
                        |> Block3d.rotateAround topAxis (Angle.degrees 90)
                        |> Block3d.translateIn Direction3d.x tileSize
                        |> Block3d.rotateAround rightAxis (Angle.degrees (progress * 90))

                Rolling Up progress ->
                    block
                        |> Block3d.rotateAround rightAxis (Angle.degrees 90)
                        |> Block3d.translateIn Direction3d.negativeY tileSize
                        |> Block3d.rotateAround topAxis (Angle.degrees (progress * 90))

                Rolling Down progress ->
                    block
                        |> Block3d.rotateAround rightAxis (Angle.degrees 90)
                        |> Block3d.translateIn Direction3d.negativeY tileSize
                        |> Block3d.rotateAround bottomAxis (Angle.degrees (progress * 90))

                SlideIn progress ->
                    Block3d.with
                        { x1 = Length.centimeters 0
                        , x2 = Length.centimeters playerWidthCm
                        , y1 = Length.centimeters 0
                        , y2 = Length.centimeters playerWidthCm
                        , z1 = Length.centimeters 0
                        , z2 = Length.centimeters (playerHeightCm - (progress * progress * 2))
                        }

                FallingUnbalanced Left progress ->
                    block
                        |> Block3d.rotateAround leftAxis (Angle.degrees 90)
                        |> Block3d.translateIn Direction3d.y tileSize
                        |> Block3d.rotateAround leftAxis (Angle.degrees (90 * progress))

                FallingUnbalanced Right progress ->
                    block
                        |> Block3d.rotateAround rightAxis (Angle.degrees 90)
                        |> Block3d.translateIn Direction3d.negativeY tileSize
                        |> Block3d.rotateAround rightAxis (Angle.degrees (90 * progress))

                FallingUnbalanced Up progress ->
                    block
                        |> Block3d.rotateAround topAxis (Angle.degrees 90)
                        |> Block3d.translateIn Direction3d.x tileSize
                        |> Block3d.rotateAround topAxis (Angle.degrees (90 * progress))

                FallingUnbalanced Down progress ->
                    block
                        |> Block3d.rotateAround bottomAxis (Angle.degrees 90)
                        |> Block3d.translateIn Direction3d.negativeX tileSize
                        |> Block3d.rotateAround bottomAxis (Angle.degrees (90 * progress))

                FallingInVerticalOrientation { zOffset, progress } ->
                    block
                        |> Block3d.translateIn Direction3d.negativeZ zOffset
                        |> Block3d.translateIn Direction3d.negativeZ (Length.centimeters progress)

                FallingInHorizontalOrientation Left progress ->
                    block
                        |> Block3d.rotateAround leftAxis (Angle.degrees 90)
                        |> Block3d.translateIn Direction3d.y tileSize
                        |> Block3d.translateIn Direction3d.negativeZ (Length.centimeters progress)

                FallingInHorizontalOrientation Up progress ->
                    block
                        |> Block3d.rotateAround topAxis (Angle.degrees 90)
                        |> Block3d.translateIn Direction3d.x tileSize
                        |> Block3d.translateIn Direction3d.negativeZ (Length.centimeters progress)

                FallingInHorizontalOrientation Right progress ->
                    block
                        |> Block3d.rotateAround rightAxis (Angle.degrees 90)
                        |> Block3d.translateIn Direction3d.negativeY tileSize
                        |> Block3d.translateIn Direction3d.negativeZ (Length.centimeters progress)

                FallingInHorizontalOrientation Down progress ->
                    block
                        |> Block3d.rotateAround bottomAxis (Angle.degrees 90)
                        |> Block3d.translateIn Direction3d.negativeX tileSize
                        |> Block3d.translateIn Direction3d.negativeZ (Length.centimeters progress)

                FallingFromTheSky progress ->
                    block
                        |> Block3d.translateIn Direction3d.z (Length.centimeters ((1 - progress) * 10))

                FallingWithTheFloor progress ->
                    block
                        |> Block3d.translateIn Direction3d.negativeZ (Length.centimeters progress)
            )
                |> Block3d.translateBy
                    (Vector3d.centimeters positionX positionY 0)


topAxis =
    Axis3d.through (Point3d.centimeters 0 0 0) Direction3d.negativeY


rightAxis =
    Axis3d.through (Point3d.centimeters 0 playerWidthCm 0) Direction3d.negativeX


bottomAxis =
    Axis3d.through (Point3d.centimeters playerWidthCm 0 0) Direction3d.y


leftAxis =
    Axis3d.through (Point3d.centimeters 0 0 0) Direction3d.x


playerUpdate : Float -> Level -> Player -> ( Player, Cmd msg )
playerUpdate delta level player =
    case player of
        Cuboid (KnockingOver direction progress) ( x, y ) ->
            let
                newProgress =
                    progress + delta * animationSpeed

                newPlayer =
                    if newProgress >= 1 then
                        Cuboid
                            (Lying direction)
                            (case direction of
                                Up ->
                                    ( x - 1, y )

                                Right ->
                                    ( x, y + 1 )

                                Left ->
                                    ( x, y - 1 )

                                Down ->
                                    ( x + 1, y )
                            )

                    else
                        Cuboid (KnockingOver direction newProgress) ( x, y )
            in
            ( newPlayer, Cmd.none )

        Cuboid (GettingUp direction progress) ( x, y ) ->
            let
                newProgress =
                    progress + delta * animationSpeed

                newPlayer =
                    if newProgress >= 1 then
                        Cuboid Standing ( x, y )

                    else
                        Cuboid (GettingUp direction newProgress) ( x, y )
            in
            ( newPlayer, Cmd.none )

        Cuboid (Rolling direction progress) ( x, y ) ->
            let
                newProgress =
                    progress + delta * animationSpeed

                newPlayer =
                    if newProgress >= 1 then
                        case direction of
                            Left ->
                                Cuboid (Lying Up) ( x, y - 1 )

                            Right ->
                                Cuboid (Lying Up) ( x, y + 1 )

                            Up ->
                                Cuboid (Lying Right) ( x - 1, y )

                            Down ->
                                Cuboid (Lying Right) ( x + 1, y )

                    else
                        Cuboid (Rolling direction newProgress) ( x, y )
            in
            ( newPlayer, Cmd.none )

        Cuboid (SlideIn progress) ( x, y ) ->
            let
                newProgress =
                    min (progress + delta * animationSpeed * 0.5) 1
            in
            ( Cuboid (SlideIn newProgress) ( x, y ), Cmd.none )

        Cuboid (FallingUnbalanced direction progress) ( x, y ) ->
            let
                newProgress =
                    min (progress + delta * animationSpeed) 1
            in
            if newProgress == 1 then
                ( Cuboid (FallingInVerticalOrientation { zOffset = Length.centimeters (0.5 * playerHeightCm), progress = 0 })
                    (case direction of
                        Left ->
                            ( x, y - 1 )

                        Right ->
                            ( x, y + 1 )

                        Down ->
                            ( x + 1, y )

                        Up ->
                            ( x - 1, y )
                    )
                , Cmd.none
                )

            else
                ( Cuboid (FallingUnbalanced direction newProgress) ( x, y ), Cmd.none )

        Cuboid (FallingInVerticalOrientation { zOffset, progress }) ( x, y ) ->
            let
                newProgress =
                    progress + delta * animationSpeed * min (progress + 1) 5
            in
            ( Cuboid (FallingInVerticalOrientation { zOffset = zOffset, progress = newProgress }) ( x, y ), Cmd.none )

        Cuboid (FallingInHorizontalOrientation direction progress) ( x, y ) ->
            let
                newProgress =
                    progress + delta * animationSpeed * min (progress + 1) 5
            in
            ( Cuboid (FallingInHorizontalOrientation direction newProgress) ( x, y ), Cmd.none )

        Cuboid (FallingFromTheSky progress) ( x, y ) ->
            let
                newProgress =
                    min (progress + delta * animationSpeed * 0.3) 1
            in
            if newProgress == 1 then
                ( Cuboid Standing ( x, y ), Cmd.none )

            else
                ( Cuboid (FallingFromTheSky newProgress) ( x, y ), Cmd.none )

        Cuboid (FallingWithTheFloor progress) ( x, y ) ->
            let
                newProgress =
                    progress + delta * animationSpeed * min (progress + 1) 5
            in
            ( Cuboid (FallingWithTheFloor newProgress) ( x, y ), Cmd.none )

        plr ->
            ( plr, Cmd.none )


getPosition : Player -> ( Int, Int )
getPosition (Cuboid _ position) =
    position


fall : Maybe Direction -> Player -> Player
fall unbalancedDirection player =
    case player of
        Cuboid state ( x, y ) ->
            case ( unbalancedDirection, state ) of
                ( _, Standing ) ->
                    Cuboid (FallingInVerticalOrientation { zOffset = Length.centimeters 0, progress = 0 }) ( x, y )

                ( Just Left, Lying Left ) ->
                    Cuboid (FallingUnbalanced Left 0) ( x, y )

                ( Just Left, Lying Right ) ->
                    Cuboid (FallingUnbalanced Left 0) ( x, y + 1 )

                ( Just Right, Lying Left ) ->
                    Cuboid (FallingUnbalanced Right 0) ( x, y + 1 )

                ( Just Right, Lying Right ) ->
                    Cuboid (FallingUnbalanced Right 0) ( x, y )

                ( Just Up, Lying Up ) ->
                    Cuboid (FallingUnbalanced Up 0) ( x, y )

                ( Just Up, Lying Down ) ->
                    Cuboid (FallingUnbalanced Up 0) ( x + 1, y )

                ( Just Down, Lying Up ) ->
                    Cuboid (FallingUnbalanced Down 0) ( x - 1, y )

                ( Just Down, Lying Down ) ->
                    Cuboid (FallingUnbalanced Down 0) ( x, y )

                ( Nothing, Lying direction ) ->
                    Cuboid (FallingInHorizontalOrientation direction 0) ( x, y )

                _ ->
                    Cuboid state ( x, y )


occupiedPositions : Player -> List ( Int, Int )
occupiedPositions player =
    case player of
        Cuboid Standing ( x, y ) ->
            [ ( x, y ) ]

        Cuboid (Lying Left) ( x, y ) ->
            [ ( x, y - 1 ), ( x, y ) ]

        Cuboid (Lying Up) ( x, y ) ->
            [ ( x - 1, y ), ( x, y ) ]

        Cuboid (Lying Right) ( x, y ) ->
            [ ( x, y ), ( x, y + 1 ) ]

        Cuboid (Lying Down) ( x, y ) ->
            [ ( x, y ), ( x + 1, y ) ]

        _ ->
            []


occupiedTiles : Player -> Level -> List LevelTile
occupiedTiles player level =
    player
        |> occupiedPositions
        |> List.map (getTileAt level)


unstablePosition : Player -> Level -> Bool
unstablePosition player level =
    occupiedTiles player level
        |> List.any ((==) Empty)


interact : Level -> Player -> ( Player, InteractionMsg )
interact level player =
    let
        playerOccupiedTiles =
            occupiedTiles player level
    in
    case player of
        Cuboid state ( x, y ) ->
            case ( playerOccupiedTiles, state ) of
                -- Falling off the stage
                ( [ Empty ], _ ) ->
                    ( fall Nothing player, EmitSound "fall" )

                ( [ Empty, Empty ], _ ) ->
                    ( fall Nothing player, EmitSound "fall" )

                ( [ Empty, _ ], Lying Left ) ->
                    ( fall (Just Left) player, EmitSound "fall" )

                ( [ Empty, _ ], Lying Right ) ->
                    ( fall (Just Left) player, EmitSound "fall" )

                ( [ Empty, _ ], Lying Up ) ->
                    ( fall (Just Up) player, EmitSound "fall" )

                ( [ Empty, _ ], Lying Down ) ->
                    ( fall (Just Up) player, EmitSound "fall" )

                ( [ _, Empty ], Lying Left ) ->
                    ( fall (Just Right) player, EmitSound "fall" )

                ( [ _, Empty ], Lying Right ) ->
                    ( fall (Just Right) player, EmitSound "fall" )

                ( [ _, Empty ], Lying Up ) ->
                    ( fall (Just Down) player, EmitSound "fall" )

                ( [ _, Empty ], Lying Down ) ->
                    ( fall (Just Down) player, EmitSound "fall" )

                -- Stomp on rusty tile
                ( [ RustyFloor ], Standing ) ->
                    ( Cuboid (FallingWithTheFloor 0) ( x, y ), EmitSound "break-tile" )

                ( [], FallingWithTheFloor progress ) ->
                    if progress >= 30 then
                        ( playerInit (getStartingPosition level), RestartedLevel )

                    else
                        ( player, PushDownTile (Length.centimeters progress) )

                -- Success
                ( [ Finish ], _ ) ->
                    ( Cuboid (SlideIn 0) ( x, y ), EmitSound "slide-in" )

                ( [], SlideIn progress ) ->
                    ( player
                    , if progress >= 1 then
                        FinishedLevel

                      else
                        InternalUpdate
                    )

                -- Restart
                ( [], FallingInHorizontalOrientation _ progress ) ->
                    if progress >= 30 then
                        ( playerInit (getStartingPosition level), RestartedLevel )

                    else
                        ( player, InternalUpdate )

                ( [], FallingInVerticalOrientation { progress } ) ->
                    if progress >= 30 then
                        ( playerInit (getStartingPosition level), RestartedLevel )

                    else
                        ( player, InternalUpdate )

                -- Trigger activation
                ( [ Trigger _ actions, _ ], Lying _ ) ->
                    ( player, TriggerActions actions )

                ( [ _, Trigger _ actions ], Lying _ ) ->
                    ( player, TriggerActions actions )

                ( [ Trigger _ actions ], Standing ) ->
                    ( player, TriggerActions actions )

                -- Nothing to be done
                _ ->
                    ( player, InternalUpdate )



-- LEVELS --


levels =
    [ level1, level2, level3 ]


level1 =
    levelFromData
        [ [ Floor, Floor, Floor, Empty, Empty, Empty, Floor, Floor, Floor ]
        , [ Floor, Floor, Floor, Floor, Floor, Floor, Floor, Finish, Floor ]
        , [ Empty, Empty, Empty, Floor, Floor, Floor, Floor, Floor, Floor ]
        , []
        ]
        ( 1, 1 )


level2 =
    levelFromData
        [ [ Floor, Floor, Floor ]
        , [ Floor, Floor, Floor, Floor, Floor, Floor ]
        , [ Floor, Floor, Floor, Floor, Floor, Floor, Floor, Floor, Floor ]
        , [ Empty, Floor, Floor, Floor, Floor, Floor, Floor, Floor, Floor, Floor ]
        , [ Empty, Empty, Empty, Empty, Empty, Floor, Floor, Finish, Floor, Floor ]
        , [ Empty, Empty, Empty, Empty, Empty, Empty, Floor, Floor, Floor ]
        , []
        ]
        ( 1, 1 )


level3 =
    levelFromData
        [ [ Floor, Floor, Floor, Floor, Empty, Empty, Floor, Floor, Floor ]
        , [ Floor
          , Floor
          , Trigger Color.red
                [ ToggleTriggerColor ( 1, 2 ) Color.green
                , ToggleBridge ( 3, 4 )
                , ToggleBridge ( 3, 5 )
                ]
          , Floor
          , Empty
          , Empty
          , Floor
          , Finish
          , Floor
          ]
        , [ Floor, Floor, Floor, Floor, Empty, Empty, Floor, Floor, Floor ]
        , [ Floor, Floor, Floor, Floor, Bridge Left False, Bridge Right False, Floor, Floor, Floor ]
        , []
        ]
        ( 3, 1 )


type LevelTile
    = Empty
    | Floor
    | RustyFloor
    | Finish
    | Bridge Direction Bool
    | Trigger Color (List TriggerAction)


type TriggerAction
    = ToggleBridge ( Int, Int )
    | CloseBridge ( Int, Int )
    | OpenBridge ( Int, Int )
    | SetTriggerColor ( Int, Int ) Color
    | ToggleTriggerColor ( Int, Int ) Color


type TileState
    = PushDown Length
    | BridgeState Bool Float
    | TriggerState Color


type Level
    = Level
        { tiles : Array (Array LevelTile)
        , tileStates : Dict ( Int, Int ) TileState
        , startingPosition : ( Int, Int )
        , big : Bool
        }


levelFromData : List (List LevelTile) -> ( Int, Int ) -> Level
levelFromData tiles start =
    let
        width =
            List.map List.length tiles |> List.foldl max 0

        height =
            List.length tiles
    in
    Level
        { tiles =
            tiles
                |> List.map Array.fromList
                |> Array.fromList
        , tileStates = Dict.empty
        , startingPosition = start
        , big = width >= 15 || height >= 15
        }


getStartingPosition : Level -> ( Int, Int )
getStartingPosition (Level { startingPosition }) =
    startingPosition


getTileAt : Level -> ( Int, Int ) -> LevelTile
getTileAt ((Level { tileStates }) as level) location =
    let
        originalTile =
            getTileAtInternal level location
    in
    case originalTile of
        Bridge _ initiallyClosed ->
            case Dict.get location tileStates of
                Just (BridgeState closed _) ->
                    if closed then
                        originalTile

                    else
                        Empty

                _ ->
                    if initiallyClosed then
                        originalTile

                    else
                        Empty

        a ->
            a


getTileAtInternal : Level -> ( Int, Int ) -> LevelTile
getTileAtInternal (Level { tiles }) ( x, y ) =
    Array.get x tiles
        |> Maybe.map (\row -> Array.get y row |> Maybe.withDefault Empty)
        |> Maybe.withDefault Empty


shiftTile : ( Int, Int ) -> Length -> Level -> Level
shiftTile location zOffset (Level level) =
    Level { level | tileStates = Dict.insert location (PushDown zOffset) level.tileStates }


triggerActions : List TriggerAction -> Level -> ( Level, Cmd a )
triggerActions actions ((Level levelData) as level) =
    List.foldl
        (\action ( levelAcc, cmdAcc ) ->
            (case action of
                ToggleBridge ( x, y ) ->
                    toggleBridge not ( x, y ) levelAcc

                CloseBridge ( x, y ) ->
                    toggleBridge (always True) ( x, y ) levelAcc

                OpenBridge ( x, y ) ->
                    toggleBridge (always False) ( x, y ) levelAcc

                SetTriggerColor ( x, y ) newColor ->
                    ( Level { levelData | tileStates = Dict.insert ( x, y ) (TriggerState newColor) levelData.tileStates }
                    , Cmd.none
                    )

                ToggleTriggerColor ( x, y ) secondColor ->
                    ( Level
                        { levelData
                            | tileStates =
                                case Dict.get ( x, y ) levelData.tileStates of
                                    Just _ ->
                                        Dict.remove ( x, y ) levelData.tileStates

                                    Nothing ->
                                        Dict.insert ( x, y ) (TriggerState secondColor) levelData.tileStates
                        }
                    , Cmd.none
                    )
            )
                |> Tuple.mapSecond (\cmd -> Cmd.batch [ cmdAcc, cmd ])
        )
        ( level, Cmd.none )
        actions


toggleBridge : (Bool -> Bool) -> ( Int, Int ) -> Level -> ( Level, Cmd a )
toggleBridge mapPreviousState ( x, y ) (Level level) =
    case Dict.get ( x, y ) level.tileStates of
        Just (BridgeState closed progress) ->
            ( Level { level | tileStates = Dict.insert ( x, y ) (BridgeState (mapPreviousState closed) progress) level.tileStates }
            , Cmd.none
            )

        _ ->
            let
                initiallyClosed =
                    case getTileAtInternal (Level level) ( x, y ) of
                        Bridge _ initValue ->
                            initValue

                        _ ->
                            False

                newClosed =
                    mapPreviousState initiallyClosed

                progress =
                    if newClosed then
                        0

                    else
                        1
            in
            ( Level { level | tileStates = Dict.insert ( x, y ) (BridgeState newClosed progress) level.tileStates }
            , Cmd.none
            )


restart : Level -> Level
restart (Level level) =
    Level { level | tileStates = Dict.empty }


levelUpdate : Float -> Level -> Level
levelUpdate delta (Level level) =
    Level { level | tileStates = Dict.map (always (updateTileState delta)) level.tileStates }


updateTileState : Float -> TileState -> TileState
updateTileState delta tile =
    case tile of
        BridgeState True progress ->
            BridgeState True (min (progress + animationSpeed * delta) 1)

        BridgeState False progress ->
            BridgeState False (max (progress - animationSpeed * delta) 0)

        a ->
            a


levelView : Level -> Scene3d.Entity coordinates
levelView (Level { tiles, tileStates }) =
    tiles
        |> Array.indexedMap
            (\x row ->
                Array.indexedMap
                    (\y tile ->
                        case tile of
                            Floor ->
                                floorEntity Color.gray ( x, y )

                            Empty ->
                                Scene3d.nothing

                            Finish ->
                                floorEntity Color.black ( x, y )

                            RustyFloor ->
                                floorEntity Color.lightOrange ( x, y )
                                    |> (case Dict.get ( x, y ) tileStates of
                                            Just (PushDown zOffset) ->
                                                Scene3d.translateIn Direction3d.negativeZ zOffset

                                            _ ->
                                                identity
                                       )

                            Trigger initialColor _ ->
                                triggerEntity
                                    (case Dict.get ( x, y ) tileStates of
                                        Just (TriggerState color) ->
                                            color

                                        _ ->
                                            initialColor
                                    )
                                    ( x, y )

                            Bridge openingDirection initiallyClosed ->
                                floorEntity Color.darkYellow ( x, y )
                                    |> (case
                                            Maybe.withDefault
                                                (BridgeState initiallyClosed
                                                    (if initiallyClosed then
                                                        1

                                                     else
                                                        0
                                                    )
                                                )
                                                (Dict.get ( x, y ) tileStates)
                                        of
                                            BridgeState _ progress ->
                                                let
                                                    axis =
                                                        case openingDirection of
                                                            Up ->
                                                                Axis3d.through (Point3d.centimeters (toFloat x * tileSizeCm) (toFloat y * tileSizeCm) -0.1) Direction3d.negativeY

                                                            Right ->
                                                                Axis3d.through (Point3d.centimeters (toFloat x * tileSizeCm) (toFloat (y + 1) * tileSizeCm) -0.1) Direction3d.negativeX

                                                            Down ->
                                                                Axis3d.through (Point3d.centimeters (toFloat (x + 1) * tileSizeCm) (toFloat y * tileSizeCm) -0.1) Direction3d.y

                                                            Left ->
                                                                Axis3d.through (Point3d.centimeters (toFloat x * tileSizeCm) (toFloat y * tileSizeCm) -0.1) Direction3d.x
                                                in
                                                Scene3d.rotateAround axis (Angle.degrees (-180 * (1 - progress)))

                                            _ ->
                                                identity
                                       )
                    )
                    row
                    |> Array.toList
            )
        |> Array.toList
        |> List.concatMap identity
        |> Scene3d.group


floorEntity color ( x, y ) =
    let
        tileBorderSizeCm =
            tileSizeCm * 0.02
    in
    Scene3d.block
        (Material.matte color)
        (Block3d.with
            { x1 = Length.centimeters (tileSizeCm * toFloat x + tileBorderSizeCm)
            , x2 = Length.centimeters (tileSizeCm * toFloat (x + 1) - tileBorderSizeCm)
            , y1 = Length.centimeters (tileSizeCm * toFloat y + tileBorderSizeCm)
            , y2 = Length.centimeters (tileSizeCm * toFloat (y + 1) - tileBorderSizeCm)
            , z1 = Length.centimeters (tileSizeCm * -0.1)
            , z2 = Length.centimeters 0
            }
        )


triggerEntity color ( x, y ) =
    let
        buttonPaddingCm =
            tileSizeCm * 0.2
    in
    Scene3d.group
        [ floorEntity Color.gray ( x, y )
        , Scene3d.block
            (Material.matte color)
            (Block3d.with
                { x1 = Length.centimeters (tileSizeCm * toFloat x + buttonPaddingCm)
                , x2 = Length.centimeters (tileSizeCm * toFloat (x + 1) - buttonPaddingCm)
                , y1 = Length.centimeters (tileSizeCm * toFloat y + buttonPaddingCm)
                , y2 = Length.centimeters (tileSizeCm * toFloat (y + 1) - buttonPaddingCm)
                , z1 = Length.centimeters 0
                , z2 = Length.centimeters (tileSizeCm * 0.1)
                }
            )
        ]


isBigLevel : Level -> Bool
isBigLevel (Level { big }) =
    big


levelIsBusy : Level -> Bool
levelIsBusy (Level { tileStates }) =
    tileStates
        |> Dict.values
        |> List.any
            (\state ->
                case state of
                    BridgeState True x ->
                        x < 1

                    BridgeState False x ->
                        x > 0

                    _ ->
                        False
            )

```