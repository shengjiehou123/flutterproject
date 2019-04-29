import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'NewsItem.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'NewsModle.dart';
import "package:pull_to_refresh/pull_to_refresh.dart";


class News extends StatelessWidget{
  @override


 
  Widget build(BuildContext context) {
    // TODO: implement build
     return MaterialApp(
       home: new NewsPage(),
     );
  }
}

class NewsPage extends StatefulWidget{ 


 @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return   new NewPageState();
  }
}

class NewPageState extends State<NewsPage> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;
  List models = List();
  List dataList = List();
  RefreshController _refreshController = new RefreshController();
  ScrollController _scrollController = ScrollController();

   

  int page = 0;
  

 void requestNewsData(bool up) async{
    var url = "http://api.diershoubing.com:5000/feed/tag/?tag_type=0&pn=${page}&rn=10&src=android&version=652&signal=Wifi";
    print(url);
    var response =  await http.get(url);
    Map data = json.decode(response.body);
    if(page == 0){
       int count = dataList.length;
       if(count > 0){
        dataList.removeRange(0, count - 1);
       }
    }
    List feeds = data['feeds'];

    
    for (Map item in feeds) {
      NewsModle modle = NewsModle.fromJson(item);
      dataList.add(modle);
    }
    
    setState(() {
      models =  dataList;
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
     if(up){
  		   //headerIndicator callback
         page = 0;
         requestNewsData(up);

  		  //  new Future.delayed(const Duration(milliseconds: 2009))
        //                                     .then((val) {
        //            /*    注意:假如headerConfig的autoLoad开启了,就不得不等到下一针被重绘时才更新状态,不然会出现多次刷新的情况
        //                   SchedulerBinding.instance.addPostFrameCallback(
        //                       (_){
        //                       _refreshController.sendBack(true, RefreshStatus.completed);

        //                       }
        //                   );
        //           */
        //          _refreshController.sendBack(true, RefreshStatus.completed);
        //    });


  		  //  new Future.delayed(const Duration(milliseconds: 2009))
        //                          .then((val) {
        //                            _refreshController.sendBack(true, RefreshStatus.completed);
        //                      });

  		}
  		else{
  			//footerIndicator Callback
        page++;
        requestNewsData(up);
  		}

  }
 
  @override
  void initState() {
    // TODO: implement initState
    requestNewsData(true);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  void _OnOffsetChange(bool up, double offset){

  };
    
  
    Widget divider  = Divider(height: 1, color:Colors.grey);

    void tapBack(){


     _scrollController.animateTo(.0,duration:Duration(milliseconds:200),curve: Curves.ease);

    }

    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
        actions: <Widget>[Button("滚动到顶部", null, tapBack)],
      ),
      body: SmartRefresher(
      controller: _refreshController,
      enablePullDown: true,
      enablePullUp: true,
      onRefresh: _onRefresh,
      onOffsetChange: _OnOffsetChange,
      child: ListView.separated(
          itemCount: models.length,
          itemBuilder:(BuildContext context,int index){
            NewsModle model = models[index];
            return new NewsItem(model);
          },
          controller: _scrollController,
          separatorBuilder: (BuildContext context, int index){
            return divider;
          },
        ), 


    ),
    );
  }

  
}

class Button extends StatefulWidget{
   Button(this.title,this.image,this.tapBack);
    String title;
    Image  image;
    Function  tapBack;

    @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ButtonState();
  }

}

class ButtonState extends State<Button>{

  @override
  void initState() {
    // TODO: implement initState
    
  }

 @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
       child: Container(
         child: Text(widget.title),
         padding: EdgeInsets.fromLTRB(0, 20, 10, 0),
       ),
       onTap: (){
         setState(() {
            widget.tapBack();
         });
       },
    );
  }


}