import 'package:lox_dart/lox_dart.dart';

abstract class Expr {
  T accept<T>(ExprVisitor<T> visitor);
}

mixin ExprVisitor<T> {
  T visitAssignExpr(Assign expr);
  T visitBinaryExpr(Binary expr);
  T visitCallExpr(Call expr);
  T visitGroupingExpr(Grouping expr);
  T visitLiteralExpr(Literal expr);
  T visitLogicalExpr(Logical expr);
  T visitUnaryExpr(Unary expr);
  T visitVariableExpr(Variable expr);
}

class Assign extends Expr {
  Assign(this.name,this.value);
  final Token name;
  final Expr value;

  @override
  T accept<T>(ExprVisitor<T> visitor) {
    return visitor.visitAssignExpr(this);
  }
}

class Binary extends Expr {
  Binary(this.left,this.operator,this.right);
  final Expr left;
  final Token operator;
  final Expr right;

  @override
  T accept<T>(ExprVisitor<T> visitor) {
    return visitor.visitBinaryExpr(this);
  }
}

class Call extends Expr {
  Call(this.callee,this.paren,this.arguments);
  final Expr callee;
  final Token paren;
  final List<Expr> arguments;

  @override
  T accept<T>(ExprVisitor<T> visitor) {
    return visitor.visitCallExpr(this);
  }
}

class Grouping extends Expr {
  Grouping(this.expression);
  final Expr expression;

  @override
  T accept<T>(ExprVisitor<T> visitor) {
    return visitor.visitGroupingExpr(this);
  }
}

class Literal extends Expr {
  Literal(this.value);
  final Object? value;

  @override
  T accept<T>(ExprVisitor<T> visitor) {
    return visitor.visitLiteralExpr(this);
  }
}

class Logical extends Expr {
  Logical(this.left,this.operator,this.right);
  final Expr left;
  final Token operator;
  final Expr right;

  @override
  T accept<T>(ExprVisitor<T> visitor) {
    return visitor.visitLogicalExpr(this);
  }
}

class Unary extends Expr {
  Unary(this.operator,this.right);
  final Token operator;
  final Expr right;

  @override
  T accept<T>(ExprVisitor<T> visitor) {
    return visitor.visitUnaryExpr(this);
  }
}

class Variable extends Expr {
  Variable(this.name);
  final Token name;

  @override
  T accept<T>(ExprVisitor<T> visitor) {
    return visitor.visitVariableExpr(this);
  }
}

