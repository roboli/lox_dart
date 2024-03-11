import 'package:lox_dart/lox_dart.dart';

abstract class Stmt {
  T accept<T>(StmtVisitor<T> visitor);
}

mixin StmtVisitor<T> {
  T visitExpressionStmt(Expression stmt);
  T visitPrintStmt(Print stmt);
  T visitVarStmt(Var stmt);
}

class Expression extends Stmt {
  Expression(this.expression);
  final Expr expression;

  @override
  T accept<T>(StmtVisitor<T> visitor) {
    return visitor.visitExpressionStmt(this);
  }
}

class Print extends Stmt {
  Print(this.expression);
  final Expr expression;

  @override
  T accept<T>(StmtVisitor<T> visitor) {
    return visitor.visitPrintStmt(this);
  }
}

class Var extends Stmt {
  Var(this.name,this.initializer);
  final Token name;
  final Expr initializer;

  @override
  T accept<T>(StmtVisitor<T> visitor) {
    return visitor.visitVarStmt(this);
  }
}
