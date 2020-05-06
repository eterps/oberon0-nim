import oss

const
  Head* = 0 # class/mode
  SProc* = 6

type
  Object* = ref ObjDesc
  ObjDesc* = object
    class*, lev*: int
    next*, dsc*: Object
    name*: oss.Ident
    val*: int

proc writeint* =
  echo "WriteInt generated!"

proc writeln* =
  echo "WriteLn generated!"
