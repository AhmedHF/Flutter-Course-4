import 'dart:math';

import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

enum Type { male, female }

class _BMICalculatorState extends State<BMICalculator> {
  Type? type = Type.male;
  double height = 50;
  double weight = 30;
  int result = 0;
  double padValue = 0.0;

  bool selected = false;

  void _updatePadding(double value) {
    setState(() {
      padValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(children: [
              Text(
                'BMI Calculator',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 6
                    ..color = Colors.blue[700]!,
                ),
              ),
              Text(
                'BMI Calculator',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[300],
                ),
              ),
            ]),
            SizedBox(height: 10),
            RadioListTile<Type>(
              title: Text(
                'Male',
                style: TextStyle(
                  color: type == Type.male ? Colors.blue : Colors.black,
                  fontWeight:
                      type == Type.male ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              value: Type.male,
              shape: OutlineInputBorder(
                borderSide: BorderSide(
                    color: type == Type.male ? Colors.blue : Colors.black,
                    width: 2.0),
              ),
              groupValue: type,
              onChanged: (Type? value) {
                setState(() {
                  type = value;
                });
              },
            ),
            SizedBox(height: 10),
            RadioListTile<Type>(
              title: Text(
                'Female',
                style: TextStyle(
                  color: type == Type.female ? Colors.blue : Colors.black,
                  fontWeight:
                      type == Type.female ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              value: Type.female,
              shape: OutlineInputBorder(
                borderSide: BorderSide(
                    color: type == Type.female ? Colors.blue : Colors.black,
                    width: 2.0),
              ),
              groupValue: type,
              onChanged: (Type? value) {
                setState(() {
                  type = value;
                });
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  'Height : ${height.round()}',
                  style: TextStyle(
                    color: type == Type.male ? Colors.blue : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  'cm',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Transform.scale(
              scale: 0.8,
              child: Slider(
                value: height,
                min: 20,
                max: 220,
                // divisions: 5,
                label: height.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    height = value;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  'Weight : ${weight.round()}',
                  style: TextStyle(
                    color: type == Type.male ? Colors.blue : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  'kg',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Slider(
              value: weight,
              min: 0,
              max: 300,
              // divisions: 5,
              label: weight.round().toString(),
              onChanged: (double value) {
                setState(() {
                  weight = value;
                });
              },
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _updatePadding(padValue == 0.0 ? 50.0 : 0.0);
                  });
                },
                child: AnimatedPadding(
                  padding: EdgeInsets.all(padValue),
                  duration: const Duration(seconds: 5),
                  curve: Curves.easeInOut,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 5,
                    color: Colors.blueAccent,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      child: Stack(
                        children: <Widget>[
                          AnimatedPositioned(
                            width: selected
                                ? MediaQuery.of(context).size.width / 2
                                : padValue == 0.0
                                    ? MediaQuery.of(context).size.width - 20
                                    : MediaQuery.of(context).size.width - 120,
                            height: selected ? 60.0 : 90.0,
                            top: selected
                                ? 0.0
                                : padValue == 0.0
                                    ? 80.0
                                    : 30.0,
                            duration: const Duration(seconds: 2),
                            curve: Curves.fastOutSlowIn,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selected = !selected;
                                });
                              },
                              child: Container(
                                color: selected
                                    ? Colors.green[200]
                                    : Colors.green[400],
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        type == Type.male
                                            ? 'Tpye : Male'
                                            : 'Tpye : Female',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    Text('Result : $result',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(1000, 50),
              ),
              child: Text("Calculate",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              onPressed: () {
                double _result = weight / pow(height / 100, 2);
                setState(() {
                  result = _result.round();
                });
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
