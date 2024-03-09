#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY&�c@  ��E� ���/nޮ����    @Β�lE7�4�!�4� ��6���@4)�i����D&�M a�A�&������F�FL�a �$��&�<h&��چMM2���4�(�L�#A��OBޢ�-�R=��R4��ڎm�����-��Z�
�$�sIr\U�J����D�]R%�!3�<PI@sן��$����B��."|U5��j,E� ũ�>���l�|P}�䵑�䇒lU���E�B��@�s��7b��eX�@���s�0=-f6�����zM���~��[�*d[de���Q�Lj�����t��k��2wEiE�E�3]h����!k|��4���Ą��II�e"���-������;�-� �f��f�q��Y�^1#�DN�t3���;<�*%DKZ��u�G�Е�L��?��81޷x���S%?�}Q��v��!�+�]l�a3�A��)���E�<(sR9S~qzf�![��b�玲��)B���0���	���k�xLq&A^ë0�mrR)f��0�f���-Ws(*5�j�9ї���a(�V�k��X���x��)�9��yXP�4�%b7�S:�q��u�1�h��!�0�[c;��i�Q�K� ��y�����F��)�*���]�C&�:Z�q=�Ɉ�91O��7ޡ�lқ�)���/��&�1� �s����bՙK��h)���D���f;bx@��X�n+!D�&L/�WU^�j��][{K̙g8���K�$��$$�_�w$S�	i�4 