import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'News.dart';
import 'Info.dart';

class BottomNavigationWidge extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new BottomNavigationWidgeState();
  }
}

class  BottomNavigationWidgeState extends State<BottomNavigationWidge> with AutomaticKeepAliveClientMixin{
   @override
 bool get wantKeepAlive => true;
    final _bottomNavigationColor = Colors.blue;
    int _currentIndex = 0;
    List<Widget> pages = List<Widget>();

    PageController _pageController = PageController();

    @override
  void initState() {
    // TODO: implement initState
     pages.add(News());
     pages.add(Info());
     super.initState();
  }
    @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // TabController _tabVc = TabController(

    // );
    return Scaffold(
      
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: pages,
        onPageChanged: (index){
          setState(() {
             _currentIndex  =index;
          });
        },
      ),
      
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
            title: Text('咨讯'),
          ),

        ],
        currentIndex: _currentIndex,
        onTap: (int index){
          setState(() {
            _currentIndex = index;
          });
          //  _pageController.animateToPage(index,duration: Duration(seconds: 1),curve: ElasticInOutCurve());
           _pageController.jumpToPage(index);
        },
      ),
    );
  }

}
