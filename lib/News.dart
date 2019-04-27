import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'NewsItem.dart';
import 'package:http/http.dart' as http;

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

class NewPageState extends State<NewsPage>{
  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   
    void requestNewsData() async{
    var url = "https://www.poolin.com";
    var response =  await http.get(url);
    print('Response body: ${response.body}');
   }
  requestNewsData();
    Widget divider  = Divider(height: 1, color:Colors.grey);
    return  Scaffold(
      appBar: new AppBar(
        title: new Text('News'),
      ),
      body: new Center(
        child: ListView.separated(
          itemCount: 10,
          itemBuilder:(BuildContext context,int index){
            return new NewsItem();
          },
          separatorBuilder: (BuildContext context, int index){
            return divider;
          },
        ),
      ),
    );
  }
}