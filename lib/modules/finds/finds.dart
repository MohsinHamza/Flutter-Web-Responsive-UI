import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:next_door/common_ui_widgets/buttons.dart';
import 'package:next_door/common_ui_widgets/text_fields.dart';
import 'package:next_door/common_ui_widgets/topbar_with_icons.dart';
import 'package:next_door/models/finds_card_model.dart';
import 'package:next_door/modules/finds/widgets/data.dart';
import 'package:next_door/modules/finds/widgets/filter_menu.dart';
import 'package:next_door/modules/finds/widgets/finds_card.dart';
import 'package:next_door/modules/settings/grey_button.dart';
import 'package:next_door/services/helper_services/scroll_configuration.dart';
import 'package:next_door/style/style.dart';

class Finds extends StatefulWidget {
  const Finds({Key? key}) : super(key: key);

  @override
  _FindsState createState() => _FindsState();
}

class _FindsState extends State<Finds> {
  final TextEditingController _findsController = TextEditingController();

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
              width: 960,
              child: TopBarWithIcons(),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 900,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FilterMenu(),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Finds',
                                  style: TextStyles.h2.copyWith(color: Theme.of(context).primaryColor),
                                ),
                                const Spacer(),
                                Buttons.customButtonWithLeadingIcon(
                                  title: 'Post a listing',
                                  buttonWidth: 100,
                                  buttonHeight: 25,
                                  textColor: Colors.deepOrange,
                                  onPressed: () {},
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFields.withoutController(
                                      hint: 'Search Finds',
                                      controller: _findsController),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                greyButtonWithIcon(Icons.sort, 'Sort', () {}),
                              ],
                            ),
                            Expanded(
                                child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 17,
                                    crossAxisSpacing: 17,
                                  ),
                                  itemCount: findsItems.length,
                                  itemBuilder: (context, index) {
                                    FindsCardModel item = findsItems[index];
                                    return FindsCard(item: item,);
                                  }),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
