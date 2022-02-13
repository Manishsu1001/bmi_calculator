import 'package:bmicalculator/consts.dart';
import 'package:flutter/material.dart';

class result extends StatelessWidget {
  result(this.bmi,this.condition,this.suggestion);
  final String bmi;
  final String condition;
  final String suggestion;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
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
              flex: 6,
              child: Container(
                padding: EdgeInsets.all(15.0),
                child: Container(
                  color: mainblack,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(child: Text('Your Score',style: numstyle,),),
                      Center(child: Text(bmi,style: bignum,),),
                      Center(child: Text(condition,style:green),),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Center(child: Text(suggestion,style: small,),),
                      ),

                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text('Re-Calculate',style: TextStyle(fontSize: 23.0),),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFF40A4)),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  ),
                ),),
          ],
        ),
      ),
    );
  }
}
