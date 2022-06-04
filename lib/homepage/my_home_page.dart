import 'dart:math';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _color = Colors.white;
  var _textColor = Colors.black;

  void _changeColor() {
    const byteMaxValue = 255;
    final rgb = () {
      final rnd = Random();
      const lessThan = 256;

      return [
        rnd.nextInt(lessThan),
        rnd.nextInt(lessThan),
        rnd.nextInt(lessThan)
      ];
    }();

    setState(() {
      _color = Color.fromARGB(byteMaxValue, rgb[0], rgb[1], rgb[2]);
      _textColor = Color.fromARGB(byteMaxValue,
                                  byteMaxValue - rgb[0],
                                  byteMaxValue - rgb[1],
                                  byteMaxValue - rgb[2]);
    });
  }

  @override
  Widget build(BuildContext context) {
    const duration = Duration(seconds: 1);
    const fontSize = 42.0;
    const shadow = [Shadow(offset: Offset(1.0, 1.0), color: Colors.black)];
    const text = 'Hey there';
    final size =  MediaQuery.of(context).size;

    return Scaffold(
      body: GestureDetector(
        onTap: () => _changeColor(),
        child: AnimatedContainer(
          color: _color,
          height: size.height,
          width: size.width,
          duration: duration,
          child: Center(
            child: AnimatedDefaultTextStyle(
              style: TextStyle(
                color: _textColor,
                shadows: shadow,
                fontSize: fontSize,
              ),
              duration: duration,
              child: const Text(text),
            ),
          ),
        ),
      ),
    );
  }
}
