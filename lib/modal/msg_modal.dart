import 'package:flutter/material.dart';

class Msgitem{
  const Msgitem({
    @required this.title,
    this.dec,
    this.time,
    this.avatar,
    this.bgColor,
  });  
   final String title;
   final String dec;
   final String time;
   final String avatar;
   final num bgColor;
}

class MsgListData{
    final List<Msgitem> listData = [
       const Msgitem(
         avatar:'提',
         title: '公告',
         dec: '提醒/公告',
         time:'1天前',
         bgColor:0xffEC5463,
       ),
         const Msgitem(
         avatar:'待',
         title: '审核',
         dec: '待办/审核',
         time:'5小时前',
         bgColor:0xffEC5463,
       ),
         const Msgitem(
         avatar:'公',  
         title: '芳草小学[公告]',
         dec: '暂无公告',
         time: '1天前',
         bgColor:0xff32B16C,
       ),
    ];
}