import 'package:flutter/material.dart';
import 'package:next_door/models/side_menu_item_model.dart';
import 'package:next_door/modules/finds/widgets/data.dart';
import 'package:next_door/style/style.dart';

class FilterMenu extends StatefulWidget {
  const FilterMenu({Key? key}) : super(key: key);

  @override
  _FilterMenuState createState() => _FilterMenuState();
}

class _FilterMenuState extends State<FilterMenu> {


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      width: 180,
      height: 610,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...FilterMenuList.filterSideMenu
              .map((e) {
                if(FilterMenuList.filterSideMenu.last == e){
                  return Expanded(child: e,);
                }
            else if (e.runtimeType == SideMenuItemModel) {
              SideMenuItemModel item = e;
              return InkWell(
                onTap: (){
                  for (var element in FilterMenuList.filterSideMenu) {
                    if(element != e&& element.runtimeType == SideMenuItemModel){
                      element.isSelected = false;
                    }else if(element.runtimeType == SideMenuItemModel){
                      setState(() {
                        e.isSelected = true;
                      });
                    }
                  }
                  if(item.linkedPageOrWidget != null){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>item.linkedPageOrWidget!));
                  }
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 6,horizontal: 4),
                  padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 4),
                  decoration: BoxDecoration(
                    borderRadius: item.isSelected
                        ? const BorderRadius.all(
                        Radius.circular(20))
                        : null,
                    color: item.isSelected
                        ? Palette.ORANGE
                        : Colors.transparent,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0,right: 8),
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
                              color:Theme.of(context).primaryColor),
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
    );
  }
}
