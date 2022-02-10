import 'package:flutter/material.dart';
import 'package:next_door/models/category_item_filter_model.dart';
import 'package:next_door/modules/finds/widgets/data.dart';
import 'package:next_door/services/helper_services/scroll_configuration.dart';
import 'package:next_door/style/style.dart';

class FindCategories extends StatefulWidget {
  const FindCategories({Key? key}) : super(key: key);

  @override
  _FindCategoriesState createState() => _FindCategoriesState();
}

class _FindCategoriesState extends State<FindCategories> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyCustomScrollBehavior(),
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            ...categories.map((e) {
              return InkWell(
                onTap: (){
                  for (var element in categories) {
                    if(element != e&& element.runtimeType == CategoryItemFilterModel){
                      element.isSelected = false;
                    }else if(element.runtimeType == CategoryItemFilterModel){
                      setState(() {
                        e.isSelected = true;
                      });
                    }
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    children: [
                      Visibility(
                          visible: e.isSelected,
                          child: const Icon(
                            Icons.done,
                            color: Palette.ORANGE,
                            size: 19,
                          )),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                          e.title,
                          overflow:TextOverflow.ellipsis,
                          style: TextStyles.h5.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
