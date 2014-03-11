pyquasirand
===========
python binding for GSL quasi-random number generation routines
####Dependancies
Requires SWIG, numpy and BLAS.  
Presumably should work on Unix-like systems.  
####Installation
Standard setup.py script. So `#python setup.py install` should do it. 

However, you may wish to avoid messing up your system. In this case add `--user` option to install to `~/.local` or `--prefix some/place` to install wherever you want. Beware to add the generated `site-packages` directory to your `PYTHONPATH`.  

If you don't want to touch path, virtualenv is another option. It's probably a good idea to use `--system-site-package` option if you want to be able to use system-wide packages for some reason (e.g. not to install numpy, etc. from scratch).
####Usage
Take a look at 'test.py' file to see a usage example.
####License
(C) 2014 Lukashev Sergey <lukashev.s@ya.ru>

Permission to use, copy, modify, and/or distribute this software for any purpose
with or without fee is hereby granted, provided that the above copyright notice
and this permission notice and disclaimer appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS
OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF
THIS SOFTWARE.
