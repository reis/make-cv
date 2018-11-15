all: output/resume.pdf output/resume.txt output/resume.md

files=output/resume.pdf output/resume.tex output/resume.txt output/resume.md RESUME.yaml

output/resume.pdf: output/resume.tex res.cls
	pdflatex -output-directory=output $<

output/resume.tex: templates/resume.jinja.tex RESUME.yaml make.py
	./make.py tex

output/resume.md: templates/resume.jinja.md RESUME.yaml make.py
	./make.py md

output/resume.txt: templates/resume.jinja.txt RESUME.yaml make.py
	./make.py txt

.PHONY: clean
clean:
	rm -f *.log
	rm -f *.pyc
	cp output/resume.pdf AndreReis.pdf
	cp output/resume.txt AndreReis.txt
	cp output/resume.md AndreReis.md
	cp output/resume.tex AndreReis.tex
	rm output/*
