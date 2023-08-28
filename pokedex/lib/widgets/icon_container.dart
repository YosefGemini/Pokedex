import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IconContainer extends StatefulWidget {
  final String imageurl;

  IconContainer({required this.imageurl});

  //  super(key: key);

  @override
  State<IconContainer> createState() => _IconContainerState();
}

class _IconContainerState extends State<IconContainer> {
  //  super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      height: 200.0,
      child: SizedBox(
        child: Image(
          image: Image.asset(widget.imageurl).image,
        ),
      ),
    );
  }
}
