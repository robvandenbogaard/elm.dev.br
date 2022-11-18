# Listing: Flatris

Het bekende spel in platte vorm, gemaakt door [Andrey Kuzmin](https://github.com/w0rm/elm-flatris). Deze listing kun je copy pasten in de [Compurob Workshop](https://compurob.nl/workshop). 

``` haskell
module Main exposing (main)

import Browser
import Browser.Dom exposing (Viewport, getViewport)
import Browser.Events exposing (onAnimationFrameDelta, onKeyDown, onKeyUp, onResize)
import Html exposing (Html, div, text, button)
import Html.Attributes exposing (style)
import Html.Events exposing (keyCode, onMouseUp, onMouseDown, onClick, on)
import Json.Decode as Decode
import Json.Encode exposing (Value)
import Task
import Json.Decode as Decode exposing (Decoder)
import Json.Encode as Encode
import Random
import Svg
import Svg.Attributes as SvgAttrs

random : Random.Seed -> ( Grid Color, Random.Seed )
random seed =
    let
        number =
            Random.int 0 (List.length tetriminos - 1)

        tetrimino n =
            Maybe.withDefault empty (List.head (List.drop n tetriminos))
    in
    Random.step (Random.map tetrimino number) seed


tetriminos : List (Grid Color)
tetriminos =
    List.map
        (\( a, b ) -> fromList a b)
        [ ( rgb 60 199 214, [ ( 0, 0 ), ( 1, 0 ), ( 2, 0 ), ( 3, 0 ) ] )
        , ( rgb 251 180 20, [ ( 0, 0 ), ( 1, 0 ), ( 0, 1 ), ( 1, 1 ) ] )
        , ( rgb 176 68 151, [ ( 1, 0 ), ( 0, 1 ), ( 1, 1 ), ( 2, 1 ) ] )
        , ( rgb 57 147 208, [ ( 0, 0 ), ( 0, 1 ), ( 1, 1 ), ( 2, 1 ) ] )
        , ( rgb 237 101 47, [ ( 2, 0 ), ( 0, 1 ), ( 1, 1 ), ( 2, 1 ) ] )
        , ( rgb 149 196 61, [ ( 1, 0 ), ( 2, 0 ), ( 0, 1 ), ( 1, 1 ) ] )
        , ( rgb 232 65 56, [ ( 0, 0 ), ( 1, 0 ), ( 1, 1 ), ( 2, 1 ) ] )
        ]


type State
    = Paused
    | Playing
    | Stopped


decodeState : String -> State
decodeState string =
    case string of
        "paused" ->
            Paused

        "playing" ->
            Playing

        _ ->
            Stopped


encodeState : State -> String
encodeState state =
    case state of
        Paused ->
            "paused"

        Playing ->
            "playing"

        Stopped ->
            "stopped"


type alias AnimationState =
    Maybe { active : Bool, elapsed : Float }


type alias Model =
    { size : ( Float, Float )
    , active : Grid Color
    , position : ( Int, Float )
    , grid : Grid Color
    , lines : Int
    , next : Grid Color
    , score : Int
    , seed : Random.Seed
    , state : State
    , acceleration : Bool
    , moveLeft : Bool
    , moveRight : Bool
    , direction : AnimationState
    , rotation : AnimationState
    , width : Int
    , height : Int
    }


initial : Model
initial =
    let
        ( next, seed ) =
            random (Random.initialSeed 0)
    in
    spawnTetrimino
        { size = ( 0, 0 )
        , active = empty
        , position = ( 0, 0 )
        , grid = empty
        , lines = 0
        , next = next
        , score = 0
        , seed = Random.initialSeed 0
        , state = Stopped
        , acceleration = False
        , moveLeft = False
        , moveRight = False
        , rotation = Nothing
        , direction = Nothing
        , width = 10
        , height = 20
        }


spawnTetrimino : Model -> Model
spawnTetrimino model =
    let
        ( next, seed ) =
            random model.seed

        ( x, y ) =
            initPosition model.width model.next
    in
    { model
        | next = next
        , seed = seed
        , active = model.next
        , position = ( x, toFloat y )
    }


decode : Decode.Decoder Model
decode =
    Decode.map8
        (\active positionX positionY grid lines next score state ->
            { initial
                | active = active
                , position = ( positionX, positionY )
                , grid = grid
                , lines = lines
                , next = next
                , score = score
                , state = state
            }
        )
        (Decode.field "active" (gridDecode colorDecode))
        (Decode.field "positionX" Decode.int)
        (Decode.field "positionY" Decode.float)
        (Decode.field "grid" (gridDecode colorDecode))
        (Decode.field "lines" Decode.int)
        (Decode.field "next" (gridDecode colorDecode))
        (Decode.field "score" Decode.int)
        (Decode.field "state" (Decode.map decodeState Decode.string))


encode : Int -> Model -> String
encode indent model =
    Encode.encode
        indent
        (Encode.object
            [ ( "active", gridEncode colorEncode model.active )
            , ( "positionX", Encode.int (Tuple.first model.position) )
            , ( "positionY", Encode.float (Tuple.second model.position) )
            , ( "grid", gridEncode colorEncode model.grid )
            , ( "lines", Encode.int model.lines )
            , ( "next", gridEncode colorEncode model.next )
            , ( "score", Encode.int model.score )
            , ( "state", Encode.string (encodeState model.state) )
            ]
        )

type Msg
    = Start
    | Pause
    | Resume
    | Tick Float
    | UnlockButtons
    | MoveLeft Bool
    | MoveRight Bool
    | Rotate Bool
    | Accelerate Bool
    | Resize Int Int
    | GetViewport Viewport
    | Noop

main : Program Value Model Msg
main =
    Browser.element
        { init =
            \value ->
                ( value
                    |> Decode.decodeValue decode
                    |> Result.withDefault initial
                , Task.perform GetViewport getViewport
                )
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ if model.state == Playing then
            onAnimationFrameDelta Tick

          else
            Sub.none
        , onKeyUp (Decode.map (key False) keyCode)
        , onKeyDown (Decode.map (key True) keyCode)
        , onResize Resize
        ]


key : Bool -> Int -> Msg
key on keycode =
    case keycode of
        37 ->
            MoveLeft on

        39 ->
            MoveRight on

        40 ->
            Accelerate on

        38 ->
            Rotate on

        _ ->
            Noop

------------
-- Update --
------------

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Resize width height ->
            ( { model | size = ( toFloat width, toFloat height ) }
            , Cmd.none
            )

        GetViewport { viewport } ->
            ( { model
                | size =
                    ( viewport.width
                    , viewport.height
                    )
              }
            , Cmd.none
            )

        Start ->
            ( { model
                | state = Playing
                , lines = 0
                , score = 0
                , grid = empty
              }
            , Cmd.none
            )

        Pause ->
            ( { model | state = Paused }
            , Cmd.none
            )
        Resume ->
            ( { model | state = Playing }
            , Cmd.none
            )

        MoveLeft on ->
            ( startMove { model | moveLeft = on }
            , Cmd.none
            )

        MoveRight on ->
            ( startMove { model | moveRight = on }
            , Cmd.none
            )

        Rotate False ->
            ( { model | rotation = Nothing }
            , Cmd.none
            )

        Rotate True ->
            ( { model | rotation = Just { active = True, elapsed = 0 } }
            , Cmd.none
            )

        Accelerate on ->
            ( { model | acceleration = on }
            , Cmd.none
            )

        UnlockButtons ->
            ( { model | rotation = Nothing, direction = Nothing, acceleration = False }
            , Cmd.none
            )

        Tick time ->
            (model
                |> animate (min time 25)
            , Cmd.none
            )
        Noop ->
            ( model, Cmd.none )


animate : Float -> Model -> Model
animate elapsed model =
    model
        |> moveTetrimino elapsed
        |> rotateTetrimino elapsed
        |> dropTetrimino elapsed
        |> checkEndGame


direction : Model -> Int
direction { moveLeft, moveRight } =
    case ( moveLeft, moveRight ) of
        ( True, False ) ->
            -1

        ( False, True ) ->
            1

        _ ->
            0


startMove : Model -> Model
startMove model =
    if direction model /= 0 then
        { model | direction = Just { active = True, elapsed = 0 } }

    else
        { model | direction = Nothing }


moveTetrimino : Float -> Model -> Model
moveTetrimino elapsed model =
    case model.direction of
        Just state ->
            { model | direction = Just (activateButton 150 elapsed state) }
                |> (if state.active then
                        moveTetrimino_ (direction model)

                    else
                        identity
                   )

        Nothing ->
            model


moveTetrimino_ : Int -> Model -> Model
moveTetrimino_ dx model =
    let
        ( x, y ) =
            model.position

        x_ =
            x + dx
    in
    if collide model.width model.height x_ (floor y) model.active model.grid then
        model

    else
        { model | position = ( x_, y ) }


activateButton : Float -> Float -> { a | active : Bool, elapsed : Float } -> { a | active : Bool, elapsed : Float }
activateButton interval elapsed state =
    let
        elapsed_ =
            state.elapsed + elapsed
    in
    if elapsed_ > interval then
        { state | active = True, elapsed = elapsed_ - interval }

    else
        { state | active = False, elapsed = elapsed_ }


rotateTetrimino : Float -> Model -> Model
rotateTetrimino elapsed model =
    case model.rotation of
        Just rotation ->
            { model | rotation = Just (activateButton 300 elapsed rotation) }
                |> (if rotation.active then
                        rotateTetrimino_

                    else
                        identity
                   )

        Nothing ->
            model


rotateTetrimino_ : Model -> Model
rotateTetrimino_ model =
    let
        ( x, y ) =
            model.position

        rotated =
            rotate True model.active

        shiftPosition deltas =
            case deltas of
                dx :: remainingDeltas ->
                    if collide model.width model.height (x + dx) (floor y) rotated model.grid then
                        shiftPosition remainingDeltas

                    else
                        { model
                            | active = rotated
                            , position = ( x + dx, y )
                        }

                [] ->
                    model
    in
    shiftPosition [ 0, 1, -1, 2, -2 ]


checkEndGame : Model -> Model
checkEndGame model =
    if List.any identity (mapToList (\_ ( _, y ) -> y < 0) model.grid) then
        { model | state = Stopped }

    else
        model


dropTetrimino : Float -> Model -> Model
dropTetrimino elapsed model =
    let
        ( x, y ) =
            model.position

        speed =
            if model.acceleration then
                25

            else
                max 25 (800 - 25 * toFloat (level model - 1))

        y_ =
            y + elapsed / speed
    in
    if collide model.width model.height x (floor y_) model.active model.grid then
        let
            score =
                List.length (mapToList (\_ _ _ -> True) model.active)
        in
        { model
            | grid = stamp x (floor y) model.active model.grid
            , score =
                model.score
                    + score
                    * (if model.acceleration then
                        2

                       else
                        1
                      )
        }
            |> spawnTetrimino
            |> clearLines

    else
        { model | position = ( x, y_ ) }


clearLines : Model -> Model
clearLines model =
    let
        ( grid, lines ) =
            gridClearLines model.width model.grid

        bonus =
            case lines of
                0 ->
                    0

                1 ->
                    100

                2 ->
                    300

                3 ->
                    500

                _ ->
                    800
    in
    { model
        | grid = grid
        , score = model.score + bonus * level model
        , lines = model.lines + lines
    }


level : Model -> Int
level model =
    model.lines // 10 + 1


-----------
-- Color --
-----------

type Color
    = Color { red : Int, green : Int, blue : Int }


rgb : Int -> Int -> Int -> Color
rgb red green blue =
    Color { red = red, green = green, blue = blue }


toRgb : Color -> { red : Int, green : Int, blue : Int }
toRgb (Color rawRgb) =
    rawRgb


toString : Color -> String
toString (Color { red, green, blue }) =
    "rgb("
        ++ String.fromInt red
        ++ ","
        ++ String.fromInt green
        ++ ","
        ++ String.fromInt blue
        ++ ")"


colorDecode : Decode.Decoder Color
colorDecode =
    Decode.map3 rgb
        (Decode.index 0 Decode.int)
        (Decode.index 1 Decode.int)
        (Decode.index 2 Decode.int)


colorEncode : Color -> Encode.Value
colorEncode (Color { red, green, blue }) =
    Encode.list Encode.int [ red, green, blue ]


----------
-- Grid --
----------

type alias Cell a =
    { val : a
    , pos : ( Int, Int )
    }


type alias Grid a =
    List (Cell a)


fromList : a -> List ( Int, Int ) -> Grid a
fromList value =
    List.map (Cell value)


mapToList : (a -> ( Int, Int ) -> b) -> Grid a -> List b
mapToList fun =
    List.map (\{ val, pos } -> fun val pos)


empty : Grid a
empty =
    []



-- rotates grid around center of mass


rotate : Bool -> Grid a -> Grid a
rotate clockwise grid =
    let
        ( x, y ) =
            centerOfMass grid

        fn cell =
            if clockwise then
                { cell | pos = ( 1 + y - Tuple.second cell.pos, -x + y + Tuple.first cell.pos ) }

            else
                { cell | pos = ( -y + x + Tuple.second cell.pos, 1 + x - Tuple.first cell.pos ) }
    in
    List.map fn grid



-- stamps a grid into another grid with predefined offset


stamp : Int -> Int -> Grid a -> Grid a -> Grid a
stamp x y sample grid =
    case sample of
        [] ->
            grid

        cell :: rest ->
            let
                newPos =
                    ( Tuple.first cell.pos + x, Tuple.second cell.pos + y )

                newCell =
                    { cell | pos = newPos }
            in
            stamp x y rest ({ cell | pos = newPos } :: List.filter (\{ pos } -> pos /= newPos) grid)



-- collides a positioned sample with bounds and a grid


collide : Int -> Int -> Int -> Int -> Grid a -> Grid a -> Bool
collide wid hei x y sample grid =
    case sample of
        [] ->
            False

        cell :: rest ->
            let
                ( x_, y_ ) =
                    ( Tuple.first cell.pos + x, Tuple.second cell.pos + y )
            in
            if (x_ >= wid) || (x_ < 0) || (y_ >= hei) || List.member ( x_, y_ ) (List.map .pos grid) then
                True

            else
                collide wid hei x y rest grid



-- finds the first full line to be cleared


fullLine : Int -> Grid a -> Maybe Int
fullLine wid grid =
    case grid of
        [] ->
            Nothing

        cell :: _ ->
            let
                lineY =
                    Tuple.second cell.pos

                ( inline, remaining ) =
                    List.partition (\{ pos } -> Tuple.second pos == lineY) grid
            in
            if List.length inline == wid then
                Just lineY

            else
                fullLine wid remaining



-- returns updated grid and number of cleared lines


gridClearLines : Int -> Grid a -> ( Grid a, Int )
gridClearLines wid grid =
    case fullLine wid grid of
        Nothing ->
            ( grid, 0 )

        Just lineY ->
            let
                clearedGrid =
                    List.filter (\{ pos } -> Tuple.second pos /= lineY) grid

                ( above, below ) =
                    List.partition (\{ pos } -> Tuple.second pos < lineY) clearedGrid

                droppedAbove =
                    List.map (\c -> { c | pos = ( Tuple.first c.pos, Tuple.second c.pos + 1 ) }) above

                ( newGrid, lines ) =
                    gridClearLines wid (droppedAbove ++ below)
            in
            ( newGrid, lines + 1 )


size : Grid a -> ( Int, Int )
size grid =
    let
        ( x, y ) =
            List.unzip (List.map .pos grid)

        dimension d =
            Maybe.withDefault 0 (List.maximum (List.map (\a -> a + 1) d))
    in
    ( dimension x, dimension y )


centerOfMass : Grid a -> ( Int, Int )
centerOfMass grid =
    let
        len =
            toFloat (List.length grid)

        ( x, y ) =
            List.unzip (List.map .pos grid)
    in
    ( round (toFloat (List.sum x) / len)
    , round (toFloat (List.sum y) / len)
    )


gridDecode : Decoder a -> Decoder (Grid a)
gridDecode cell =
    Decode.list
        (Decode.map2
            Cell
            (Decode.field "val" cell)
            (Decode.field "pos" (Decode.map2 (\a b -> ( a, b )) (Decode.index 0 Decode.int) (Decode.index 1 Decode.int)))
        )


gridEncode : (a -> Value) -> Grid a -> Value
gridEncode cell grid =
    let
        encodeCell { val, pos } =
            Encode.object
                [ ( "pos"
                  , Encode.list Encode.int
                        [ Tuple.first pos
                        , Tuple.second pos
                        ]
                  )
                , ( "val", cell val )
                ]
    in
    Encode.list encodeCell grid


initPosition : Int -> Grid a -> ( Int, Int )
initPosition wid grid =
    let
        ( x, _ ) =
            centerOfMass grid

        y =
            Maybe.withDefault 0 (List.maximum (List.map (Tuple.second << .pos) grid))
    in
    ( wid // 2 - x, -y - 1 )


----------
-- View --
----------

onTouchStart : Msg -> Html.Attribute Msg
onTouchStart msg =
    on "touchstart" (Decode.succeed msg)


onTouchEnd : Msg -> Html.Attribute Msg
onTouchEnd msg =
    on "touchend" (Decode.succeed msg)


renderBox : (Color -> Color) -> Color -> ( Int, Int ) -> Html Msg
renderBox fun c ( x, y ) =
    Svg.rect
        [ SvgAttrs.width (String.fromInt 30)
        , SvgAttrs.height (String.fromInt 30)
        , SvgAttrs.fill (toString (fun c))
        , SvgAttrs.stroke (toString (fun c))
        , SvgAttrs.strokeWidth "0.5"
        , SvgAttrs.x (String.fromInt (x * 30))
        , SvgAttrs.y (String.fromInt (y * 30))
        ]
        []


renderNext : Grid Color -> Html Msg
renderNext grid =
    let
        ( width, height ) =
            size grid
    in
    grid
        |> mapToList
            (renderBox (always (rgb 236 240 241)))
        |> Svg.svg
            [ SvgAttrs.width (String.fromInt (width * 30))
            , SvgAttrs.height (String.fromInt (height * 30))
            ]


renderWell : Model -> Html Msg
renderWell { width, height, active, grid, position } =
    grid
        |> stamp (Tuple.first position) (floor (Tuple.second position)) active
        |> mapToList (renderBox identity)
        |> (::)
            (Svg.rect
                [ SvgAttrs.width (String.fromInt (width * 30))
                , SvgAttrs.height (String.fromInt (height * 30))
                , SvgAttrs.fill "rgb(236, 240, 241)"
                ]
                []
            )
        |> Svg.svg
            [ SvgAttrs.width (String.fromInt (width * 30))
            , SvgAttrs.height (String.fromInt (height * 30))
            ]


renderTitle : String -> Html Msg
renderTitle txt =
    div
        [ style "color" "#34495f"
        , style "font-size" "40px"
        , style "line-height" "60px"
        , style "margin" "30px 0 0"
        ]
        [ text txt ]


renderLabel : String -> Html Msg
renderLabel txt =
    div
        [ style "color" "#bdc3c7"
        , style "font-weight" "300"
        , style "line-height" "1"
        , style "margin" "30px 0 0"
        ]
        [ text txt ]


renderCount : Int -> Html Msg
renderCount n =
    div
        [ style "color" "#3993d0"
        , style "font-size" "30px"
        , style "line-height" "1"
        , style "margin" "5px 0 0"
        ]
        [ text (String.fromInt n) ]


renderGameButton : State -> Html Msg
renderGameButton state =
    let
        ( txt, msg ) =
            case state of
                Stopped ->
                    ( "New game", Start )

                Playing ->
                    ( "Pause", Pause )

                Paused ->
                    ( "Resume", Resume )
    in
    button
        [ style "background" "#34495f"
        , style "border" "0"
        , style "bottom" "30px"
        , style "color" "#fff"
        , style "cursor" "pointer"
        , style "display" "block"
        , style "font-family" "Helvetica, Arial, sans-serif"
        , style "font-size" "18px"
        , style "font-weight" "300"
        , style "height" "60px"
        , style "left" "30px"
        , style "line-height" "60px"
        , style "outline" "none"
        , style "padding" "0"
        , style "position" "absolute"
        , style "width" "120px"
        , onClick msg
        ]
        [ text txt ]


renderPanel : Model -> Html Msg
renderPanel { score, lines, next, state } =
    div
        [ style "bottom" "80px"
        , style "color" "#34495f"
        , style "font-family" "Helvetica, Arial, sans-serif"
        , style "font-size" "14px"
        , style "left" "300px"
        , style "padding" "0 30px"
        , style "position" "absolute"
        , style "right" "0"
        , style "top" "0"
        ]
        [ renderTitle "Flatris"
        , renderLabel "Score"
        , renderCount score
        , renderLabel "Lines Cleared"
        , renderCount lines
        , renderLabel "Next Shape"
        , div
            [ style "margin-top" "10px"
            , style "position" "relative"
            ]
            [ renderNext next ]
        , renderGameButton state
        ]


renderControlButton : String -> List (Html.Attribute Msg) -> Html Msg
renderControlButton txt attrs =
    div
        ([ style "background" "#ecf0f1"
         , style "border" "0"
         , style "color" "#34495f"
         , style "cursor" "pointer"
         , style "text-align" "center"
         , style "-webkit-user-select" "none"
         , style "display" "block"
         , style "float" "left"
         , style "font-family" "Helvetica, Arial, sans-serif"
         , style "font-size" "24px"
         , style "font-weight" "300"
         , style "height" "60px"
         , style "line-height" "60px"
         , style "margin" "20px 20px 0 0"
         , style "outline" "none"
         , style "padding" "0"
         , style "width" "60px"
         ]
            ++ attrs
        )
        [ text txt ]


renderControls : Html Msg
renderControls =
    div
        [ style "height" "80px"
        , style "left" "0"
        , style "position" "absolute"
        , style "top" "600px"
        ]
        [ renderControlButton "↻"
            [ onMouseDown (Rotate True)
            , onMouseUp (Rotate False)
            , onTouchStart (Rotate True)
            , onTouchEnd (Rotate False)
            ]
        , renderControlButton "←"
            [ onMouseDown (MoveLeft True)
            , onMouseUp (MoveLeft False)
            , onTouchStart (MoveLeft True)
            , onTouchEnd (MoveLeft False)
            ]
        , renderControlButton "→"
            [ onMouseDown (MoveRight True)
            , onMouseUp (MoveRight False)
            , onTouchStart (MoveRight True)
            , onTouchEnd (MoveRight False)
            ]
        , renderControlButton "↓"
            [ onMouseDown (Accelerate True)
            , onMouseUp (Accelerate False)
            , onTouchStart (Accelerate True)
            , onTouchEnd (Accelerate False)
            ]
        ]


renderInfo : State -> Html Msg
renderInfo state =
    div
        [ style "background" "rgba(236, 240, 241, 0.85)"
        , style "color" "#34495f"
        , style "font-family" "Helvetica, Arial, sans-serif"
        , style "font-size" "18px"
        , style "height" "600px"
        , style "left" "0"
        , style "line-height" "1.5"
        , style "padding" "0 15px"
        , style "position" "absolute"
        , style "top" "0"
        , style "width" "270px"
        , style "display"
            (if state == Playing then
                "none"

             else
                "block"
            )
        ]
        []


pixelWidth : Float
pixelWidth =
    480


pixelHeight : Float
pixelHeight =
    680


view : Model -> Html Msg
view model =
    let
        ( w, h ) =
            model.size

        r =
            if w / h > pixelWidth / pixelHeight then
                min 1 (h / pixelHeight)

            else
                min 1 (w / pixelWidth)
    in
    div
        [ onTouchEnd UnlockButtons
        , onMouseUp UnlockButtons
        , style "width" "100%"
        , style "height" "100%"
        , style "position" "absolute"
        , style "left" "0"
        , style "top" "0"
        ]
        [ div
            [ style "width" (String.fromFloat pixelWidth ++ "px")
            , style "height" (String.fromFloat pixelHeight ++ "px")
            , style "position" "absolute"
            , style "left" (String.fromFloat ((w - pixelWidth * r) / 2) ++ "px")
            , style "top" (String.fromFloat ((h - pixelHeight * r) / 2) ++ "px")
            , style "transform-origin" "0 0"
            , style "transform" ("scale(" ++ String.fromFloat r ++ ")")
            ]
            [ renderWell model
            , renderControls
            , renderPanel model
            , renderInfo model.state
            ]
        ]

```