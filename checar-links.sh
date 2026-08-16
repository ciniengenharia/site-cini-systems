#!/usr/bin/env bash
# Verifica se todo link interno aponta para um arquivo que existe.
cd "$(dirname "$0")"
python3 - << 'PY'
import re,glob,os
falta=0
for f in sorted(glob.glob('**/*.html', recursive=True)):
    base=os.path.dirname(f)
    html=open(f,encoding='utf-8').read()
    for u in sorted(set(re.findall(r'(?:href|src)="([^"#][^"]*)"', html))):
        if u.startswith(('http','mailto:','data:','//')): continue
        alvo=os.path.normpath(os.path.join(base,u.split('#')[0]))
        if not os.path.exists(alvo):
            print('QUEBRADO %s -> %s' % (f,u)); falta=1
print('nenhum link quebrado' if not falta else '')
print('paginas:',len(glob.glob('**/index.html',recursive=True)))
PY
