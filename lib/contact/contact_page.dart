import 'package:flutter/material.dart';
import '../modal//contact_modal.dart';
import '../common/base_style.dart'  show AppColors;


class ContactPage extends StatefulWidget {
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {


 Widget contactItem(Contact item){
   return  new Container(
           margin: EdgeInsets.all(8.0),
           padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1.0,color: Color(AppColors.DividerColor)))
          ),
          child: new Row(
            children: <Widget>[
              CircleAvatar(child:Text(item.avatar)),
              Container(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(item.className),
              )
              
            ],
          ),
   );
 }

 getDataList(arryData){
    List<Contact> listData = List<Contact>();
    for(dynamic data in arryData){
      Contact  itemData = Contact.fromJson(data);
      listData.add(itemData);
    }
    return listData;
 }
 
List listData =  List<Contact>();

  @override 
  void  initState(){
        super.initState();
        listData =  getDataList(jsonData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: new Text('通讯录'),
        centerTitle: true,
      ),
      body:new Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 10.0),
        child: ListView.builder(
           itemCount: listData.length,
           itemBuilder: (context,index){
              return contactItem(listData[index]);
           }
        ),
      ), 
    );
  }
}