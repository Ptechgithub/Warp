#!/bin/sh
#
# Encrypted by Rangga Fajar Oktariansyah (Anak Gabut Thea)
#
# This file has been encrypted with BZip2 Shell Exec <https://github.com/FajarKim/bz2-shell>
# The filename 'warp-g.sh' encrypted at Tue May 28 08:11:16 PM UTC 2024
# I try invoking the compressed executable with the original name
# (for programs looking at their name).  We also try to retain the original
# file permissions on the compressed file.  For safety reasons, bzsh will
# not create setuid or setgid shell scripts.
#
# WARNING: the first line of this file must be either : or #!/bin/bash
# The : is required for some old versions of csh.
# On Ultrix, /bin/bash is too buggy, change the first line to: #!/bin/bash5
#
# Don't forget to follow me on <https://github.com/FajarKim>
skip=75

tab='	'
nl='
'
IFS=" $tab$nl"

# Make sure important variables exist if not already defined
# $USER is defined by login(1) which is not always executed (e.g. containers)
# POSIX: https://pubs.opengroup.org/onlinepubs/009695299/utilities/id.html
USER=${USER:-$(id -u -n)}
# $HOME is defined at the time of login, but it could be unset. If it is unset,
# a tilde by itself (~) will not be expanded to the current user's home directory.
# POSIX: https://pubs.opengroup.org/onlinepubs/009696899/basedefs/xbd_chap08.html#tag_08_03
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
# macOS does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"
umask=`umask`
umask 77

bztmpdir=
trap 'res=$?
  test -n "$bztmpdir" && rm -fr "$bztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | */tmp/) test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  */tmp) TMPDIR=$TMPDIR/; test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  *:* | *) TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
esac
if type mktemp >/dev/null 2>&1; then
  bztmpdir=`mktemp -d "${TMPDIR}bztmpXXXXXXXXX"`
else
  bztmpdir=${TMPDIR}bztmp$$; mkdir $bztmpdir
fi || { (exit 127); exit 127; }

bztmp=$bztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$bztmp" && rm -r "$bztmp";;
*/*) bztmp=$bztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | bzip2 -cd > "$bztmp"; then
  umask $umask
  chmod 700 "$bztmp"
  (sleep 5; rm -fr "$bztmpdir") 2>/dev/null &
  "$bztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress ${0##*/}"
  printf >&2 '%s\n' "Report bugs to <fajarrkim@gmail.com>."
  (exit 127); res=127
fi; exit $res
BZh91AY&SY�#X� b_��������������   � `]σ����j�(�Mf��� z��`����$�	�@ &��ꟑM=M��&i��P�4�F�@ښ$��@          �
A� �hP �  z� � I�5O�O��SG����=@�42z�Q���z��C#�z�8�����  4 4   H�� ���@L��eO�mS6�=C�Ѵ���=FOQ���z�I���u3�}��\�C��ʯd�E4G�_�-��ap�������|�F���\�k	��(�����(��<X���M+��TB���F�u4N��&H��uyXLV"'�3=Y��w��0�E�Zmwh�o�=�"ֺ̿�Y��zۆ�:^"iH�H4h@|� �_����F���۠Ff����近��P=�*G��AB y���#���]e��Q |1Z�=�&�/��1�aXK��&�:]�箯�p�"�s�D������M1ݖ��?�2Y~�R��@	��.��������+������R�h�x �^�Rm��������5q��]�<�U�VpG͕9�PE�vv-�.��q<��3N������ڻ�"M{��e��z���b�?�	��I����us�`�t��c�r�Ծ�c�j�JI<�^A��Ͻ�n��1�2��>��NŊP^k�
z,)C
n���1>�"�<�>��jjn�^�:^h \m!�h`|&�M)w�R�F8��j�j\om����j�33W����3�����l���N;���ǞE�Xz�OFuz�?tq�L���82s+2@�!���v���$k;�2�{�5ַhb��W��|���J=}��4��K7�O����ᚄA��3���($�l�|�)x�Y�7|'#9s.͗��[��}WY����r.D�n�D��P0���)#CCG� ����l�o����l2���J1���ß�O�w���Cn��d�'��	g��rQ&ΞN�����`�ci���h\|����67�R6�T�p��k�`�j��u��R�5M��`3i�#�srD�Cl\��q�J<"�b���q?���]�'r��9���l6�[d���}u#wIB
��^��6]s�C)K3<��-��o�g�{L�������҂���Tx�C�4h���"�G���&�x����[�J�z}~f��`�2H��Z��ƭ�o�چ	Fj]+���.J��V0B�x����/�k�Y��l:��ILqz`
��D���¡p+d��Y���T���F�ʦ�T4�I���n�*���uM�n�s���#E�"����1g"И�����P�j�,�..�����Aʨ��B!M@��p��� �O�1LlA�2D,ݯ��;G��0�>�>l3����'�V"�݊n^���O.S�h|AO�h.� 8��?>���4���UY�p�<� I�w{�ڳ�Y�k���|_FoΊl=��6���X Y� ^�+��WX����>�]�����9���������ݢtwܕ�>�d)�e
��� UY��	Tj�`
g%\l"�ɹ����V 쁲P8���{?�������95wkT��=���3��4pE�,�q�\2�)ӟ_\�d�s�r���$�5U:j��IN�1�|[�g�%�2�m��i�߶#��:5x{[
ǧa�~jPa�W���tL h���	��/u��8��姰^�e]��v�����v�ɏ,]��2Ux$Mɤ��M��4N-�s7�Do��]:����}9>~��v�h���쏌:q��4��5!���M�M�ؾ���0�*��"Ia��=!+�w�������uH���^�F5��]D��r��?����-7�ӵ��1��1�}g,<��A{&(ڍ��q)�#��Ҟ`J�}��c���m`~�y����'2�لk�� UH�4KW�U��ʃ)|с(�< �'T�fL�I3`G�I�T���sO7@��܃ �Ճ F3*�/U.�R-%1gЀ�	���ـ��؅P�hpڔ�� ���!������+�z(������PQ��ײ#GMd���?==/��*?����4�(��%�M%��Xh��,[�L�l���/�eJ[�u�t-A{c)��H����F���U��̻�-N6�	B��{
yv��U�t�a�݈��M�KZ�"�@1�m�"�Jt$��^�:D�ϢJ�, 7�w1>>/9l�8Q���H�?��(�1��nA�V���v�)ʞ#��
Ds�Lw$IYۭ����\�يA�>��$�m$E��F{�l�X/v� �yJ�,� ���U ����O���7�r�	�����A�bk5���� ���(��a��6L!#�SHF�&��bFs��q�P�>���d�CH9�?VH4��O�djA u��0A0Ov�M%�%F� ��
n| i%ʵ�J�o��/���hH���l� Ѓz5�{8f�b]�����X�ok�m��|�ό���m"����L��@dg�����@;����bn��A��#d�%8BO"Kmi'��ɹ��ԛ$�2p�_�ox ��Ԁ�A`�,K4c��Ћ�D$U�LQ/p�d 'Č_��"���Id^�,JG�9�6+p�JY�2rP�f�� �HMD�-aj /h��h����4��BU*od�^	-6��R�paP�����0�!��9.�8�̐��Ҧ��HW1!�����hc$`������-�K�,{��W�Uٺ 63kUa`�Ѓ��q�P��:s$N�i����O`EpA��\� h�|�'.�WӬ`1���Hud!��d�@�B B�E�<A�Ď0Q�C�T��OU��G���5E�R������?<%��C$���Q� X{,�ǆ�6�Lҳ`6�N������pO�n3L����5T�A�����^�_iE �~F!CH��2�pw�g�z�m�!�L��h�� ��&S��g�J$���4��SB�H��@��"8�$�[@����d|Z��Z��D�44؆rE�Ƅ������Q"ҢB�Ni/M��\���,%1+�r��F���=<�U��
)т���5������Ѓ��Ru��w�ſ�7� �*f��J�1C$�$-ND���J����P�tl���E^�h[I�"����P=���#2J�1K�{�%#s�A�3�#,�Ǳ�u��M��-�"�k;���
+0�jǉ�x9����#�F6Lx�Ԏ�|T�L����
RC2�w3fu�� ����p�Z�J� _�	u���;�O: �5���&Cz���C�����pM�E���ܨN$6ik�hZV��O愒��.B�6%�^�;�Z���-���$v�7zA�*("bD4�Dj��:;x5�M��~^��Q+����K`1�@h�(V� 7��̌F���1�a> 8�b
���J�\�5TEUM|�Y�ЃE����yQ,.����J�K�M��t�iI_RiR�A���"H�%���t�;� ~9�a��ZX�l�� >����hFԯIm����$����6���1��)㭹���Y��pUJ�H�B0z�i��q����!@������+���nY2�8�c�b	�)U�p3�8����m��H�
k�