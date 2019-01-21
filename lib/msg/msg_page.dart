import 'package:flutter/material.dart';
import '../modal//msg_modal.dart' show Msgitem , MsgListData ;
import '../common/base_style.dart'  show AppColors, AppStyles, Constants;

class _MsgItem extends StatelessWidget {

 const _MsgItem({Key key,this.item})
  :assert (item !=null),
  super(key:key);

 final Msgitem item;
 

  @override
  Widget build(BuildContext context) {
    return Container(
           padding: const EdgeInsets.all(10.0),
           decoration: BoxDecoration(
                color: Color(AppColors.ConversationItemBg),
                border: Border(
                  bottom: BorderSide(
                    color: Color(AppColors.DividerColor), 
                    width: Constants.DividerWidth
                  ),
                )
           ),
           child: new  Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                // height:100.0,
                children: <Widget>[
                    CircleAvatar(child: Text(item.avatar),),
                    Container(width: 10.0,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(item.title),
                          Text(item.dec),
                        ],
                      ),
                    ),
                    new Text(item.time)
              ], 
              ),
    );
  }
}


class MsgPage extends StatefulWidget {
  _MsgPageState createState() => _MsgPageState();
}
final  litems = MsgListData().listData;

final TextEditingController _searchController = new TextEditingController(); 

Widget _searchBar(){
    //  return CupertinoField()
    return  Container(
      padding: const EdgeInsets.all(10.0),
      alignment: Alignment.center,
      child: TextField(
       controller: _searchController,
       decoration: new InputDecoration(
         hintText: '搜索',
         contentPadding: EdgeInsets.all(10.0),
         prefixIcon:new Icon(IconData(0xe8b6, fontFamily: 'MaterialIcons'),color: Colors.black38),
        //  icon: new Icon(IconData(0xe8b6, fontFamily: 'MaterialIcons'),color: Colors.black38),
         border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(10),
           borderSide:BorderSide(width: 16.0, color: Colors.red)
         ),
       ),
    ) ,
    );
       

}

class _MsgPageState extends State<MsgPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  child: new Text('msg page'),
      appBar:AppBar(
        title: Text('消息'),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            _searchBar(),
            new Expanded(
              child: new ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  // itemExtent: 100.0, 确定每一个item的高度 会让item加载更加高效
                  itemCount:litems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _MsgItem( item: litems[index]);
                  },
              ),
            ),
          ],
        ),
      ),
    );
  }
}