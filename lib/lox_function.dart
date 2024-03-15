import 'package:lox_dart/lox_dart.dart';

class LoxFunction extends LoxCallable {
  final Fun declaration;

  LoxFunction(this.declaration);

  @override
  int arity() => declaration.params.length;

  @override
  Object? call(Interpreter interpreter, List<Object?> arguments) {
    Environment closure = Environment(interpreter.globals);

    for (int i = 0; i < declaration.params.length; i++) {
      closure.define(declaration.params[i].lexeme, arguments[i]);
    }

    try {
      interpreter.executeBlock(declaration.body, closure);
    } catch (e) {
      if (e is ReturnException) {
        return e.value;
      } else {
        rethrow;
      }
    }

    return null;
  }

  @override
  String toString() => '<fn ${declaration.name.lexeme}>';
}
