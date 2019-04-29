import 'package:flutter/material.dart';
import "package:pull_to_refresh/pull_to_refresh.dart";
import 'NewsItem.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'NewsModle.dart';

class Info extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new InfoDate();
  }
}

class InfoDate extends State<Info> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;
  List models = List();
  List feedsData = List();
  RefreshController _refreshController = RefreshController();
  int page = 0;



  void requestData(bool up) async{
    var url = "http://api.diershoubing.com:5000/feed/tag/?tag_type=1&pn=${page}&rn=10&src=android&version=652&signal=Wifi";
    print(url);
    var response = await http.get(url);
   
    Map data =  json.decode(response.body);
     if(page == 0){
       int count = feedsData.length;
       if(count > 0){
        feedsData.removeRange(0, count - 1);
       }
    }
    List feeds = data['feeds'];
    
    for (Map item in feeds) {
      NewsModle modle = NewsModle.fromJson(item);
      feedsData.add(modle);
    }
    setState(() {
      models = feedsData;
    });
    if(up){
       _refreshController.sendBack(up, RefreshStatus.completed);
    }else{
      if(feeds.length >= 10){
         _refreshController.sendBack(up, RefreshStatus.idle);

      }else{
        _refreshController.sendBack(up, RefreshStatus.noMore);
      }
     
    }
   


  }

  void _onRefresh(bool up){
     page = up ? 0 : ++page;
     requestData(up);
  }

void _OnOffsetChange(bool up, double offset){

  }
    
   @override
  void initState() {
    // TODO: implement initState
    requestData(true);
    super.initState();
  }

   @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget divider = Divider(height: 1,color: Colors.grey);
    return Scaffold(
      appBar: AppBar(
        title: Text('咨讯'),
      ),
      body: SmartRefresher(
        controller: _refreshController,
        onRefresh: _onRefresh,
        onOffsetChange: _OnOffsetChange,
        enablePullUp:true,
        enablePullDown: true,
        child: ListView.separated(
          itemCount: models.length,
          itemBuilder: (BuildContext context, int index){
            NewsModle model = models[index];
             return new NewsItem(model);
          },
          separatorBuilder: (BuildContext context, int index){
            return divider;
          },
        ),

      ),
    );
  }
}