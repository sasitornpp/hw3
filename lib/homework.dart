import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:hw3/guess.dart';

class hw3 extends StatefulWidget{

  @override
  State<hw3> createState() => _hw3State();
}





class _hw3State extends State<hw3> {
  var _input = '';
  var _message = '';
  var count = 0;
  var games = Game();


  void _handleClickButton(int num) {

    setState(() {
      if (num == -1) {
        _input = _input.substring(0, _input.length - 1);
      } else if(num == -2){
        _input = '';
      } else {
        _input = _input + num.toString();
      }
    });

    if(_input.length > 3){
      setState(() {
        _input = _input.substring(0, _input.length - 4);
      });
    }
  }

  void guessButton() {

    if (_input == '') {
      return;
    }
    var myInt = int.tryParse(_input);
    if(myInt == null) {
      return;
    }

    setState(() {
      int result  = games.doGuess(myInt);
      if(result == 0){
        count += 1;
        _message = "$_input : มากเกินไป";
        _input = '';
      }else if(result == -1){
        count += 1;
        _message = "$_input : น้อยเกินไป";
        _input = '';
      }else {
        count += 1;
        _message = "$_input : ถูกต้อง (ทาย $count ครั้ง)";
      }
    });

  }
  // ปุ่มเคลียร์
  Widget _clearNum(int num){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          // function expression ทำหน้าที่เป็น callback function
          _handleClickButton(num);
        },
        customBorder: CircleBorder(),
        child: Container(
          width: 60.0,
          height: 60.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: num != -3
                ? Border.all(
              color: Color(0xFFCCCCCC),
              width: 1.0,
            )
                : null,
          ),
          child: num == -2
              ? Icon(Icons.close)
              : Text(
            num.toString(),
            style: GoogleFonts.firaCode(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNumberButton(int num) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          // function expression ทำหน้าที่เป็น callback function
          _handleClickButton(num);
        },
        customBorder: CircleBorder(),
        child: Container(
          width: 60.0,
          height: 60.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: num != -3
                ? Border.all(
              color: Color(0xFFCCCCCC),
              width: 1.0,
            )
                : null,
          ),
          child: num == -1
              ? Icon(Icons.backspace_outlined)
              : Text(
            num.toString(),
            style: GoogleFonts.firaCode(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GUESS THE NUMBER')),

      body: Container(
        decoration: BoxDecoration(
          color: Colors.pink.shade100, //สีพื้นหลังของ Container
          border: Border.all(
            width: 5.0,
            color: Colors.deepPurple.shade100,
          ),
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(16.0),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/guess_logo.png', width: 80.0),
            SizedBox(height: 24.0),

            Text('Guess The Number',
              style: TextStyle(
                fontWeight: FontWeight. bold,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 12.0),

            Text(_input,
              style: TextStyle(
                fontWeight: FontWeight. bold,
                fontSize: 50,
              ),
            ),
            Text(_message,
              style: TextStyle(
                fontWeight: FontWeight. bold,
                fontSize: 18,
              ),
            ),

            SizedBox(height: 24.0),
            Column(
              children: [
                for (var row in [
                  [1, 2, 3],
                  [4, 5, 6],
                  [7, 8, 9],
                ])
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [for (var i in row) _buildNumberButton(i)],
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _clearNum(-2),
                    _buildNumberButton(0),
                    _buildNumberButton(-1),
                  ],
                )
              ],
            ),
            //Text(_input),
            SizedBox(height: 12.0),
            ElevatedButton(onPressed: guessButton, child: Text('GUESS')),
            
          ],
        ),

      ),
    );
  }

  void showMyDialog(BuildContext context, String s, String t) {}
}