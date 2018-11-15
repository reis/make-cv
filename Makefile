all: output/resume.pdf output/resume.txt output/resume.md output/resume.json

files=output/resume.pdf output/resume.tex output/resume.txt output/resume.md RESUME.yaml

output/resume.pdf: output/resume.tex res.cls
	pdflatex -output-directory=output $<

output/resume.tex: templates/resume.jinja.tex RESUME.yaml make.py
	./make.py tex

output/resume.md: templates/resume.jinja.md RESUME.yaml make.py
	./make.py md

output/resume.txt: templates/resume.jinja.txt RESUME.yaml make.py
	./make.py txt

output/resume.json: RESUME.yaml
	python -c 'import sys, yaml, json; json.dump(yaml.load(sys.stdin), sys.stdout, indent=4)' < RESUME.yaml > output/resume.json

.PHONY: clean
clean:
	rm -f *.log
	rm -f *.pyc
	cp output/resume.pdf ../cv/AndreReis.pdf
	cp output/resume.txt ../cv/AndreReis.txt
	cp output/resume.md ../cv/AndreReis.md
	cp output/resume.tex ../cv/AndreReis.tex
	cp output/resume.json ../cv/AndreReis.json	
	cp RESUME.yaml ../cv/AndreReis.yaml	
	rm output/*
