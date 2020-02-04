import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ui_1/data/colors.dart';

class Avatar extends StatefulWidget {
  final String imageUrl;
  final bool border;

  const Avatar({Key key, this.imageUrl, this.border = true}) : super(key: key);
  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
        width: 65.0,
        height: 65.0,
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            border: widget.border ? Border.all(color: primary, width: 2.0) : null,
            image: new DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  widget.imageUrl,
                  // fit: BoxFit.cover,
                ))));
  }
}
