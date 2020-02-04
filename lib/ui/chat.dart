import 'package:flutter/material.dart';
import 'package:ui_1/data/colors.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  _buildMessages({String message, bool isMe}) {
    return Align(
      alignment: isMe ? Alignment.bottomRight : Alignment.bottomLeft,
      child: Container(
      
        constraints: BoxConstraints(
                maxWidth: 300.0
              ),
        margin:
            EdgeInsets.only(right: 10.0, top: 10.0, bottom: 10.0, left: 10.0),
        decoration: BoxDecoration(
            color: isMe ? primary : Colors.grey[300],
            borderRadius: BorderRadius.only(
              bottomLeft: isMe ? Radius.circular(10.0) : Radius.circular(0.0),
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
              bottomRight: isMe ? Radius.circular(0.0) : Radius.circular(10.0),
            )),
        padding: EdgeInsets.all(12.0),
        child: Text(
          message,
          style: TextStyle(color: isMe ? Colors.white : Colors.black),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.black) 
        , onPressed: (){
          Navigator.pop(context);
        }),
        title: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/1845208/pexels-photo-1845208.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
              backgroundColor: Colors.transparent,
            ),
            Container(
              margin: EdgeInsets.only(left: 5.0),
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Jolade Tofunmi',
                      style: Theme.of(context)
                          .textTheme
                          .body1
                          .copyWith(fontWeight: FontWeight.bold)),
                  Text('Online', style: Theme.of(context).textTheme.caption),
                ],
              ),
            )
          ],
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _buildMessages(isMe: true, message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod te'),
                _buildMessages(
                    isMe: true, message: 'But I must explain to you.'),
                _buildMessages(
                    isMe: true, message: 'The quick, brown fox jumps.'),
                _buildMessages(isMe: true, message: 'Over the wall......'),
                _buildMessages(isMe: false, message: 'I\'m fine.'),
                _buildMessages(isMe: true, message: 'Where are you ?'),
                _buildMessages(isMe: false, message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco'),
                _buildMessages(
                    isMe: false, message: 'What do you mean by that???'),
                _buildMessages(
                    isMe: false, message: 'Let us have a data instead'),
                _buildMessages(isMe: true, message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco'),
                _buildMessages(isMe: true, message: 'When?'),
                _buildMessages(
                    isMe: true, message: 'How about saturday night?'),
                _buildMessages(isMe: true, message: 'Are you free???'),
              ],
            ),
          )),
          Container(
            padding: EdgeInsets.only(bottom: 8.0, top: 8.0),
            decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey[300]))),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_a_photo,
                        color: Colors.grey[400],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.mic,
                        color: Colors.grey[400],
                      ),
                    ),
                    Expanded(
                        child: Container(
                      child: TextField(
                          autofocus: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(36.0),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.015,
                                horizontal: 5.0),
                            suffixIcon: Icon(Icons.mood, color: Colors.grey),
                            isDense: true,
                            filled: true,
                            fillColor: Colors.grey.withOpacity(0.2),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(36.0),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(36.0),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            hintText: 'Type a message',
                          )),
                    )),
                    SizedBox(width: 10.0),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
