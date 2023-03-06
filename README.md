# PC Assembly Language book

This repo contains the LaTeX source of a 32-bit 80x86 assembly
language book adapted for SCC's CISP 310 and including MASM syntax.

You need LaTeX installed with all extra packages to create the PDF
from these files. On Ubuntu, I needed to install the *texlive-latex-base* 
and *texlive-latex-extra* packages.

To generate the PDF file, go to the /book directory and type:

make

If you make major changes you have to update the index manually with:

make index

Besides that you are good to go. 

These files are released under the Creative Commons 
Attribution-NonCommercial-ShareAlike 4.0 International License. 
To view a copy of this license, visit 
http://creativecommons.org/licenses/by-nc-sa/4.0/.

Original version by Paul Carter: http://pacman128.github.io/pcasm/
