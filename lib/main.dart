import 'package:bmicalculator/resultPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'gender.dart';
import 'eachCard.dart';
import 'package:bmicalculator/calculator.dart';
import 'consts.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF303030),
        scaffoldBackgroundColor: Color(0xFF202020),
        textTheme: TextTheme(
          bodyText2: TextStyle(
            fontSize: 27.0,
            color: Color(0xFFffffff),
          ),
        ),
      ),
      home: Scaffold(
        body: SafeArea(
          child: mainApp(),
        ),
      ),
    ),
  );
}

enum Gender {
  male,
  female,
}

class mainApp extends StatefulWidget {
  const mainApp({Key? key}) : super(key: key);

  @override
  _mainAppState createState() => _mainAppState();
}

class _mainAppState extends State<mainApp> {
  // Color maleColor = this.mainblack;
  // Color femaleColor = this.mainblack;
  Color maleColor = Color(0xFF303030);
  Color femaleColor = Color(0xFF303030);
  int gend = -1;
  Gender SelectedGender = Gender.male;

  int height = 149;
  int weight = 60;
  int age = 16;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 1,
          child: Center(
            child: Text(
              'BMI Calculator',
              style: TextStyle(
                fontFamily: 'head',
              ),
            ),
          ),
        ),
        Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        SelectedGender = Gender.male;
                      });
                    },
                    child: cards(
                        (SelectedGender == Gender.male) ? selected : mainblack,
                        gender(CupertinoIcons.person_solid, "Male")),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        SelectedGender = Gender.female;
                      });
                    },
                    child: cards(
                        (SelectedGender == Gender.female)
                            ? selected
                            : mainblack,
                        gender(CupertinoIcons.person, "Females")),
                  ),
                ),
              ],
            )),
        Expanded(
          flex: 3,
          child: cards(
              mainblack,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: small,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: numstyle),
                        Text('cm', style: small),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFFF40A4),
                          overlayColor: Color(0xFFFF40A4),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0)),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 240,
                        activeColor: Color(0xFFFF40A4),
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (it) {
                          setState(() {
                            height = it.toInt();
                          });
                        },
                      ),
                    )
                  ],
                ),
              )),
        ),
        Expanded(
          flex: 3,
          child: Row(
            children: [
              Expanded(
                child: cards(
                    mainblack,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Weight', style: small),
                        Text('$weight', style: numstyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FloatingActionButton(
                              backgroundColor: Color(0xFF505050),
                              onPressed: () {
                                setState(() {
                                weight--;
                                });
                              },
                              child: Text('-',style: numstyle,),
                            ),
                            FloatingActionButton(
                              backgroundColor: Color(0xFF505050),
                              onPressed: () {
                                setState(() {
                                weight++;
                                });
                              },
                              child: Text('+',style: numstyle,),
                            ),
                          ],
                        )
                      ],
                    )),
              ),
              Expanded(
                child: cards(mainblack,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Age', style: small),
                        Text('$age', style: numstyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FloatingActionButton(
                              backgroundColor: Color(0xFF505050),
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: Text('-',style: numstyle,),
                            ),
                            FloatingActionButton(
                              backgroundColor: Color(0xFF505050),
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: Text('+',style: numstyle,),
                            ),
                          ],
                        )
                      ],
                    )
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex:1,
          child: ElevatedButton(
            child: Text('Calculate',style: TextStyle(fontSize: 23.0),),
            onPressed: (){
              calculator calc = calculator(height, weight);
              Navigator.push(context,MaterialPageRoute(builder: (context) => result(calc.calculate_BMI(),calc.getResult(),calc.getInterpretation()),),);

            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFF40A4)),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
