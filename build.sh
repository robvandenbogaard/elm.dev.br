rm -rf book
mdbook build
cp -r book/* build/
echo "Adicionando tag do matomo"
sed -i "s#</head>#<script type='text/javascript'>var _paq = window._paq = window._paq || []; _paq.push(['trackPageView']); _paq.push(['enableLinkTracking']); (function() { var u='https://elm.matomo.cloud/'; _paq.push(['setTrackerUrl', u+'matomo.php']); _paq.push(['setSiteId', '1']); var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0]; g.type='text/javascript'; g.async=true; g.src='//cdn.matomo.cloud/elm.matomo.cloud/matomo.js'; s.parentNode.insertBefore(g,s); })(); </script></head>#g" build/*.html
mkdir -p build/resources
cp -r resources/* build/resources
rm -rf book
