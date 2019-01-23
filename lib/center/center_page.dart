import 'package:flutter/material.dart';
import '../common/base_style.dart'  show AppColors, Constants;

class CenterPage extends StatefulWidget {
  _CenterPageState createState() => _CenterPageState();
}

List<Widget>systemList = List(); 


class _CenterPageState extends State<CenterPage> {
  
  tags (text){
       return  new Container(
         margin: EdgeInsets.only(left: 5.0 ,right: 5.0),
         child:new Chip(
          //  padding: EdgeInsets.all(2.0),
          //  labelPadding:  EdgeInsets.only(top: 2.0,bottom: 2.0),
           key: ValueKey<String>(text), 
          //  backgroundColor: Colors.blue,
           label: Text(text,style: TextStyle(color: Colors.blue[80]),),
          )
       );
   }


    Widget item(icon,text){
        return  new Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 1.0,color: Color(AppColors.DividerColor)))
                ),
                child: ListTile(
                    leading:new Icon(icon),
                    title: new Text(text),
                    trailing: new Icon(Icons.keyboard_arrow_right),
                ),
              );
    }


  Widget _centerItems(){
       // 添加分割线
     return  Expanded(
       child:new ListView(
             children: <Widget>[
                item(IconData(0xe809, fontFamily: Constants.IconFontFamily),'关于我们'),
                item(IconData(0xe72f, fontFamily: Constants.IconFontFamily),'系统设置'),
                item(IconData(0xe600, fontFamily: Constants.IconFontFamily),'修改密码'),
                item(IconData(0xe674, fontFamily: Constants.IconFontFamily,),'检测版本'), 
           ],
       ) ,
     );
  }
  @override
  void initState(){
        super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5.0),
        margin: EdgeInsets.only(top:15.0),
        child: new Column(
           children: <Widget>[
              Padding(
                 padding: EdgeInsets.only(right: 20.0),
                 child: new Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: <Widget>[
                    Icon(IconData(0xe8b8,fontFamily:'MaterialIcons'))
                  ],
               ),
              ),
              Container(
                decoration: BoxDecoration(
                  // border: Border(bottom: BorderSide(width:2.0,color: Colors.grey))
                ),
                child: new Row(
                   children: <Widget>[
                       new Container(
                         margin: EdgeInsets.only(left:15.0,right: 15.0),
                         child: ClipOval(
                           child: SizedBox(
                               height: 80.0,
                               width: 80.0,
                               child: Image(
                                 image: AssetImage('assets/imgs/user.jpg'),
                                 fit: BoxFit.cover,
                               ),
                           ),
                         )
                       ),
                       Padding(
                         padding: EdgeInsets.all(5.0),
                         child: Text('luke',style: TextStyle(fontWeight:FontWeight.w700),),
                       ),
                       tags('班主任'),
                       tags('教师'),
                   ],
                ),
              ),
            
              _centerItems(),
           ],
        ),
    );
  }
}