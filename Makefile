all: resume.pdf

resume.pdf: resume.tex res.cls
	pdflatex resume.tex

resume.tex: template.tex resume.yaml genresumes.py
	./genresumes.py template.tex resume.yaml resume.tex
