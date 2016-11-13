#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author: Dmtiry E. Kislov
# E-mail: kislov@easydan.com

import re
import os
import sys
import subprocess
from jinja2 import Template

lecture_pat = re.compile('.*Lecture.*')

try:
    lnum = sys.argv[1]
except IndexError:
    lnum = ''

with open('maintemplate.tex') as f:
    maintemplate = f.read()
template = Template(unicode(maintemplate.decode('utf-8')))

toeval = []
for root, dirs, files in os.walk("."):
    for ff in files:
        if lecture_pat.match(root):
            if 'lecture' in ff and lnum in ff:
                if '.' not in ff:
                    with open(os.path.join(root, ff), 'r') as f:
                        texdata = f.read()
                    with open(os.path.join(root, ff+'.tex'), 'w') as f:
                        f.write(template.render(content=texdata.decode('utf-8')).encode('utf-8'))
                    toeval.append(os.path.join(root, ff+'.tex'))

for lect in toeval:
    pp, ff = os.path.split(lect)
    os.chdir(pp)
    subprocess.call(['pdflatex', '--shell-escape', ff])
    subprocess.call(['pdflatex', '--shell-escape', ff])
    os.chdir('..')
