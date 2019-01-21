import 'package:flutter/material.dart';

class Msgitem{
  const Msgitem({
    @required this.title,
    this.dec,
    this.time,
    this.avatar,
  });  
   final String title;
   final String dec;
   final String time;
   final String avatar;
}

class MsgListData{
    final List<Msgitem> listData = [
       const Msgitem(
         avatar:'提',
         title: '公告',
         dec: '提醒/公告',
         time:'1天前',
       ),
         const Msgitem(
         avatar:'待',
         title: '审核',
         dec: '待办/审核',
         time:'5小时前',
       ),
         const Msgitem(
         avatar:'公',  
         title: '芳草小学[公告]',
         dec: '暂无公告',
         time: '1天前',
       ),
    ];
}