all: output/resume.pdf

files=output/resume.pdf output/resume.tex resume.yaml output/resume.txt

output/resume.pdf: output/resume.tex res.cls
	pdflatex -interaction=batchmode -output-directory output $<

output/resume.tex: templates/resume.tex.tmpl resume.yaml genresumes.py
	./genresumes.py tex

#output/resume.txt: templates/resume.txt.tmpl resume.yaml genresumes.py
#	./genresumes.py txt

.PHONY: clean
clean:
	rm -rf output
	rm -f *.pyc
