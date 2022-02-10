import 'dart:math';
import 'package:flutter/material.dart';
import 'package:next_door/common_ui_widgets/buttons.dart';
import 'package:next_door/common_ui_widgets/topbar_with_icons.dart';
import 'package:next_door/modules/notification/widgets/post_types.dart';
import 'package:next_door/services/helper_services/scroll_configuration.dart';
import 'package:next_door/style/style.dart';


class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: 960,
                  child: TopBarWithIcons(),
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: 680,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Text(
                          'Notifications',
                          style: TextStyles.h2.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Expanded(
                        child: ScrollConfiguration(
                          behavior: MyCustomScrollBehavior(),
                          child: SingleChildScrollView(
                            controller: _controller,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(context).shadowColor,
                                    offset: const Offset(2, 3),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  ...List.generate(notifications.length,
                                      (index) {
                                    NotificationModel notification =
                                        notifications[index];

                                    return CustomNotificationWidget(
                                      notification: notification,
                                    );
                                  })
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}

generateRandomCode(int i, int j) {}

class CustomNotificationWidget extends StatefulWidget {
  const CustomNotificationWidget({
    Key? key,
    required this.notification,
  }) : super(key: key);
  final NotificationModel notification;
  @override
  State<CustomNotificationWidget> createState() =>
      _CustomNotificationWidgetState();
}

class _CustomNotificationWidgetState extends State<CustomNotificationWidget> {
  late Color firstColor;
  late Color secondColor;

  late Color thirdColor;
  late Color fourthColor;

  final List<Color> _colors = [
    const Color(0xffffffff),
    const Color(0xFF095F70),
    const Color(0xff9ef700),
    const Color(0xff6D5AE6),
    const Color(0xffCD504E),
    const Color(0xff448F56),
    const Color(0xffFF0000),
  ];

  @override
  void initState() {
    firstColor = _colors[Random().nextInt(_colors.length)];
    secondColor = _colors[Random().nextInt(_colors.length)];
    thirdColor = _colors[Random().nextInt(_colors.length)];
    fourthColor = _colors[Random().nextInt(_colors.length)];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Stack(
            children: [
              widget.notification.users.length <= 1
                  ? Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [firstColor, secondColor],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                      ),
                      child: Center(
                        child: Text(
                          widget.notification.users.first[0].toUpperCase(),
                          style: TextStyles.h2.copyWith(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  : Stack(
                      children: [
                        Container(
                          height: 39,
                          width: 39,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                                colors: [firstColor, secondColor],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                          ),
                          child: Center(
                            child: Text(
                              widget.notification.users.first[0],
                              style: TextStyles.h2.copyWith(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 20, top: 8),
                          height: 39,
                          width: 34,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                                colors: [thirdColor, fourthColor],
                                begin: Alignment.bottomRight,
                                end: Alignment.topLeft),
                          ),
                          child: Center(
                            child: Text(
                              widget.notification.users.last[0],
                              style: TextStyles.h2.copyWith(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      text: TextSpan(
                    text: widget.notification.users.length == 1
                        ? widget.notification.users.first
                        : "${widget.notification.users.first} and ${widget.notification.users.length - 1} others",
                    style: TextStyles.h7
                        .copyWith(fontSize: 13, fontWeight: FontWeight.w700,color: Theme.of(context).primaryColor),
                        children: [
                          TextSpan(text: '  ${widget.notification.text}  ',
                            style: TextStyles.h6.copyWith(fontSize: 12,color: Theme.of(context).primaryColor,fontWeight: FontWeight.normal),),
                          TextSpan(text: widget.notification.post??'',
                            style: TextStyles.h6.copyWith(fontSize: 13,color: Theme.of(context).primaryColor,fontWeight: FontWeight.w700),),
                          TextSpan(text: '  ${widget.notification.timeStamp} ',
                            style: TextStyles.h6.copyWith(fontSize: 10,color: Palette.GREY_LIGHT,fontWeight: FontWeight.normal),),
                        ]
                  )),
                ),
                Visibility(
                  visible: widget.notification.isAConnection,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Buttons.customPrimaryButton(
                        onPressed: () {},
                        title: 'Message',
                        fontWeight: FontWeight.w600,
                        buttonColor: Palette.ORANGE,
                        buttonHeight: 32,
                        buttonWidth: 80,
                        fontSize: 12,
                        textColor: Colors.deepOrange),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
