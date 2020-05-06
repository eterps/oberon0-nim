proc sym_to_label(sym: int): string =
  if sym == 21: result = "int"
  elif sym == 28: result = "("
  elif sym == 31: result = "ident"
  elif sym == 40: result = ","
  elif sym == 41: result = ":"
  elif sym == 44: result = ")"
  elif sym == 52: result = ";"
  elif sym == 65: result = "var"
  elif sym == 70: result = "eof"
  else: result = $sym
