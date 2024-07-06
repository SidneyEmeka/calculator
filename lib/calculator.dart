
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  List<dynamic> expression = [];
  List operators = [];
  String joinedExpression = "";
  String operator = "";

  String joinInputs(List<dynamic> a, List b) {
    joinedExpression = a.join();
    operator = operators.join();
    return joinedExpression;
    //return "$joinedExpression : $operator";
  }

  List operandsSubstrings = [];
  List operatorsSubstrings = [];

String disintegrate() {
    RegExp decimalNumbersOnly = RegExp(r"([+X%/-])");
    operandsSubstrings = joinedExpression.split(decimalNumbersOnly);
    return operandsSubstrings.join();
}
num answer = 0;
num calculate() {
  print(joinedExpression);
  print(operandsSubstrings);

  if(joinedExpression.contains("%")) {
    double a = double.parse(operandsSubstrings[0]);
    double b = double.parse(operandsSubstrings[1]);
    return ((a/b) * 100);
  }if(joinedExpression.contains("/")) {
    double a = double.parse(operandsSubstrings[0]);
    double b = double.parse(operandsSubstrings[1]);
    return (a/b);
  }if(joinedExpression.contains("X")) {
    double a = double.parse(operandsSubstrings[0]);
    double b = double.parse(operandsSubstrings[1]);
    return (a*b);
  }if(joinedExpression.contains("-")) {
    double a = double.parse(operandsSubstrings[0]);
    double b = double.parse(operandsSubstrings[1]);
    return (a-b).toDouble();
  }if(joinedExpression.contains("+")) {
    double a = double.parse(operandsSubstrings[0]);
    double b = double.parse(operandsSubstrings[1]);
    return a+b;
  }
  else {return 9999999999;}
}

Widget myPadding(double val) {
  return SizedBox(
    height: val,
  );
}


  Widget display(String math, String result) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.purple.shade50,
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            math,
            style: const TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.normal),
          ),
          Text(
            result,
            style: TextStyle(fontSize: 40, color: Colors.grey.shade800, fontWeight: FontWeight.normal),
          )
        ],
      ),
    );
  }

  Widget calcButtons(Widget what, Color bg, void Function() tapped) {
    return GestureDetector(
      onTap: tapped,
      child: SizedBox(
        width: 85,
        height: 75,
        child: Card(
          color: bg,
          elevation: 10,
          child: Center(child: what),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              display(joinInputs(expression, operators), answer.toString()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  calcButtons(
                      const Text(
                        "AC",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      Colors.purple.shade200, () {
                    setState(() {
                      expression = [];
                      operators = [];
                      answer = 0;
                    });
                  }),
                  calcButtons(
                      const Text(
                        "+/-",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Colors.purple.shade200, () {
                    setState(() {
                      expression.insert(0, "-");
                    });
                  }),
                  calcButtons(
                      const Text(
                        "%",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Colors.purple.shade200, () {
                    setState(() {
                      expression.add("%");
                      operators.add("%");
                    });
                  }),
                  calcButtons(
                      const Text(
                        "/",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Colors.purple.shade200, () {
                    setState(() {
                      expression.add("/");
                      operators.add("/");
                    });
                  }),
                ],
              ),
              myPadding(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  calcButtons(
                      const Text(
                        "7",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Colors.purple.shade50, () {
                    setState(() {
                      expression.add(7);
                    });
                  }),
                  calcButtons(
                      const Text(
                        "8",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Colors.purple.shade50, () {
                    setState(() {
                      expression.add(8);
                    });
                  }),
                  calcButtons(
                      const Text(
                        "9",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Colors.purple.shade50, () {
                    setState(() {
                      expression.add(9);
                    });
                  }),
                  calcButtons(
                      const Text(
                        "X",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Colors.purple.shade200, () {
                    setState(() {
                      expression.add("X");
                      operators.add("X");
                    });
                  }),
                ],
              ),
              myPadding(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  calcButtons(
                      const Text(
                        "4",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Colors.purple.shade50, () {
                    setState(() {
                      expression.add(4);
                    });
                  }),
                  calcButtons(
                      const Text(
                        "5",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Colors.purple.shade50, () {
                    setState(() {
                      expression.add(5);
                    });
                  }),
                  calcButtons(
                      const Text(
                        "6",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Colors.purple.shade50, () {
                    setState(() {
                      expression.add(6);
                    });
                  }),
                  calcButtons(
                      const Text(
                        "-",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w400),
                      ),
                      Colors.purple.shade200, () {
                    setState(() {
                      expression.add("-");
                      operators.add("-");
                    });
                  }),
                ],
              ),
              myPadding(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  calcButtons(
                      const Text(
                        "1",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Colors.purple.shade50, () {
                    setState(() {
                      expression.add(1);
                    });
                  }),
                  calcButtons(
                      const Text(
                        "2",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Colors.purple.shade50, () {
                    setState(() {
                      expression.add(2);
                    });
                  }),
                  calcButtons(
                      const Text(
                        "3",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Colors.purple.shade50, () {
                    setState(() {
                      expression.add(3);
                    });
                  }),
                  calcButtons(
                      const Text(
                        "+",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w400),
                      ),
                      Colors.purple.shade200, () {
                    setState(() {
                      expression.add("+");
                      operators.add("+");
                    });
                  }),
                ],
              ),
              myPadding(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        expression.add(0);
                      });
                    },
                    child: SizedBox(
                      width: 180,
                      height: 75,
                      child: Card(
                        color: Colors.purple.shade50,
                        elevation: 10,
                        child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 35.0),
                              child: Text("0",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)),
                            )),
                      ),
                    ),
                  ),
                  calcButtons(
                      const Text(
                        ".",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                      Colors.purple.shade50, () {
                    setState(() {
                      expression.add(".");
                    });
                  }),
                  calcButtons(
                      const Text(
                        "=",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Colors.purple.shade200,
                      () {
                        setState(() {
                          joinInputs(expression, operators);
                          disintegrate();
                         answer = calculate();
                        });
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
