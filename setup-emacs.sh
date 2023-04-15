#!/bin/sh -e

# Install use-package
git clone https://github.com/jwiegley/use-package.git ~/.emacs.d/site-lisp/use-package
cd ~/.emacs.d/site-lisp/use-package
make

# Setup Elpy venv
cd ~/.emacs.d/
mkdir -p elpy
python3 -m venv elpy/rpc-venv
elpy/rpc-venv/bin/pip install -q \
    autopep8 \
    black \
    flake8 \
    jedi \
    setuptools \
    wheel \
    yapf
echo -n python > elpy/rpc-venv/elpy-rpc-python-path-command
