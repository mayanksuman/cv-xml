#! /bin/sh

XSLTPROC=$1
THEME=$2
OUTPUT_DIR=$3
CVFILE=$4
OUTFILE=$5
CONFIG_OK=true


if $CONFIG_OK
then
    $XSLTPROC ./themes/$THEME/html.xsl $CVFILE > $OUTPUT_DIR/$OUTFILE.html

    # if there is a CSS file, we copy it
    if `test -f ./themes/$THEME/style.css`
    then
	cp ./themes/$THEME/style.css $OUTPUT_DIR/
    fi
fi
