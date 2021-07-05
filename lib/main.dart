import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
          primarySwatch: Colors.blue,
    ),
        home:MyHomepage(),
        // This is the theme of your application.
    );
  }
}

class MyHomepage extends StatefulWidget {
  const MyHomepage({Key? key}) : super(key: key);

  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  double firstnum=0;
  double secondnum=0;
  String display='';
  String result='';
  String operator='';
  String temp='';
  String temp1='';
  String deci='';
  void btnclicked(String btnval){

    if(btnval=='CLEAR'){
      display='';
      firstnum=0;
      secondnum=0;
      result='';
      temp='';
      temp1='';
      deci='';
    }
    else if(btnval=='.'){
      temp=display+'.';
      temp1=temp1+'.';
    }
    else if(btnval=='+' || btnval=='-' || btnval=='x' || btnval=='/'){
      firstnum = double.parse(display);
      temp1='';
      print('zero');
      print(firstnum);
      result='';
      operator=btnval;
      temp=display+operator;
    }
    else if(btnval=='='){
      secondnum=double.parse(temp1);
      print(secondnum);
      temp='';
      if(operator =='+'){
        result=(firstnum + secondnum).toString();
      }
       if(operator =='-'){
        result=(firstnum - secondnum).toString();
      }
       if(operator =='x'){
        result=(firstnum * secondnum).toString();
      }
       if(operator =='/'){
        result=(firstnum / secondnum).toString();
      }

    }
    else{
        temp=display+btnval;
        temp1=temp1+btnval;
        print(temp1);

    }
    if(result.length>0){
      temp=result;
    }
    setState(() {
      display=temp;
    });
  }

  Widget custombutton(String btnval){
    return Expanded(
        child: MaterialButton(
          padding: EdgeInsets.all(25.0),
          onPressed: ()=>btnclicked(btnval),
          child: Text(
            btnval,
            style: TextStyle(
              fontSize: 25.0,

            ),
          ),

        ),

    );
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.cyan[100],
        appBar: AppBar(
          title:Text('Calculator'),
          centerTitle: true,
        ),
     body: Container(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.end,
         children: [
           Expanded(
               child: Container(
                 alignment: Alignment.topRight,
                 padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                 child: Text(
                      display,
                   style: TextStyle(
                     fontSize: 50.0,
                     fontWeight: FontWeight.bold,

                   ),
                 ),
               ),
           ),

           Row(
             children: [
               custombutton('7'),
               custombutton('8'),
               custombutton('9'),
               custombutton('x'),

             ],
           ),
           Row(
             children: [
               custombutton('4'),
               custombutton('5'),
               custombutton('6'),
               custombutton('-'),

             ],
           ),
           Row(
             children: [
               custombutton('1'),
               custombutton('2'),
               custombutton('3'),
               custombutton('+'),

             ],
           ),
           Row(
             children: [
               custombutton('0'),
               custombutton('00'),
               custombutton('.'),
               custombutton('/'),

             ],
           ),
           Row(
             children: [
               custombutton('CLEAR'),
               custombutton('='),
             ],
           ),

         ],
       ),
     ),
    );
  }
}

// This trailing comma makes auto-formatting nicer for build methods.



