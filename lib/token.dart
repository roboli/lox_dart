enum TokenType {
  and,
  bang,
  bangEqual,
  braceLeft,
  braceRight,
  boolean,
  comma,
  comment,
  equal,
  equalEqual,
  else$,
  eof,
  false$,
  for$,
  fun,
  greater,
  greaterEqual,
  identifier,
  if$,
  less,
  lessEqual,
  minus,
  nil,
  number,
  or,
  parenLeft,
  parenRight,
  plus,
  print,
  return$,
  semicolon,
  star,
  slash,
  string,
  true$,
  var$,
  while$,
}

class Token {
  final TokenType type;
  final String lexeme;
  final int line;
  final Object? value;

  Token({required this.type, required this.lexeme, required this.line, this.value});

  @override
  String toString() {
    return '<${type.name} $lexeme $value>';
  }
}
