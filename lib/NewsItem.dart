import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class NewsItem extends StatelessWidget{
  NewsItem();
  @override
  Widget build(BuildContext context) {
    return new NewItemContainer();
  }
}

class NewItemContainer extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new NewItemContainerState();
  }
}

class NewItemContainerState extends State<NewItemContainer>{
       @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget divider = Divider(height: 1,color: Colors.grey);
    // var listImages = [];
    // for(int i = 0; i < 3; i++){
    //   var imag = Image(
    //     image: AssetImage("Images/bitmap.png"),
    //   );
    //   listImages.add(imag);
    // }
    // final staticListImages =  listImages;
    return Column(
      children: <Widget>[
        Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(10,10,10,10),
                  child: Image(
                  image: AssetImage("Images/bitmap.png"),
                  color: Colors.blue,
                  width: 40,
                  height: 40,
                 ),
                ),
               
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('银河战士',
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
              child: Text('padding的类型为EdgeInsetsGeometry，EdgeInsetsGeometry是EdgeInsets以及EdgeInsetsDirectional的基类。在实际使用中不涉及到国际化，例如适配阿拉伯地区等，一般都是使用EdgeInsets。EdgeInsetsDirectional光看命名就知道跟方向相关，因此它的四个边距不限定上下左右，而是根据方向来定作者：吹个大气球商业转载请联系作者获得授权，非商业转载请注明出处'),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image(
                   image: AssetImage("Images/bitmap.png"),
                  ),
                   Image(
                   image: AssetImage("Images/bitmap.png"),
                  ),
                   Image(
                   image: AssetImage("Images/bitmap.png"),
                  ),
                ],
              ),
            )
      ],
    );
  }
}

