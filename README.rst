===================================
 HYAI |travis| |coveralls| |melpa|
===================================

Overview
========
Hyai is an indentation minor mode for Haskell, written from scratch.
It supports only one style that basically follows Johan Tibell's `Style Guide`_.

Offset values (``hyai-basic-offset`` and ``hyai-where-offset``) can be customized,
but only the default values are tested by unit tests.
So the customized values may not work properly.

Installation
============

Setup from MELPA_
-----------------
1. Install from `MELPA`_

   | :kbd:`M-x package-install RET hyai RET`

2. Add ``hyai-mode`` to ``haskell-mode-hook``

   .. code:: emacs-lisp

      (add-hook 'haskell-mode-hook #'hyai-mode)

Setup from GitHub
-----------------
1. Install from GitHub::

     git clone https://github.com/iquiw/hyai.git

2. Add ``hyai-mode`` to ``haskell-mode-hook``

   .. code:: emacs-lisp

      (add-to-list 'load-path "/path/to/hyai")
      (require 'hyai)
      (add-hook 'haskell-mode-hook #'hyai-mode)

Status
======

Supported Style
---------------
* Basic Indentation and ``where``
* Data Declarations
* List Declarations
* Hanging Lambdas (partial)
* Export Lists
* If-then-else clauses (partial)
* Case expressions
* Top-Level Definitions

License
=======
Licensed under the GPL 3+ license.

.. _Style Guide: https://github.com/tibbe/haskell-style-guide
.. _MELPA: https://melpa.org/
.. |travis| image:: https://travis-ci.org/iquiw/hyai.svg?branch=master
            :target: https://travis-ci.org/iquiw/hyai
.. |coveralls| image:: https://coveralls.io/repos/iquiw/hyai/badge.svg?branch=master&service=github
               :target: https://coveralls.io/github/iquiw/hyai?branch=master
.. |melpa| image:: https://melpa.org/packages/hyai-badge.svg
           :target: https://melpa.org/#/hyai
