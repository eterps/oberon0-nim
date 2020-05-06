import strutils

proc read(s: var string, ch: var char) =
  ch = s[0]
  echo "    '", ch, "'"
  strutils.delete(s, 0, 0)

proc eot(s: string): bool =
  result = s == ""
