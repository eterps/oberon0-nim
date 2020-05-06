include until
import oss, osg

var
  sym: int
  top_scope: osg.Object

proc find(obj: var osg.Object) =
  var x: osg.Object
  var s = top_scope
  until x != nil or s == nil:
    x = s.next
    while x != nil and x.name != oss.id: x = x.next
    s = s.dsc
  obj = x

proc open_scope =
  var s: osg.Object
  new s; s.class = osg.Head; s.dsc = top_scope; s.next = nil; top_scope = s

proc enter(name: string, cl: int, n: int) =
  var obj: osg.Object
  new obj
  obj.class = cl; obj.val = n; obj.name = name
  obj.next = top_scope.next; top_scope.next = obj

proc stand_proc(pno: int) =
  if pno == 2:
    if sym == oss.lparen:
      oss.get(sym)
      oss.get(sym)
      if sym == oss.comma:
        oss.get(sym)
        oss.get(sym)
        oss.get(sym)
        osg.writeint()
  elif pno == 4: osg.writeln()

proc stat_sequence =
  var obj: osg.Object
  until sym > oss.semicolon: # until sym == eof
    if not sym == oss.ident:
      until sym >= oss.ident: oss.get(sym) # ident|semicolon|eof
    #echo "1: ", sym
    if sym == oss.ident:
      find(obj); oss.get(sym)
      #echo "  2: ", sym
      if obj.class == osg.SProc: stand_proc(obj.val)
    if sym == oss.semicolon: oss.get(sym)
    #echo "    3: ", sym

proc declarations =
  if sym == oss.Var:
    oss.get(sym); oss.get(sym); oss.get(sym)

proc compile*(src_path: string) =
  oss.init(src_path); oss.get(sym); declarations(); stat_sequence()

echo "Oberon-0 Compiler OSP"
open_scope()
enter "WriteInt", osg.SProc, 2
enter "WriteLn", osg.SProc, 4
