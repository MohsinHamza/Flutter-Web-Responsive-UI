import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:next_door/common_ui_widgets/react_button.dart';
import 'package:next_door/common_ui_widgets/text_fields.dart';
import 'package:next_door/models/news_feed_widget_model.dart';
import 'package:next_door/style/style.dart';

class PostFeedWidget extends StatefulWidget {
  const PostFeedWidget({Key? key, required this.newsFeed}) : super(key: key);
  final NewsFeedWidgetModel newsFeed;
  @override
  State<PostFeedWidget> createState() => _PostFeedWidgetState();
}

class _PostFeedWidgetState extends State<PostFeedWidget> {
  final TextEditingController _controller = TextEditingController();
  late Color firstColor;
  late Color secondColor;
  @override
  void dispose() {
    firstColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    secondColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow:  [
          BoxShadow(
              offset: const Offset(1, 2),
              blurRadius: 1,
              spreadRadius: 2,
              color: Theme.of(context).shadowColor),
        ],
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: widget.newsFeed.user.imageUrl != null
                ? CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(widget.newsFeed.user.imageUrl!),
                  )
                : Container(
                    height: 36,
                    width: 36,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        widget.newsFeed.user.name[0],
                        style: TextStyles.h2.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
            title: Row(
              children: [
                Text(
                  widget.newsFeed.user.name,
                  style: TextStyles.h5.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
                const SizedBox(
                  width: 3,
                ),
                Visibility(
                    visible: widget.newsFeed.user.isVerified,
                    child: const Image(
                      image: AssetImage('assets/icons/user-verified.png'),
                      height: 20,
                      width: 20,
                    )),
              ],
            ),
            subtitle: Text(
              '${widget.newsFeed.user.address} - ${widget.newsFeed.postedAt}',
              style: TextStyles.h5
                  .copyWith(fontWeight: FontWeight.w400, fontSize: 10),
            ),
            trailing: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                child: Icon(
                  Icons.more_horiz,
                  size: 25,
                  color: Theme.of(context).primaryColor,
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.newsFeed.postMediaType == PostMediaType.imageContent
                    ? Image(
                        image: AssetImage(widget.newsFeed.imageUrl!),
                        height: 240,
                        fit: BoxFit.fill,
                        width: double.infinity,
                      )
                    : Text(
                        widget.newsFeed.postTextContent!,
                        maxLines: 5,
                        style: TextStyles.h5.copyWith(color: Theme.of(context).primaryColor),
                      ),
                Text(
                  widget.newsFeed.postDescription,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.h5.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Theme.of(context).primaryColor),
                ),
                RichText(
                  text: TextSpan(
                      text: 'Posted in ',
                      style: TextStyles.h5.copyWith(
                        fontWeight: FontWeight.w300,
                        fontSize: 11,
                      ),
                      children: [
                        TextSpan(
                            text: widget.newsFeed.postVisibility,
                            style: TextStyles.h5.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 11,
                                color: Theme.of(context).primaryColor))
                      ]),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Visibility(
                          visible: widget.newsFeed.reacts != null,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: Stack(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(top: 2.0),
                                  child: Image(image: AssetImage('assets/icons/haha.png'),height: 20,width: 17,),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 13.0),
                                  child: Icon(
                                    Icons.favorite,
                                    size: 22,
                                    color: Colors.red,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 24.0),
                                  child: Image(image: AssetImage('assets/icons/wow.png'),height: 25,width: 25,),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          widget.newsFeed.reacts ?? 'Be the first to react',
                          style: TextStyles.h7.copyWith(fontSize: 10,color: Theme.of(context).primaryColor),
                        ),
                      ],
                    ),
                    const Spacer(),
                    ReactButton(
                      iconName: 'fav-heart-icon',
                      buttonName: 'Like',
                      onPressed: () {},
                      noOfCount: widget.newsFeed.reacts != null
                          ? int.parse(widget.newsFeed.reacts!)
                          : null,
                    ),
                    ReactButton(
                      iconName: 'chat-icon',
                      buttonName: 'Comments',
                      onPressed: () {},
                      noOfCount: widget.newsFeed.comments != null
                          ? widget.newsFeed.comments!.length
                          : null,
                    ),
                    ReactButton(
                      iconName: 'arrow-icon',
                      buttonName: 'Share',
                      onPressed: () {},
                      noOfCount: widget.newsFeed.shares,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Divider(
                  height: 4,
                  color: Colors.grey[300],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: InkWell(
                    onTap: (){},
                    child: Text('See ${widget.newsFeed.comments!.length} more previous comments',
                        style: TextStyles.h5.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 11, color: Colors.teal)),
                  ),
                ),
                CommentContainer(
                  comment: widget.newsFeed.comments!.last,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    widget.newsFeed.user.imageUrl != null
                        ? CircleAvatar(
                            radius: 18,
                            backgroundImage:
                                AssetImage(widget.newsFeed.user.imageUrl!),
                          )
                        : Container(
                            height: 32,
                            width: 32,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                widget.newsFeed.user.name[0],
                                style: TextStyles.h2.copyWith(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: CustomTextField(
                          onchange: (val) {},
                          controller: _controller,
                          hintText: "Add a comment",
                          onTap: () {}),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CommentContainer extends StatelessWidget {
  const CommentContainer({Key? key, required this.comment}) : super(key: key);
  final Comment comment;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          comment.user.imageUrl != null
              ? CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(comment.user.imageUrl!),
          )
              : Container(
            height: 36,
            width: 36,
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                comment.user.name[0],
                style: TextStyles.h2.copyWith(color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      comment.user.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.h5.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Visibility(
                        visible: comment.user.isVerified,
                        child: const Image(
                          image: AssetImage('assets/icons/user-verified.png'),
                          height: 20,
                          width: 20,
                        )),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      comment.user.address,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.h5
                          .copyWith(fontWeight: FontWeight.w400, fontSize: 10),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: (){},
                      child: Icon(
                        Icons.more_horiz,
                        size: 25,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        comment.comment,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.h7.copyWith(fontSize: 11,color: Theme.of(context).primaryColor),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      SizedBox(
                        width: 220,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              comment.postedAt,
                              style: TextStyles.h5.copyWith(
                                  fontWeight: FontWeight.w400, fontSize: 10),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  CustomTextButton(onPressed: () {}, title: 'Like'),
                                  CustomTextButton(onPressed: () {}, title: 'Reply'),
                                  CustomTextButton(onPressed: () {}, title: 'Share'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Visibility(
                        visible: comment.replies != null,
                        child: Row(
                          children: [
                            const Image(
                              image: AssetImage('assets/icons/reply-arrow.png'),
                              height: 13,
                              width: 15,
                              color: Colors.teal,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              '${comment.replies} replies',
                              style: TextStyles.h5.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11,
                                  color: Colors.teal),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {Key? key, required this.onPressed, required this.title})
      : super(key: key);
  final String title;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Text(title,
          style: TextStyles.h5.copyWith(
              fontWeight: FontWeight.w600, fontSize: 11, color: Colors.teal)),
    );
  }
}
