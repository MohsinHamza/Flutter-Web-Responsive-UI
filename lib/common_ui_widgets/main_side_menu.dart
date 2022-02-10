import 'package:flutter/material.dart';
import 'package:next_door/models/side_menu_item_model.dart';
import 'package:next_door/services/helper_services/scroll_configuration.dart';
import 'package:next_door/style/style.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key, required this.menuList}) : super(key: key);
  final List<dynamic> menuList;
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      width: 180,
      height: 610,
      child: ScrollConfiguration(
        behavior: MyCustomScrollBehavior(),
        child: Scrollbar(
          controller: _controller,
          child: SingleChildScrollView(
            controller: _controller,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...widget.menuList.map((e) {
                  if (e.runtimeType == SideMenuItemModel) {
                    SideMenuItemModel item = e;
                    return InkWell(
                      onTap: () {
                        if (item.linkedPageOrWidget != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => item.linkedPageOrWidget!));
                        }
                        for (var element in widget.menuList) {
                          if (element != e &&
                              element.runtimeType == SideMenuItemModel) {
                            element.isSelected = false;
                          } else if (element.runtimeType == SideMenuItemModel) {
                            setState(() {
                              e.isSelected = true;
                            });
                          }
                        }
                      },
                      child: Container(
                        margin:
                            const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                        padding:
                            const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                        decoration: BoxDecoration(
                          borderRadius: item.isSelected
                              ? const BorderRadius.all(Radius.circular(20))
                              : null,
                          color:
                              item.isSelected ? Palette.ORANGE : Colors.transparent,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0, right: 8),
                              child: Image(
                                image: AssetImage(item.imageName),
                                height: 17,
                                width: 17,
                                color: item.isSelected
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context).iconTheme.color,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                item.title,
                                style: TextStyles.h7.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: e,
                    );
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
