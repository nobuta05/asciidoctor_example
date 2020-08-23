vpath %.sty styles
vpath %.xsl styles
vpath %.css styles

.PHONY: all
all: output_asciidoctor-pdf.pdf output_dblatex_via_docbook.pdf output.html

output_asciidoctor-pdf.pdf: input.adoc
	bundle exec asciidoctor-pdf -r asciidoctor-pdf-cjk -a scripts=cjk -a pdf-theme=default-with-fallback-font -r asciidoctor-mathematical -a mathematical-format=svg $< -o public/$@
	rm stem*.svg

output_dblatex_via_docbook.pdf: input.xml myparam.xsl mytheme.sty
	dblatex --texstyle=styles/mytheme.sty --xsl-user=styles/myparam.xsl -b xetex public/$< -o public/$@

input.xml: input.adoc
	bundle exec asciidoctor -b docbook $< -o public/$@

output.html: input.adoc colony.css
	bundle exec asciidoctor -a stylesheet=colony.css -a stylesdir=styles $< -o public/$@

.PHONY: clean
clean:
	rm public/*.*