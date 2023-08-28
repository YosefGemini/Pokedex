import 'package:flutter/material.dart';

class CostumButton extends StatefulWidget {
  final Function callback;
  final String text;
  CostumButton({required this.callback, required this.text});

  @override
  State<CostumButton> createState() => _CostumButtonState();
}

class _CostumButtonState extends State<CostumButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          widget.callback();
        });
        //widget.callback();
      },
      child: Text(widget.text),
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(
            Size(MediaQuery.of(context).size.width * 0.9, 50)),
        //backgroundColor: Colors.deepOrangeAccent.shade200
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
      ),
      //color: Color(0xFFF97F6F),
    );
  }
}
