all: resume.pdf

files=resume.pdf resume.tex resume.yaml

resume.pdf: resume.tex res.cls
	pdflatex $<

resume.tex: templates/resume.jinja.tex resume.yaml make.py
	./make.py tex

#resume.txt: templates/resume.txt.tmpl resume.yaml genresumes.py
#	./make.py txt

.PHONY: clean
clean:
	rm -f *.log
	rm -f *.pyc
