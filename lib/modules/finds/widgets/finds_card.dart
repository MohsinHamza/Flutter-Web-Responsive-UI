import 'package:flutter/material.dart';
import 'package:next_door/models/finds_card_model.dart';
import 'package:next_door/style/style.dart';

class FindsCard extends StatefulWidget {
  const FindsCard({Key? key,required this.item}) : super(key: key);
  final FindsCardModel item;
  @override
  _FindsCardState createState() => _FindsCardState();
}

class _FindsCardState extends State<FindsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius:
          const BorderRadius.only(
            topRight:Radius.circular(16),
            topLeft:Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor,
              spreadRadius: 3,
              blurRadius: 3,
              offset: const Offset(2,3),
            )
          ]
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius:
                  const BorderRadius.only(
                    topRight:Radius.circular(16),
                    topLeft:Radius.circular(16),
                  ),
                  image: DecorationImage(
                      image: AssetImage(
                          widget.item.imageUrl),
                      fit: BoxFit.fill)),
              child: Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(
                        12.0),
                    child: const Image(
                      image: AssetImage(
                          'assets/icons/arrow-icon.png'),
                      height: 23,
                      width: 23,
                    ),
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            title: Text(
              widget.item.price,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.h5
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
            subtitle: Text(
              widget.item.title,
              style: TextStyles.h5
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
          ),
          Text(
            widget.item.dateAndLocation,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.h5
                .copyWith(fontSize: 11),
          ),
          const SizedBox(height: 5,),
        ],
      ),
    );
  }
}
