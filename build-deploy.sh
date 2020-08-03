./build.sh
scp -r -P 8080 ~/dev/github/elm.dev.br/book/* marcio@167.172.115.101:~/html
# yes, the deploy is a simple scp ;)
