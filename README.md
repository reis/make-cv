# make-cv

_make-cv_ was created using:

- YAML source - for the resume content
- LaTeX template - for presentation and layout
- Python script and Jinja2 (templating engine) for compiling together the
  YAML and LaTeX
- pdflatex for .tex --> .pdf
- GNU Make for compilation
- Vim and git

The purpose is to avoid data duplication and to separate content from
presentation and have my CV in as many formats as possible.

## Basic instructions:

1. Install the OS dependencies: LaTeX, Python, Make, etc.
2. Create your virtualenv and install Python dependencies:
    virtualenv venv
    source venv\bin\activate (linux)
    venv\bin\activate.bat (windows)
    pip install -r requirements.txt
3. Write resume in YAML format
4. Compile, preview, and edit.
    make

## TODO:

- create the SQL template

## Acknowledgements

This process was inspired by many people trying to solve the same problem. Many thanks them:

- David Hu: https://github.com/divad12/resume
- Eliseo Papa: https://github.com/elipapa/markdown-cv
- Paulo Benatto: https://github.com/patito/cv
- Michael DeCorte: https://ctan.org/pkg/res?lang=en
