import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/models/user_model.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({
    Key key,
    @required this.currentUser,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              ProfileAvatar(imageUrl: currentUser.imageUrl),
              const SizedBox(width: 8.0),
              Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: 'A cosa stai pensando?'),
                ),
              )
            ],
          ),
          Divider(height: 10.0, thickness: 0.5),
          Container(
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton.icon(
                    onPressed: () => print('live'),
                    icon: Icon(
                      Icons.videocam,
                      color: Colors.red,
                    ),
                    label: Text('Live')),
                VerticalDivider(
                  width: 8.0,
                ),
                FlatButton.icon(
                    onPressed: () => print('Foto'),
                    icon: Icon(
                      Icons.photo_library,
                      color: Colors.green,
                    ),
                    label: Text('Foto')),
                VerticalDivider(
                  width: 8.0,
                ),
                FlatButton.icon(
                    onPressed: () => print('Stanza'),
                    icon: Icon(
                      Icons.video_call,
                      color: Colors.purpleAccent,
                    ),
                    label: Text('Stanza')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
