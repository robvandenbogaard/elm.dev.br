rm -rf book
mdbook build
cp -r book/* build/
mkdir -p build/resources
cp -r resources/* build/resources
rm -rf book
