#!/usr/bin/env bash
KINDLEGEN_PATH="/home/adicco/kindlegen"
BUILD_DIR="./build"
FILENAME="Ajahn_Amaro_-_Serenity_is_the_Final_Word_v1_0.epub"
OUTPUT=${1:-$FILENAME}
echo "generating $BUILD_DIR/$OUTPUT"

mkdir -p $BUILD_DIR

pandoc \
	--template epub.template \
	--output "$BUILD_DIR/$OUTPUT" \
	--css style.css \
	title.txt \
	00-intro.md \
	00b-foreword.md \
  01-content.md \
	02-poem.md \
	03-bio.md \
	99-copyright.md 

epubcheck "$BUILD_DIR/$OUTPUT"

$KINDLEGEN_PATH $BUILD_DIR/$OUTPUT -c1 -o ${FILENAME%.epub}.mobi
