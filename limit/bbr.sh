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
BZh91AY&SY
�qQ O��p1 ���?�ݎ����`��fQ
��H  �����@����   �  1�L�4�1�Ѧ �h0�2dѠ4i����0&�1#A� $D�M4&�$z��QS�F	���Pz@ښz�D�CzP�&MF���Ch�b4@�D�2LMi�6H�3Q��h4Ѵ������:�KHK���s�?�j���Z�ח�����,_W�U�1Z�Z�(hC!%�|<��1\t��T�8���#�($��g0_:!%B]z���Lݜ=�Ǉ���)##z�BI3�Mg`����{�|�����G�����Ճg7�(����ÌY"��ب��&*rĎ�^㱪Y/u����m�m�b5\=�<��\�m��mp��um�K�>�sWŵ���S5h�k4�l�Kx�R �q	�RE��&=��|<' �vm�м�L�� �V���������[|�[�"ʒ$I��m	�Mx���+d[�I��o����qBI$z��&&bV����>OCӘ��ÿ>�t_��?� �m�Cq��WH���폨����A	��llm��k�(��r��4�C@K�m�P��v���n�J�(6*�pw@H��>��(ERk9%� ƃ �l<��zJ���0� T�]��B^f�&}�D��If�?�&�*���ۃ@��ܷS�ĠX��v�b��ט6[�8�|�FA��##�+�F"����TAX+0�&���y6֣�7�� ��m�(P	D��y�:�<�9�}?~�)d�<����k�	�>���Ck�C����"��t�.�E���ai��|13HH������l$�/���?ds�*2�0�4kH����6��NΧi������%&�`��:3�#@y����J��XID��!�7`@;�-X�N�$������j���A�풛���ː����.�}�߿����*�1�V��C(uy��{B?`р\��J�$���"r>o1��R?�)�C�dF~�:{0ht7�@S����)�S9� ��j�	�ٴI[sܐ!�c�dA��p���	A_�BF%���H�
/i���1z>,� ����F��+�N�HEӹ 1S{[�#d������1���g���$3b�$��X�	��ʍ��)���C\au�ۃ�M��_N�����h���D�8/���$	fn[ϫ������A���X��<i��_^(��/���~a!
�&*i�E��|e�cרS�5/C�����wiޫD��?�i��.'nP��!I4*�g���fнH:�$$\�La;$v�q�RD�� 5Ɇc��g�5���V����Ԛ� }FʜE���zL`+�C��S�����͋R�ER�`��%��ž�ײ��IA���S�9�W]$ln�MT���R��>�!&���+�� 71��t�� �(2A��=H�)��cL.��|�8���J6D˥�S�s�s(yY���f@��1M`n�˳�	��x�U�����b�mL@��'�I��bvo�n�XZA���B��7/�2 ot��ޭ�� w����@�K�����O�
S��o ���;���1�ވɜa*�*1�:�'�K�Y�����m�A� GQ\ޅA�r���Z�\r)K��:�(��.����^XE��rD�4 �'!�7i9�a_�gR#qÉ�j+�ɣܭu�!��{[�7��o�J�oY.��7�J�
"9^t\
q�#S�
�1_÷<���԰�j��7B��=y�9��x$S���k�(�4h<����g|�?�w$S�	 ��