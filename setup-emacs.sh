#!/bin/sh -e

# Install use-package
git clone https://github.com/jwiegley/use-package.git ~/.emacs.d/site-lisp/use-package
pushd ~/.emacs.d/site-lisp/use-package
make
popd

# Setup Elpy venv
mkdir -p elpy
python3 -m venv elpy/rpc-venv
elpy/rpc-venv/bin/pip install -qy \
    autopep8 \
    black \
    flake8 \
    jedi \
    setuptools \
    wheel \
    yapf
cat python > elpy/rpc-venv/elpy-rpc-python-path-command
