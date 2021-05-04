import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PostHeader(post: post),
                Text(post.caption),
                post.imageUrl != null
                    ? const SizedBox.shrink()
                    : SizedBox(
                        height: 6.0,
                      )
              ],
            ),
          ),
          post.imageUrl != null
              ? Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: CachedNetworkImage(imageUrl: post.imageUrl))
              : SizedBox.shrink(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: _PostStats(post: post),
          )
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        const SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} • ',
                    style: TextStyle(fontSize: 12.0, color: Colors.grey[600]),
                  ),
                  Icon(
                    Icons.public,
                    size: 12,
                    color: Colors.grey[600],
                  )
                ],
              )
            ],
          ),
        ),
        IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {
              print('More');
            })
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;

  const _PostStats({Key key, this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                  color: Palette.facebookBlue, shape: BoxShape.circle),
              child: Icon(
                Icons.thumb_up,
                size: 10,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 4.0),
            Expanded(
              child: Text(
                '${post.likes}',
                style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
              ),
            ),
            Text(
              '${post.comments} Comments',
              style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
            ),
            SizedBox(width: 8.0),
            Text(
              '${post.shares} Shares',
              style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
            ),
          ],
        ),
        Divider(),
        Row(
          children: [
            _PostButton(
                icon: Icon(
                  MdiIcons.thumbUpOutline,
                  color: Colors.grey[600],
                  size: 20,
                ),
                label: 'Like',
                onTap: () {
                  print('Like');
                }),
            _PostButton(
                icon: Icon(
                  MdiIcons.commentOutline,
                  color: Colors.grey[600],
                  size: 20,
                ),
                label: 'Comments',
                onTap: () {
                  print('Comments');
                }),
            _PostButton(
                icon: Icon(
                  MdiIcons.shareOutline,
                  color: Colors.grey[600],
                  size: 25,
                ),
                label: 'Share',
                onTap: () {
                  print('Share');
                })
          ],
        )
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final String label;
  final Icon icon;
  final Function onTap;

  const _PostButton(
      {Key key,
      @required this.label,
      @required this.icon,
      @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon,
                  SizedBox(
                    width: 4.0,
                  ),
                  Text(label),
                ],
              ),
            )),
      ),
    );
  }
}
