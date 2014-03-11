#! /usr/bin/env python
from distutils.core import *
import numpy
numpy_include = numpy.get_include()


_pyquasirand = Extension("_pyquasirand",
                         ["pyquasirand.i"],
                         include_dirs = [numpy_include],
                         libraries=['gsl', 'blas']
                         )

setup(
    name='pyquasirand',
    packages=[''],
    url='https://github.com/vehsakul/pyquasirand',
    license='see the LICENSE.txt file included',
    author='Lukashev Sergey',
    author_email='lukashev.s@ya.ru',
    description='python binding for GSL quasi-random number generation routines',
    py_modules  = [ 'pyquasirand'],
    ext_modules = [ _pyquasirand]
)
