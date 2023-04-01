import 'package:calculator_app/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var userInput = "";
  var answer = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 70),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            userInput,
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            answer,
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            MyButton(
                              title: "AC",
                              color: Colors.grey,
                              onPress: () {
                                userInput = '';
                                answer = '';
                                setState(() {});
                              },
                            ),
                            MyButton(
                              title: "+/-",
                              color: Colors.grey,
                              onPress: () {
                                userInput += "+/-";
                                setState(() {});
                              },
                            ),
                            MyButton(
                              title: "%",
                              color: Colors.grey,
                              onPress: () {
                                userInput += "%";
                                setState(() {});
                              },
                            ),
                            MyButton(
                              title: "/",
                              color: Colors.orange,
                              onPress: () {
                                userInput += "/";
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            MyButton(
                              title: "7",
                              color: Colors.grey,
                              onPress: () {
                                userInput += '7';
                                setState(() {});
                              },
                            ),
                            MyButton(
                              title: "8",
                              color: Colors.grey,
                              onPress: () {
                                userInput += '8';
                                setState(() {});
                              },
                            ),
                            MyButton(
                              title: "0",
                              color: Colors.grey,
                              onPress: () {
                                userInput += '0';
                                setState(() {});
                              },
                            ),
                            MyButton(
                              title: "x",
                              color: Colors.orange,
                              onPress: () {
                                userInput += "x";
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            MyButton(
                              title: "4",
                              color: Colors.grey,
                              onPress: () {
                                userInput += '4';
                                setState(() {});
                              },
                            ),
                            MyButton(
                              title: "5",
                              color: Colors.grey,
                              onPress: () {
                                userInput += '5';
                                setState(() {});
                              },
                            ),
                            MyButton(
                              title: "6",
                              color: Colors.grey,
                              onPress: () {
                                userInput += '6';
                                setState(() {});
                              },
                            ),
                            MyButton(
                              title: "-",
                              color: Colors.orange,
                              onPress: () {
                                userInput += "-";
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            MyButton(
                              title: "1",
                              color: Colors.grey,
                              onPress: () {
                                userInput += '1';
                                setState(() {});
                              },
                            ),
                            MyButton(
                              title: "2",
                              color: Colors.grey,
                              onPress: () {
                                userInput += '2';
                                setState(() {});
                              },
                            ),
                            MyButton(
                              title: "3",
                              color: Colors.grey,
                              onPress: () {
                                userInput += '3';
                                setState(() {});
                              },
                            ),
                            MyButton(
                              title: "+",
                              color: Colors.orange,
                              onPress: () {
                                userInput += "+";
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            MyButton(
                              title: "0",
                              color: Colors.grey,
                              onPress: () {
                                userInput += '0';
                                setState(() {});
                              },
                            ),
                            MyButton(
                              title: ".",
                              color: Colors.grey,
                              onPress: () {
                                userInput += ".";
                                setState(() {});
                              },
                            ),
                            MyButton(
                              title: "DEL",
                              color: Colors.grey,
                              onPress: () {
                                userInput = userInput.substring(
                                    0, userInput.length - 1);
                                setState(() {});
                              },
                            ),
                            MyButton(
                              title: "=",
                              color: Colors.orange,
                              onPress: () {
                                equal();
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void equal() {
    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    double eval = expression.evaluate(EvaluationType.REAL, ContextModel());
    answer = eval.toString();
  }
}
