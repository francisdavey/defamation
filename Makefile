# requires greadlink (available via brew install coreutils on OSX)

XELATEX = /usr/local/texlive/2013basic/bin/universal-darwin/xelatex
TEXINPUTS=$(greadlink -f tex):
LATEXMK=latekmk

TEX_OBJS=$(wildcard talks/*/*.tex)
PDF_OBJS=$(patsubst talks/%, pdf/%, $(TEX_OBJS:.tex=.pdf))
INDEXES=$(patsubst talks/%/notes.tex, pages/%/index.html, $(wildcard talks/*/notes.tex))

#SLIDES=$(wildcard talks/*/slides.tex)
#HTML_SLIDES=$(patsubst talks/%, pages/%, $(SLIDES:.tex=.html))

THEMES=themes

pdf_dir=pdf
pages_dir=pages
talks_dir=talks

all: index.html $(PDF_OBJS) $(INDEXES) # $(HTML_SLIDES)

index.html: README.md templates/readme.FORMAT
	pandoc README.md -o index.html --template=templates/readme.FORMAT

${pdf_dir}/%.pdf : ${talks_dir}/%.tex
	mkdir -p ${@D}
	latexmk -cd -pdf -pdflatex="xelatex %O %S" $<
	cp $(patsubst %.tex, %.pdf, $<) $@

${pages_dir}/%/index.html : ${talks_dir}/%/notes.db templates/config.xsl
	xmlto -m templates/config.xsl --skip-validation -o $(@D) html $<

${talks_dir}/%/notes.db : ${talks_dir}/%/notes.tex
	mkdir -p ${@D}
	pandoc $< --self-contained -f latex -t docbook -o $@


#pandoc notes.tex -t docbook --standalone -o notes.db
#xmlto -v --skip-validation html notes.db

#http://docbook.sourceforge.net/release/xsl/current/html/chunk.xsl
# -o output directory
# -m config.xsl

#xmlto -m templates/config.xsl --skip-validation -o pages/staying_protected html talks/staying_protected/notes.db

#xmlto -m templates/config.xsl --skip-validation -o pages/staying_protected html talks/staying_protected/notes.db


#${pages_dir}/%.html : ${talks_dir}/%.tex templates/default.reveal.js $(THEMES)/francis.css
#	mkdir -p ${@D}
#	pandoc $< --self-contained -f beamer -t revealjs -o $@ --template=templates/default.reveal.js

