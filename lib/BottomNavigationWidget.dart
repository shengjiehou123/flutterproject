import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'News.dart';

class BottomNavigationWidge extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new BottomNavigationWidgeState();
  }
}

class  BottomNavigationWidgeState extends State<BottomNavigationWidge>{
    final _bottomNavigationColor = Colors.blue;
    int _currentIndex = 0;
    List<Widget> pages = List<Widget>();

    @override
  void initState() {
    // TODO: implement initState
     pages.add(News());
     pages.add(News());
    //  super.initState();
  }
    @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _bottomNavigationColor,

            ),
            title: Text('News'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _bottomNavigationColor,

            ),
            title: Text('News'),
          ),

        ],
        currentIndex: _currentIndex,
        onTap: (int index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

}
