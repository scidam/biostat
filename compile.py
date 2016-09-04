#coding: utf-8

# Author: Dmtiry E. Kislov
# E-mail: kislov@easydan.com

import re
import subprocess, os
from jinja2 import Template

lecture_pat = re.compile('.*Lecture.*')

with open('maintemplate.tex') as f:
    maintemplate = f.read()
template = Template(unicode(maintemplate.decode('utf-8')))

for root, dirs, files in os.walk("."):
    for ff in files:
        if lecture_pat.match(root):
            if 'lecture' in ff:
                with open(os.path.join(root, ff), 'r') as f:
                    texdata = f.read()
                with open(os.path.join(root, ff+'.tex'), 'w') as f:
                    f.write(template.render(content=texdata.decode('utf-8')).encode('utf-8'))
                os.chdir(root)
                subprocess.call(['pdflatex', ff+'.tex'])
                subprocess.call(['pdflatex', ff+'.tex'])
         