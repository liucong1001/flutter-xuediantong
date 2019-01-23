import 'package:flutter/material.dart';
import '../common/base_style.dart'  show AppColors,  Constants;
import '../modal/task_modal.dart';

class TaskPage extends StatefulWidget {
  _TaskPageState createState() => _TaskPageState();
}


getListData(res){
    List<Task> tasklist = List<Task>();
    for(dynamic data in res){
      Task  taskData = Task.fromJson(data);
      tasklist.add(taskData);
    }
    print(tasklist);
    return tasklist;
} 
    
 final List  listData =  getListData(jsonData['list'])  ;



final items = List<String>.generate(10000, (i) => "Item $i");


class ListItemWidget extends StatelessWidget {

 const ListItemWidget({Key key,this.item})
  :assert (item !=null),
  super(key:key);

 final Task item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 2.0,bottom: 2.0),
      padding: EdgeInsets.only(left: 15.0,top:5.0,bottom: 5.0,right: 15.0),
      color: Colors.white,
      child: new Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
         crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(child: Text( item.courseName.substring(0,1))),
          Expanded(
             child:Padding(
               padding: EdgeInsets.all(8.0),
               child:  new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  Text(item.courseName),
                  Text('截至时间：15点53分'),
                  Text('三年级一班 2019-1-20'),
                ],
              ),)
          ),
          new Column(
              children: <Widget>[
                Text('2/50'),
                Text('未提交'),
              ],
          ),
        ],
      )
      // Text(item.courseName),
    );
  }
}


class _TaskPageState extends State<TaskPage> {
 Widget taskNav(){
      return new Container(
         child: new Row(
           children: <Widget>[
             new Container(
               child: new Text('作业列表'),
             )
           ],
         ),
      );

 }


  @override
  Widget build(BuildContext context) {

    Column buildNavAravtar(IconData icon ,String label){
        return new Column(
           mainAxisSize: MainAxisSize.min,
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             new Container(height: 15.0,),
             CircleAvatar(child: new Icon(icon,color: Colors.white),),
             new Container(
                 margin: const EdgeInsets.only(top: 8.0,bottom: 8.0),
                 child: new Text(
                   label,
                   style: new TextStyle(
                       fontSize: 12.0,
                       fontWeight: FontWeight.w400,
                       color: Color(AppColors.DesTextColor),
                   ),
                 ),
             ),
           ],
        );
    }


    Widget taskNavbar(){ 
      return  Container(
        // decoration: ,
          color: Colors.white,
          child:  new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                  buildNavAravtar(IconData(0xe66e, fontFamily: Constants.IconFontFamily), '排行榜'),
                  buildNavAravtar(IconData(0xe63b, fontFamily: Constants.IconFontFamily), '推荐文章'),
                  buildNavAravtar(Icons.share, '推荐学习'),
              ],
            ),
      );
  }

  Widget taskListTitle(){
      return  Container(
        // height: 20.0,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Container(
                  child: Text('作业列表'), 
                  margin: EdgeInsets.all(8.0),
                  padding: EdgeInsets.only(left: 10.0),
                  decoration: new BoxDecoration(
                        border:  Border(left: BorderSide(color: Color(AppColors.TabIconActive),width: 2.0)) 
                  ),
              ),
             new Container(
                margin: EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    new Text('筛选'),
                    new Icon(IconData(0xe8b6, fontFamily: 'MaterialIcons')),
                  ],
                ),
            ),

            ],
          ),
      );
  }


    return Scaffold(
      appBar: AppBar(
        title: new Text('作业'),
      ),
      
      backgroundColor: Color(AppColors.PageBgColor),
      body: new Column(
        children: <Widget>[
          taskNavbar(),
          taskListTitle(),
          Expanded(
            child:new Container(
            // height: 600.0, 
            // color: Colors.white,
            child: new ListView.builder(
                    itemCount: listData.length, 
                    itemBuilder: (BuildContext context, int index) { 
                      return ListItemWidget(item:listData[index]); 
                    }, 
            ),
            ),
          )          
        ],
      ),
    );
  }
}