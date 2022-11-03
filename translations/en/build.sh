rm -rf book
mdbook build
mkdir book/resources
cp -r resources/* book/resources
