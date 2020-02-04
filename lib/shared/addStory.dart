import 'package:flutter/material.dart';
import 'package:ui_1/data/colors.dart';
import 'package:ui_1/shared/avatar.dart';

class AddStory extends StatefulWidget {
  @override
  _AddStoryState createState() => _AddStoryState();
}

class _AddStoryState extends State<AddStory> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Avatar(
            border: false,
            imageUrl:
                'https://images.pexels.com/photos/1253408/pexels-photo-1253408.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
        Positioned(
          bottom: 5.0,
          right: 6.0,
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1.0),
                  color: secondary,
                  shape: BoxShape.circle),
              // width: 20.0,
              // height: 20.0,
              child: Center(
                  child: Icon(Icons.add, color: Colors.white, size: 20.0))),
        )
      ],
    );
  }
}
