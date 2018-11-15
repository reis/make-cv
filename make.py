#!/usr/bin/env python

"""
Takes yaml resume input source and feeds it to the jinja2
templating engine
"""

from jinja2 import Environment, FileSystemLoader
from datetime import datetime
from optparse import OptionParser
import os
import sys
import yaml

def get_cmd_line_args():
    parser = OptionParser(usage="%prog [options] <extension>",
        description="Fills in Jinja2 templates from YAML source to " +
                    "generate resume of the given <extension> format.")

    parser.add_option("-o", "--output_dir",
        default='.',
        help="Output directory of generated files. Defaults to output/")

    parser.add_option("-s", "--source",
        default='RESUME.yaml',
        help="Filename of the resume YAML source. Defaults to RESUME.yaml")

    parser.add_option("-t", "--template",
        default='resume.jinja.%s',
        help="Filename of the output format template. Defaults to templates/resume.jinja2.<extension>")

    options, extra_args = parser.parse_args()
    if len(extra_args) < 1:
        parser.print_help()
        exit()

    return options, extra_args[0]

if __name__ == '__main__':
    options, extension = get_cmd_line_args()

    env = Environment(
        block_start_string = '\BLOCK{',
        block_end_string = '}',
        variable_start_string = '\VAR{',
        variable_end_string = '}',
        comment_start_string = '\#{',
        comment_end_string = '}',
        line_statement_prefix = '%-',
        line_comment_prefix = '%#',
        trim_blocks = True,
        autoescape = False,
        loader=FileSystemLoader(os.path.dirname(os.path.abspath(__file__)) + '/templates'))
    print(options.template % extension)
    template = env.get_template(options.template % extension)
    contents = yaml.load(open(options.source, 'r').read())
    #template = Template(file=options.template % extension, searchList=[dict, contents])
    rendered = template.render(** contents)

    output_dir = options.output_dir
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)
    open('%s/resume.%s' % (output_dir, extension), 'w').write(str(rendered))

