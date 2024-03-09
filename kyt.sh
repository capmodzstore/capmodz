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
BZh91AY&SY���  ��� }���oޮ����    P����;pT���*l�z2z�h g�CA��S�&�⟩6�	��i�@��2M�L@�&�M#�b=F�����P�@4�M#C!�� �� ��I"2	6�zD��4i��L�!���b��Ũ��,g��,���r�I��J�B���%=�cv�U_RU1)����������)!���!��Yf��Eq�����rL��
��k��H���1)%� ǭ��^��LUJyO���q�ȓB�'Nqqmq��2�����
�
��vA��m��2g�nUI#���D���U�� �`��k�:Kt;��z)k�<=))2F$:H��N1��߮�0#���9j�L\,��� ~Sg݄!��u�!��d�6�r�yVԌ,�5�� �S\������}G]�L��s�q1���Q�ME�'�Ki�F.N�t��ƭ��� e~PJP��x[i�_�5���n���h���JiKT#V
^h�"&<C����b.C��EjF.$P+pl��2��!Q�Σ�ay_�hB~(��Yva�GP0�As��`VK���2��c�tdZS��aT�yp�֚eb�7�ǯ��P��fg+�5;K7�ط	��59J���ڇ�BLo%�zxK�|E�ܳoק�y�
��zq#Y��d,��1mw,�E�k�q�6_�h�0N3���7�U�?2�����m
p��*�Qj��9��]	����F^�fU����U�PͧK���I
*
�
�{ �Z��(T|�uZ��f���4Pk���)������LTq�ȄqRRM>����-�������վA�tF�Ď"���J6[$[!�q�CO+/�9���6�Q)XR�k��
:Iޞa�%��RV�=��ZGT,��1@�ּ�@a�`"sjg���=%��sI�TI&�7�*[��q�-�b��$��I.����.�p�!���8