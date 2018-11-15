all: resume.pdf resume.txt resume.md

files=resume.pdf resume.tex resume.txt resume.md resume.yaml

resume.pdf: resume.tex res.cls
	pdflatex $<

resume.tex: templates/resume.jinja.tex resume.yaml make.py
	./make.py tex

resume.md: templates/resume.jinja.md resume.yaml make.py
	./make.py md

resume.txt: templates/resume.jinja.txt resume.yaml make.py
	./make.py txt

.PHONY: clean
clean:
	rm -f *.log
	rm -f *.pyc
	cp resume.pdf AndreReis.pdf
	cp resume.txt AndreReis.txt
	cp resume.md AndreReis.md
	cp resume.tex AndreReis.tex
	rm resume.*
