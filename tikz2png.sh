#!/bin/bash
# Convert a list of standalone .tex files containing code for TikZ diagrams into .png images
# See the README for dependencies and installation instructions
# Usage: bash tikz2png.sh file1 file2 file3 ...
# where the filename inputs are in the present working directory
# Or `bash tikz2png.sh *.tex` inside the directory containing your standalone TikZ diagram documents
for filename in "$@"
do
    echo "Processing ${filename} ..."
    pdflatex ${filename}
	magick convert -density 300 ${filename%.tex}.pdf -quality 90 ${filename%.tex}.png
	rm ${filename%.tex}.aux ${filename%.tex}.log ${filename%.tex}.pdf
done
