import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'NewsModle.dart';

class NewsItem extends StatelessWidget{
  NewsItem(this.model);
  NewsModle model;
  @override
  Widget build(BuildContext context) {
    return new NewItemContainer(model);
  }
}

class NewItemContainer extends StatefulWidget{
  NewItemContainer(this.model);
  NewsModle model;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new NewItemContainerState(model);
  }
}

class NewItemContainerState extends State<NewItemContainer>{
       @override
        NewItemContainerState(this.model);
        NewsModle model;

  Widget build(BuildContext context) {
    // TODO: implement build
    Widget divider = Divider(height: 1,color: Colors.grey);

    String acontent = model.acontent;
    bool notUrl = !acontent.contains('.jpg');
    List  imageurlList =  acontent.split(',');

    List <Widget>images = List();
    int count =  notUrl ? 0 : imageurlList.length;
    if(count > 3){
      count = 3;
    }
    for (var i = 0; i < count; i++) {
          var con = Container(
            margin: EdgeInsets.fromLTRB(i == 0 ? 0 : 10, 0, 0, 0),
            child: Image(
                   image: imageurlList != null ? NetworkImage(imageurlList[i]) : AssetImage("Images/bitmap.png"),
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                  ),
          );
          images.add(con);
    }

    return Column(
      children: <Widget>[
        Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(10,10,10,10),
                  child: Image(
                  image: ((model.game_info['game_icon'] != null) ? NetworkImage(model.game_info['game_icon']) : AssetImage("Images/bitmap.png")),
                  width: 40,
                  height: 40,
                 ),
                ),
               
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(model.game_info['game_name'],
                    style: TextStyle(
                      fontSize: 15
                    ),),
                    Text('1小时前',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey
                    ),),
                  ],
                )
              ],
            ),
            Container(
              child: divider,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(model.content,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black
              ),),
            ),

           Container(
              margin: notUrl ? EdgeInsets.fromLTRB(0, 0, 0, 0) : EdgeInsets.fromLTRB(10, 0, 20, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: images,
              ),
            ),
      ],
    );
  }
}

