import 'package:flutter/material.dart';
import 'package:ui_1/data/colors.dart';
import 'package:ui_1/shared/avatar.dart';
import 'package:ui_1/ui/chat.dart';

class ChatPrevUi extends StatefulWidget {
  final String imageUrl;
  final String lastMsg;
  final String unreadMsgs;
  final String name;

  const ChatPrevUi(
      {Key key, this.imageUrl, this.lastMsg, this.unreadMsgs, this.name})
      : super(key: key);
  @override
  _ChatPrevUiState createState() => _ChatPrevUiState();
}

class _ChatPrevUiState extends State<ChatPrevUi> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
          Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ChatPage()),
  );
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
                Text(widget.lastMsg,
                    style: Theme.of(context).textTheme.caption),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                        decoration: BoxDecoration(
                            color: secondary,
                            shape: BoxShape.circle),
                        width: 20.0,
                        height: 20.0,
                        child: Center(
                            child: Text(widget.unreadMsgs,
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    )))),
                    Text('Just now',
                        style: Theme.of(context).textTheme.caption),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
