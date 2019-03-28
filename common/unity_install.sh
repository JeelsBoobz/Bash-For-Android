cp_ch -i $TMPDIR/bash-$ARCH $TMPDIR/system/bin/bash

# Get rep/nrep from zip name
OIFS=$IFS; IFS=\|; MID=false; NEW=false
case $(echo $(basename $ZIPFILE) | tr '[:upper:]' '[:lower:]') in
  *nrep*) REP=true;;
  *rep*) REP=false;;
esac
IFS=$OIFS
if [ -z $REP ]; then
    ui_print "Replace mksh with bash?"
    ui_print "This will only be a bind mount set AFTER boot"
    ui_print "Note that this won't affect boot but can break some term scripts"
    ui_print "Vol+ = yes, Vol- = no"
    $VKSEL && REP=true || REP=false
fi
$REP || rm -f $TMPDIR/common/service.sh
