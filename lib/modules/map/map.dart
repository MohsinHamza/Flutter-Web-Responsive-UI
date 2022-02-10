import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:next_door/common_ui_widgets/buttons.dart';
import 'package:next_door/common_ui_widgets/topbar_with_icons.dart';
import 'package:next_door/modules/news_feed/widgets/data.dart';
import 'package:next_door/common_ui_widgets/post_feed_widget.dart';
import 'package:next_door/services/helper_services/scroll_configuration.dart';
import 'package:next_door/style/style.dart';

class AddUserOnMap extends StatefulWidget {
  const AddUserOnMap({Key? key}) : super(key: key);

  @override
  _AddUserOnMapState createState() => _AddUserOnMapState();
}

class _AddUserOnMapState extends State<AddUserOnMap> {
final ScrollController _scrollController = ScrollController();
bool _isExpanded = false;

  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(34.791896, 72.394791),
    zoom: 14.4746,
  );

  // static const CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(51.637655, -0.472840),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Theme.of(context).cardColor,
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
              child: Row(
                children: [
                  Visibility(
                    visible:!_isExpanded,
                    child: SizedBox(
                      width: 650,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: ScrollConfiguration(
                          behavior: MyCustomScrollBehavior(),
                          child: SingleChildScrollView(
                            controller: _scrollController,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Ruislip',
                                        style: TextStyles.h3
                                            .copyWith(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,fontSize: 23,fontStyle: FontStyle.italic),
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        'London, England',
                                        style: TextStyles.h5.copyWith(
                                            fontWeight: FontWeight.w400, fontSize: 13,color: Theme.of(context).primaryColor),
                                      ),
                                      const SizedBox(height: 4,),
                                      Row(
                                        children:  [
                                          const CircleAvatar(radius: 9,child: Icon(Icons.person,color: Colors.white,size: 13,),backgroundColor: Colors.teal,),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 4.0),
                                            child: Text(
                                              '13,425 Neighbours',
                                              style: TextStyles.h5.copyWith(
                                                  fontWeight: FontWeight.w400, fontSize: 10,color: Theme.of(context).primaryColor),
                                            ),
                                          ),
                                          const Spacer(),
                                          const CircleAvatar(radius: 9,child: Icon(Icons.post_add,color: Colors.white,size: 13,),backgroundColor: Palette.ORANGE,),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 4.0),
                                            child: Text(
                                              '10 posts a week',
                                              style: TextStyles.h5.copyWith(
                                                  fontWeight: FontWeight.w400, fontSize: 10,color: Theme.of(context).primaryColor),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4,),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                    ...newsFeedPosts.map((e) => PostFeedWidget(newsFeed: e)),
                                  ],),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        GoogleMap(
                          mapType: MapType.hybrid,
                          initialCameraPosition: _kGooglePlex,
                          onMapCreated: (GoogleMapController controller) {
                            _controller.complete(controller);
                          },
                        ),
                        Positioned(
                          top: 10,
                          left: 8,
                          child: Buttons.customPrimaryButton(
                              onPressed: () {
                                setState(() {
                                  _isExpanded = !_isExpanded;
                                });
                              },
                              title:!_isExpanded?'Expand':'Show List',
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              textColor: Colors.black,
                              borderColor: Colors.black,
                              buttonColor: Colors.white,
                              buttonWidth: _isExpanded?80:120,
                              buttonHeight: 35),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
}
