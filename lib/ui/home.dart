import 'package:flutter/material.dart';
import 'package:ui_1/data/callPreview.dart';
import 'package:ui_1/data/chatPreview.dart';
import 'package:ui_1/data/chatStory.dart';
import 'package:ui_1/data/colors.dart';
import 'package:ui_1/shared/addStory.dart';
import 'package:ui_1/shared/avatar.dart';
import 'package:ui_1/shared/callUi.dart';
import 'package:ui_1/shared/chatPrevUi.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'CHAT'),
    Tab(text: 'FAVOURITE'),
    Tab(text: 'CALLS'),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
                backgroundColor: primary,
                onPressed: () {
                },
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
          backgroundColor: Colors.white,
          body: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                height: 65,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    AddStory(),
                    Row(
                      children: chatStories
                          .map((story) => Avatar(
                                imageUrl: story.image,
                              ))
                          .toList(),
                    )
                  ],
                ),
              ),
              TabBar(
                indicatorColor: primary,
                controller: _tabController,
                tabs: [
                  new Tab(
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Chats', style: TextStyle(color: Colors.black),
                      ),
                      Container(
                          height: 5.0,
                          width: 5.0,
                          margin: EdgeInsets.symmetric(horizontal: 3.0),
                          padding: EdgeInsets.symmetric(horizontal: 3.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            // borderRadius: BorderRadius.circular(3.0),
                            color: secondary,
                            // color: Colors.black,
                          ),
                          )
                    ],
                  )),
                  new Tab(
                      child: Text(
                    'Favourites',style: TextStyle(color: Colors.black)
                  )),
                  new Tab(
                      child: Text(
                    'Calls', style: TextStyle(color: Colors.black)
                  )),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    ListView(
                        children: ListTile.divideTiles(
                            context: context,
                            tiles: chatPrevs.map((chat) => ChatPrevUi(
                                  imageUrl: chat.image,
                                  name: chat.name,
                                  lastMsg: chat.lastMsg,
                                  unreadMsgs: chat.unreadMsgs,
                                ))).toList()

                        ),
                    ListView(
                        children: ListTile.divideTiles(
                            context: context,
                            tiles: matchChatPrevs.map((chat) => ChatPrevUi(
                                  imageUrl: chat.image,
                                  name: chat.name,
                                  lastMsg: chat.lastMsg,
                                  unreadMsgs: chat.unreadMsgs,
                                ))).toList()

                        ),
                            ListView(
                        children: ListTile.divideTiles(
                            context: context,
                            tiles: callPrev.map((chat) => CallUi(
                                  imageUrl: chat.image,
                                  name: chat.name,
                                  time: chat.time,
                                ))).toList()

                        )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
