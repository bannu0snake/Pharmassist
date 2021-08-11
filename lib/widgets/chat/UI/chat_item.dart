import 'package:flutter/material.dart';
import 'package:pharmassist/screens/chat/chat_screen.dart';

class ChatItem extends StatelessWidget {
  const ChatItem(
      this.name, this.profilePic, this.message, this.number, this.uid,
      {Key key})
      : super(key: key);

  final String name;
  final String message;
  final int number;
  final String uid;
  final String profilePic;

  @override
  Widget build(BuildContext context) {
    print(uid);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border(
          bottom: BorderSide(width: 1.0, color: Colors.black26),
        ),
      ),
      child: InkWell(
        onTap: () {
          print("I tapped this");
          Navigator.of(context).pushNamed(
            ChatScreen.routeName,
            arguments: {
              'name': name,
              'userId': uid,
            },
          );
        },
        splashColor: Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(4),
        child: Container(
          height: MediaQuery.of(context).size.height*0.1,
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue[200],
                    backgroundImage: NetworkImage(profilePic),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.05,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: Theme.of(context).textTheme.title,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.008,
                      ),
                      number != 0
                          ? Text(
                              message.length > 30 ? message.substring(0, 30) + '. . . .' : message,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.blue),
                            )
                          : Text(message.length > 30 ? message.substring(0, 30) + '. . . .' : message,),
                    ],
                  ),
                ],
              ),
              number != 0
                  ? CircleAvatar(
                      minRadius: 12,
                      backgroundColor: Colors.green[300],
                      child: Text(
                        '$number',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 0,
                      width: 0,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}