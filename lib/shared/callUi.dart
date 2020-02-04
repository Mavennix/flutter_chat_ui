import 'package:flutter/material.dart';
import 'package:ui_1/data/colors.dart';
import 'package:ui_1/shared/avatar.dart';

class CallUi extends StatefulWidget {
  final String imageUrl;
  final String time;
  final String name;

  const CallUi(
      {Key key, this.imageUrl, this.time, this.name})
      : super(key: key);
  @override
  _CallUiState createState() => _CallUiState();
}

class _CallUiState extends State<CallUi> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        // Navigator.pushNamed(context, InChatUiRoute);
      },
      child: Container(
        padding:
            EdgeInsets.only(top: 10.0, bottom: 10.0, left: 5.0, right: 15.0),
        child: Row(
          children: <Widget>[
            Avatar(
              imageUrl: widget.imageUrl,
              border: false,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(widget.name,
                    style: Theme.of(context)
                        .textTheme
                        .body1
                        .copyWith(fontWeight: FontWeight.bold)),
                Text(widget.time,
                    style: Theme.of(context).textTheme.caption),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.call, color: secondary,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
