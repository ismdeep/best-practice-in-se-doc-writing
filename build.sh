#!/usr/bin/env bash

set -e

# Get to workdir
cd "$(realpath "$(dirname "$(realpath "${BASH_SOURCE[0]}")")")"

# Load pandoc
source pandoc.env.sh '3.1.9'

# Build for mediawiki
pandoc -f markdown -t mediawiki README.md -o README.wiki

# Build for pdf via xelatex
# Prerequisite
#   1. Install pdflatex xelatex
#
#      $ sudo apt update
#      $ sudo apt install -y texlive-full texlive-xetex texlive-latex-base texlive-fonts-recommended texlive-fonts-extra texlive-latex-extra
#
pandoc -r markdown-auto_identifiers -w latex README.md -o README-snippet.tex
xelatex README.tex
