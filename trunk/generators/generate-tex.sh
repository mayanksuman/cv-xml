#! /bin/sh

XSLTPROC=$1
THEME=$2
OUTPUT_DIR=$3
CVFILE=$4
OUTFILE=$5
CONFIG_OK=true


if $CONFIG_OK
then
    $XSLTPROC ./themes/$THEME/latex.xsl $CVFILE > $OUTPUT_DIR/$OUTFILE.tex
fi
