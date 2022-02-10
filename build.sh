rm -rf book
mdbook build
cp -r book/* build/
echo "Adicionando tag do Google Analytics dentro da head de todas as páginas HTML"
sed -i "s#</head>#<script async src="https://www.googletagmanager.com/gtag/js?id=G-E1ET4YFLQM"> </script> <script> window.dataLayer = window.dataLayer || []; function gtag(){dataLayer.push(arguments);} gtag('js', new Date()); gtag('config', 'G-E1ET4YFLQM'); </script> </head>#g" build/*.html
mkdir -p build/resources
cp -r resources/* build/resources
rm -rf book
