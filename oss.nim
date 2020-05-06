include until, filestring, debugging

type Ident* = string

const
  null* = 0
  integer* = 21
  lparen* = 28
  ident* = 31
  comma* = 40
  colon* = 41
  rparen* = 44
  semicolon* = 52
  Var* = 65
  eof* = 70

var
  val*: int
  id*: Ident
  ch: char
  r: string

proc identifier(sym: var int) =
  sym = ident # const ident* = 31
  if ch == 'I': id = "WriteInt"
  elif ch == 'V': id = "VAR"; sym = Var
  elif ch == 'N': id = "INTEGER"
  else: id = "WriteLn"
  r.read(ch)

proc number(sym: var int) =
  val = 5
  sym = integer # const integer* = 21
  r.read(ch)

proc get*(sym: var int) =
  until sym != null: # retrieve syms until valid symbol
    while not r.eot and ch <= ' ': r.read(ch) # skip whitespace
    if ch == '\0': sym = eof
    elif ch == '(': r.read(ch); sym = lparen
    elif ch == ')': r.read(ch); sym = rparen
    elif ch == ',': r.read(ch); sym = comma
    elif ch == ':': r.read(ch); sym = colon
    elif ch == ';': r.read(ch); sym = semicolon
    elif ch < ':': number(sym)
    elif ch <= '{': identifier(sym)
    else: sym = null
  echo "got sym: ", sym_to_label(sym)

proc init*(src_path: string) =
  r = read_file(src_path)
