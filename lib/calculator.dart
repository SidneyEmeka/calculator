import 'package:calculator/viewmodel/calculator_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final calcModel = CalculatorViewmodel();

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
        // color: Colors.purple.shade50,
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            math,
            style: const TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.normal),
          ),
          Text(
            result,
            style: TextStyle(
                fontSize: 40,
                color: Colors.grey.shade800,
                fontWeight: FontWeight.normal),
          )
        ],
      ),
    );
  }

  Widget calcButtons(Widget what, Color bg, void Function() tapped) {
    return Material(
      color: Colors.purple.shade50,
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      body: ScopedModel<CalculatorViewmodel>(
          model: calcModel,
          child: ScopedModelDescendant<CalculatorViewmodel>(
              builder: (context, child, model) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    display(
                        model.joinInputs(model.expression, model.operators),
                        model.answer.toString().endsWith(".0")
                            ? model.answer.toStringAsFixed(0)
                            : model.answer.toString() == "0"
                                ? "0"
                                : model.answer.toDouble().toString()),
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
                          model.expression = [];
                          model.operators = [];
                          model.answer = 0;
                        }),
                        calcButtons(
                            const Text(
                              "+/-",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            Colors.purple.shade200, () {
                          model.expression.insert(0, "-");
                        }),
                        calcButtons(
                            const Text(
                              "%",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            Colors.purple.shade200, () {
                          model.expression.add("%");
                          model.operators.add("%");
                          model.disintegrate();
                          model.answer = model.percentage();
                        }),
                        calcButtons(
                            const Text(
                              "/",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            Colors.purple.shade200, () {
                          if (model.expression.contains("+") ||
                              model.expression.contains("X") ||
                              model.expression.contains("/")) {
                            return;
                          } else {
                            model.expression.add("/");
                            model.operators.add("/");
                          }
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
                          model.expression.add(7);
                        }),
                        calcButtons(
                            const Text(
                              "8",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            Colors.purple.shade50, () {
                          model.expression.add(8);
                        }),
                        calcButtons(
                            const Text(
                              "9",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            Colors.purple.shade50, () {
                          model.expression.add(9);
                        }),
                        calcButtons(
                            const Text(
                              "X",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            Colors.purple.shade200, () {
                          if (model.expression.contains("+") ||
                              model.expression.contains("X") ||
                              model.expression.contains("/")) {
                            return;
                          } else {
                            model.expression.add("X");
                            model.operators.add("X");
                          }
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
                          model.expression.add(4);
                        }),
                        calcButtons(
                            const Text(
                              "5",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            Colors.purple.shade50, () {
                          model.expression.add(5);
                        }),
                        calcButtons(
                            const Text(
                              "6",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            Colors.purple.shade50, () {
                          model.expression.add(6);
                        }),
                        calcButtons(
                            const Text(
                              "-",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w400),
                            ),
                            Colors.purple.shade200, () {
                          if (model.expression.contains("+") ||
                              model.expression.contains("X") ||
                              model.expression.contains("/")) {
                            return;
                          } else {
                            model.expression.add("-");
                            model.operators.add("-");
                          }
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
                          model.expression.add(1);
                        }),
                        calcButtons(
                            const Text(
                              "2",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            Colors.purple.shade50, () {
                          model.expression.add(2);
                        }),
                        calcButtons(
                            const Text(
                              "3",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            Colors.purple.shade50, () {
                          model.expression.add(3);
                        }),
                        calcButtons(
                            const Text(
                              "+",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w400),
                            ),
                            Colors.purple.shade200, () {
                          if (model.expression.contains("+") ||
                              model.expression.contains("X") ||
                              model.expression.contains("/")) {
                            return;
                          } else {
                            model.expression.add("+");
                            model.operators.add("+");
                          }
                        }),
                      ],
                    ),
                    myPadding(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            model.expression.add(0);
                          },
                          child: SizedBox(
                            width: 170,
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
                          if (!model.expression.contains(".")) {
                            model.expression.add(".");
                          } else {
                            return;
                          }
                        }),
                        calcButtons(
                            const Text(
                              "=",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            Colors.purple.shade200, () {
                          model.joinInputs(model.expression, model.operators);
                          model.disintegrate();
                          model.answer = model.calculate();
                        }),
                      ],
                    ),
                  ],
                ),
              ),
            );
          })),
    );
  }
}
