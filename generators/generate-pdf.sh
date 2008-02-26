#! /bin/sh

FOP=$1
THEME=$2
OUTPUT_DIR=$3
CVFILE=$4
OUTFILE=$5
CONFIG_OK=true


if $CONFIG_OK
then
    $FOP -xml $CVFILE -xsl ./themes/$THEME/pdf.xsl -pdf $OUTPUT_DIR/$OUTFILE.pdf
fi
