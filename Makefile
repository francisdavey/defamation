XELATEX = /usr/local/texlive/2013basic/bin/universal-darwin/xelatex

all: index.html

index.html: README.md templates/readme.FORMAT
	pandoc README.md -o index.html --template=templates/readme.FORMAT
