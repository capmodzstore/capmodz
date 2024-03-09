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
BZh91AY&SY��Q  �_� }��?���~����@��R�ҙOSF�P�4� @   2dшi����4ɈMi�0�����Q��� ��� �#)�0LO)�H�M�S=I��h�ډ��RScg �L?X�����]ѕ1��
��!�/$b�O�)�a����5<�M�8�TzQ�>]��P"��PJ��as��fi��m"���AA �4�
���]�30\��DG�"H�s�]�!)T's���O*%C�RE��'~�bO��G�9���_�$G��c�<�g-;��-����su�=wGZ�bVN�T��tPS6�ٹ��W�S0rm84�Q���k�����w�Z���]�{{������ϛº�*K��ZSX��nc��P���,�A��'��Ē�gv*2գ��7�R��RHU�E�G��c��ͳ�@h���A� >a�2��8��m'�%b�5iH�dU@S�QM)L�47�Ƅ��<��v2kA�T9i��`��j�|�y�����I��Z�K~MH��a�XX�_�T�f�̘�_����������5ǒg1n�D��tSI3f)��	pX�A��e�S�D�{3�"︚3,�N'5��'�!� ]�D=*���Z�$J��B�ITv��8����t��<��d�|����qV���qI��X�M��*MAϜ�5n����&P(�U�\c�Ďe�J8����Ъ����W5���d��
iG&.�,�ņ��UR�{��z;�d`b�������"�(HO��(�