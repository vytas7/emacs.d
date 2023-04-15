My Emacs configuration
======================

This is my `Emacs <https://www.gnu.org/software/emacs/>`_ configuration
skeleton with an emphasis on Python development.

This is probably not very usable out of the box for anyone except me, but feel
free to reuse and remix as you see fit if you find anything of interest.


Supported Emacs versions
------------------------

Emacs 26.3+ should work. Emacs 25 *might* work as well.


Installation
------------

First, clone this repository to ``~/.emacs.d`` so that ``init.el`` ends up at
``~/.emacs.d/init.el``::

  git clone https://github.com/vytas7/emacs.d.git ~/.emacs.d

Next, install
`use-package <https://jwiegley.github.io/use-package/installation/>`_ since
this configuration uses it to ensure that all referenced packages are
installed::

  git clone https://github.com/jwiegley/use-package.git ~/.emacs.d/site-lisp/use-package
  cd ~/.emacs.d/site-lisp/use-package
  make
