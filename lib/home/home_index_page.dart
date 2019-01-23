import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeIndexPage extends StatefulWidget {
  @override
  _HomeIndexPageState createState() => _HomeIndexPageState();
}

class _HomeIndexPageState extends State<HomeIndexPage> {

List<Widget>imageList = List(); 

  @override
  void initState(){
    imageList..add(
      Image.asset(
         "./assets/imgs/banner1.jpeg",
         fit: BoxFit.fill,
      )
    )
    ..add(
      Image.asset(
         "./assets/imgs/banner2.png",
         fit: BoxFit.fill,
      )
    )
    ..add(
        Image.network(
          'http://118.126.109.236:40001/langyi/userfiles/fileupload/201812/1078569679803191296.jpg',
          fit: BoxFit.fill,
        )
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       color: Colors.white,
       padding: EdgeInsets.all(16.0),
       child: new Column(
         children: <Widget>[    
            _navBar(),
            new Container(
              width: MediaQuery.of(context).size.width,
              height: 200.0,
              child: Swiper(
                itemBuilder: _swiperBuilder,
                itemCount: imageList.length,
                // viewportFraction: 0.8,
                // scale: 0.9,
                pagination: new SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                  color: Colors.black54,
                  activeColor: Colors.white,
                 )),
                // control: new SwiperControl(),
                scrollDirection: Axis.horizontal,
                autoplay: true,
                onTap: (index) => print('点击了第$index个'),
                )
          ),
          _msg(),
          _menuList(),
          new Container(
            margin: EdgeInsets.only(top:20.0,bottom: 20.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('最热资讯',style:TextStyle(fontWeight:FontWeight.bold,fontSize: 20.0)),
                  Text('查看全部',style:TextStyle(color: Colors.grey))
                ],
            ) ,
          ),
         _newsList(),
         ],
       ),
    );
  }


   Widget  _navBar(){
    return new Container(
           padding:EdgeInsets.all(8.0),
           height: 50.0,
           child: Row(
             children: <Widget>[
               Text('芳草小学 ',style:TextStyle(fontWeight:FontWeight.bold,fontSize: 18.0),),
               new Row(
                   children: <Widget>[
                      new Container(
                          child:  Text('2018年1年级8班',style:TextStyle(fontSize: 18.0) ,),
                          padding: EdgeInsets.only(left: 15.0),
                          margin:  EdgeInsets.only(top:5.0,bottom: 5.0,left: 10.0),
                          decoration:  BoxDecoration(
                            border: Border(left: BorderSide(color: Colors.grey,width: 2.0))
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios,color:Colors.grey,)
                   ],  
               ),
             ],
           ),
    );
}

    Widget _swiperBuilder(context,index){
      return (imageList[index]);
    }

    Widget _msg(){
      return  new Container(
          //  padding:EdgeInsets.all(8.0),
          margin: EdgeInsets.all(10.0),
          child: new  Row(
              children: <Widget>[
                Icon(IconData(0xe04e,fontFamily:'MaterialIcons')),
                Expanded(
                  child:  new Container(
                          child: Text('新年快乐 新年快乐!'),
                          padding: EdgeInsets.only(left: 5.0),
                          decoration: BoxDecoration(
                            border: Border(right: BorderSide(color: Colors.grey,width: 2.0))
                          ),
                      ) ,
                ),
                Padding(
                  child:  Text('更多',style: TextStyle(color: Colors.grey),),
                  padding: EdgeInsets.only(left: 5.0),
                )
              ],
        ) ,
      );
    }

    Widget _menuList(){
        return new Container(
            child: new Column(
              children: <Widget>[
                  new Row(
                      children: <Widget>[
                        Expanded(
                          child: meunItem('./assets/imgs/menu1.png','发作业'),
                        ),
                        Expanded(
                          child: meunItem('./assets/imgs/menu2.png','课程表'),
                        ),
                        Expanded(
                          child: meunItem('./assets/imgs/menu2.png','小游戏'),
                        ),
                        Expanded(
                          child: meunItem('./assets/imgs/menu3.png','发公告'),
                        ),

                      ],
                    ),
                    // new Row(
                    //      children: <Widget>[
                    //         Container(
                    //           child: meunItem('./assets/imgs/menu4.png','更多'),
                    //         ),
                    //      ],
                    // )
              ],
            ),
        );
      
    }

    meunItem(image,title){
      return new Container(
        child: new Column(
          children: <Widget>[
              Container(
                padding: EdgeInsets.only(top:10.0,bottom: 10.0),
                child: Image.asset(image,width: 50.0,height: 50.0,),
              ),
              Text(title)
          ],
        ),
      );
    }

    Widget  _newsList(){
        return new Container(
                // height: 400.0,
                child: Column(
                  children: <Widget>[
                    newItem('致家长','牵着蜗牛去散步','扎心美文，分享给焦虑的父母：孩子，是慢慢养大的'),
                    newItem('致老师','老师你好,我是小豚家长','老师与家长沟通的效果如何，直接关系着家校合作是否成功。'),
                  ],
                ),
        );
    }
    newItem(nav,title,content){
      return new Container(
        // color: Colors.red,
        padding: EdgeInsets.all(10.0),
        child: new Row(
            children: <Widget>[
                Expanded(
                    flex: 6,
                  child: Column(
                    //  mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                        new Container(
                            padding: EdgeInsets.only(top:10.0,bottom: 10.0),
                            child:Text('【$nav】 $title',style: TextStyle(fontSize: 16.0), ) ,
                        ),
                        Text(content,style: TextStyle(color: Colors.grey),)
                    ],
                  ),
                ),
                Expanded(
                    flex: 4,
                  child: Image.network('http://118.126.109.236:40001/langyi/userfiles/fileupload/201812/1078606593136005120.jpg',
                      height: 80.0,
                      width: 100.0,
                      fit: BoxFit.fill,
                      ),
                )
            ],
        ),
      );
    }



}