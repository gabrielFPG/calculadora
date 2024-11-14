import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'calculadora/Gabriel Pantoja/4A',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _displayText = '0';
  String _operation = '';
  double _firstOperand = 0;
  double _secondOperand = 0;

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _displayText = '0';
        _operation = '';
        _firstOperand = 0;
        _secondOperand = 0;
      } else if (buttonText == 'DEL') {
        _displayText = _displayText.length > 1
            ? _displayText.substring(0, _displayText.length - 1)
            : '0';
      } else if (buttonText == '+' || buttonText == '-' || buttonText == '×' || buttonText == '÷') {
        _firstOperand = double.parse(_displayText);
        _operation = buttonText;
        _displayText = '0';
      } else if (buttonText == '=') {
        _secondOperand = double.parse(_displayText);
        if (_operation == '+') {
          _displayText = (_firstOperand + _secondOperand).toString();
        } else if (_operation == '-') {
          _displayText = (_firstOperand - _secondOperand).toString();
        } else if (_operation == '×') {
          _displayText = (_firstOperand * _secondOperand).toString();
        } else if (_operation == '÷') {
          _displayText = (_firstOperand / _secondOperand).toString();
        }
        _operation = '';
      } else {
        _displayText += buttonText;
        if (_displayText.startsWith('0') && _displayText.length > 1 && !_displayText.contains('.')) {
          _displayText = _displayText.substring(1);
        }
      }
    });
  }

  Widget _buildButton(String text, Color color) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ElevatedButton(
          onPressed: () => _buttonPressed(text),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.all(18.0),
            shape: CircleBorder(),
          ),
          child: Text(
            text,
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('calculadora'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            alignment: Alignment.centerRight,
            child: Text(
              _displayText,
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.w300, color: Colors.black87),
            ),
          ),
          Divider(color: Colors.deepPurple),
          Row(
            children: <Widget>[
              _buildButton('C', Colors.deepPurple),
              _buildButton('DEL', Colors.pinkAccent),
              _buildButton('%', Colors.deepPurple),
              _buildButton('÷', Colors.deepPurple),
            ],
          ),
          Row(
            children: <Widget>[
              _buildButton('7', Colors.grey),
              _buildButton('8', Colors.grey),
              _buildButton('9', Colors.grey),
              _buildButton('×', Colors.deepPurple),
            ],
          ),
          Row(
            children: <Widget>[
              _buildButton('4', Colors.grey),
              _buildButton('5', Colors.grey),
              _buildButton('6', Colors.grey),
              _buildButton('-', Colors.deepPurple),
            ],
          ),
          Row(
            children: <Widget>[
              _buildButton('1', Colors.grey),
              _buildButton('2', Colors.grey),
              _buildButton('3', Colors.grey),
              _buildButton('+', Colors.deepPurple),
            ],
          ),
          Row(
            children: <Widget>[
              _buildButton('0', Colors.grey),
              _buildButton('.', Colors.grey),
              _buildButton('ANS', Colors.grey),
              _buildButton('=', Colors.deepPurple),
            ],
          ),
        ],
      ),
    );
  }
}
