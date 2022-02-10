import 'package:flutter/material.dart';
import 'package:next_door/common_ui_widgets/main_side_menu.dart';
import 'package:next_door/common_ui_widgets/nearby_search_field.dart';
import 'package:next_door/common_ui_widgets/topbar_with_icons.dart';
import 'package:next_door/modules/news_feed/widgets/data.dart';
import 'package:next_door/modules/news_feed/widgets/invite_neighbours.dart';
import 'package:next_door/common_ui_widgets/post_feed_widget.dart';
import 'package:next_door/services/helper_services/scroll_configuration.dart';
import 'package:next_door/services/helper_services/side_menu_items.dart';

class NewsFeed extends StatefulWidget {
  const NewsFeed({Key? key}) : super(key: key);

  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
 final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: 1000,
              child: TopBarWithIcons(),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: SizedBox(
                  width: 970,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SideMenu(
                        menuList: CustomSideMenuItems.mainScreenSideMenu,
                      ),
                      Expanded(
                        child: ScrollConfiguration(
                          behavior: MyCustomScrollBehavior(),
                          child: SingleChildScrollView(
                            controller: _controller,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 18.0),
                              child: Column(
                                children: [
                                  const NearBySearchField(currentUserImageUrl: 'assets/images/person.png',),
                                  ...newsFeedPosts.map((e) => PostFeedWidget(newsFeed: e)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const InviteNeighbours(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}








