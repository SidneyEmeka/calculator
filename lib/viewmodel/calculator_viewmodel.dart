import 'package:scoped_model/scoped_model.dart';

class CalculatorViewmodel extends Model {
  RegExp cleanEnds = RegExp(r"([+X%/-])");
  List<dynamic> expression = [];
  List operators = [];
  String joinedExpression = "";
  String operator = "";

  String joinInputs(List<dynamic> a, List b) {
    joinedExpression = a.join();
    operator = operators.join();
    notifyListeners();
    return joinedExpression;
    //return "$joinedExpression : $operator";
  }

  List operandsSubstrings = [];
  List operatorsSubstrings = [];

  String disintegrate() {
    RegExp decimalNumbersOnly = RegExp(r"([+X%/-])");
    operandsSubstrings = joinedExpression.split(decimalNumbersOnly);
    notifyListeners();
    return operandsSubstrings.join();
  }

  num answer = 0;

  num percentage() {
    //print(joinedExpression);
    //print(operandsSubstrings);
    // print(operators);
    if (operators.contains("%")) {
      double a = double.parse(operandsSubstrings[0]);
      notifyListeners();
      return (a / 100);
    } else {
      notifyListeners();
      return 0;
    }
  }

  num calculate() {
    // print(joinedExpression);
    // print(operandsSubstrings);
    if (joinedExpression.startsWith("-")) {
      double a = double.parse(operandsSubstrings[1]);
      double b = double.parse(operandsSubstrings[2]);
      notifyListeners();
      if (joinedExpression.contains("+")) {
        notifyListeners();
        return (-a + b);
      }
      if (joinedExpression.contains("X")) {
        notifyListeners();
        return (-a * b);
      }
      if (joinedExpression.contains("/")) {
        notifyListeners();
        return (-a / b);
      }
      if (joinedExpression.contains("-")) {
        notifyListeners();
        return (-a - b);
      }
    }

    if (joinedExpression.contains("%")) {
      double a = double.parse(operandsSubstrings[0]);
      double b = double.parse(operandsSubstrings[1]);
      notifyListeners();
      return ((a / b) * 100);
    }
    if (joinedExpression.contains("/")) {
      double a = double.parse(operandsSubstrings[0]);
      double b = double.parse(operandsSubstrings[1]);
      notifyListeners();
      return (a / b);
    }
    if (joinedExpression.contains("X")) {
      double a = double.parse(operandsSubstrings[0]);
      double b = double.parse(operandsSubstrings[1]);
      notifyListeners();
      return (a * b);
    }
    if (joinedExpression.contains("-")) {
      double a = double.parse(operandsSubstrings[0]);
      double b = double.parse(operandsSubstrings[1]);
      notifyListeners();
      return (a - b).toDouble();
    }
    if (joinedExpression.contains("+")) {
      double a = double.parse(operandsSubstrings[0]);
      double b = double.parse(operandsSubstrings[1]);
      notifyListeners();
      return a + b;
    } else {
      return 0;
    }
  }
}
