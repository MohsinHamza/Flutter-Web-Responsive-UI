import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:next_door/modules/chat/widgets/conversation_widget.dart';
import 'package:next_door/modules/chat/widgets/data.dart';
import 'package:next_door/services/helper_services/scroll_configuration.dart';
import 'package:next_door/style/style.dart';

class ConversationList extends StatefulWidget {
  const ConversationList({Key? key}) : super(key: key);

  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> with SingleTickerProviderStateMixin{

  late TabController _tabBarController;


  @override
  void initState() {
    _tabBarController = TabController(
        length: 2,
        vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      constraints: const BoxConstraints(
        maxHeight: 690,
      ),
      padding: const EdgeInsets.only(right: 15),
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(width: 2,color: Palette.GREY_LIGHTEST)
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width:340,
                  child: Row(
                    children: [
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: 270,
                        ),
                        child: DefaultTabController(
                          length: 2,
                          child: TabBar(
                            indicatorColor:Colors.teal,
                            labelColor: Colors.teal,
                            unselectedLabelColor: Palette.GREY_LIGHT,
                            indicatorWeight: 5,
                            unselectedLabelStyle: TextStyles.h5.copyWith(
                                fontSize:14),
                            labelStyle: TextStyles.h5.copyWith(
                                color: Colors.blue,
                                fontSize: 14),
                            controller: _tabBarController,
                            tabs: [
                              Tab(
                                child: Text('Inbox',style: TextStyles.h5.copyWith(fontSize: 13),),
                              ),
                              Tab(
                                child: Text('Archive',style: TextStyles.h5.copyWith(fontSize: 13)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text('Compose',style: TextStyles.h5.copyWith(color: Colors.blue,fontSize: 12),),
                    ],
                  ),
                ),

                Expanded(
                  flex: 3,
                  child: SizedBox(
                    width: 270,
                    child: TabBarView(
                      controller: _tabBarController,
                      children: [
                        _loadTabChild(inboxConversation),
                        _loadTabChild(archiveConversation),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _loadTabChild(List<ConversationModel> dataList) => ScrollConfiguration(
    behavior: MyCustomScrollBehavior(),
    child: SingleChildScrollView(
      child: Column(
        children: [
          ...List.generate(dataList.length, (index) {

            ConversationModel item = dataList[index];
            return Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child:ConversationWidget(conversationModel: item,),
            );
          }),
        ],
      ),
    ),
  );
}
