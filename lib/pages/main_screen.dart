import 'package:flutter/material.dart';
import 'package:wish_store/pages/home_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChaged,
        children: <Widget>[
          HomeScreen(),
          HomeScreen(),
          HomeScreen(),
          HomeScreen(),
          HomeScreen(),
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(width: 7,),
            IconButton(
              icon: Icon(
                Icons.home,
                size: 24.0,
              ),
              color: _page == 0
                  ? Colors.white
                  : Theme
                  .of(context)
                  .textTheme.caption.color,
              onPressed: ()=>_pageController.jumpToPage(0),
            ),

            IconButton(
              icon:Icon(
                Icons.label,
                size: 24.0,
              ),
              color: _page == 1
                  ? Colors.white
                  : Theme
                  .of(context)
                  .textTheme.caption.color,
              onPressed: ()=>_pageController.jumpToPage(1),
            ),

            IconButton(
              icon: Icon(
                Icons.add,
                size: 24.0,
                color: Theme.of(context).primaryColor,
              ),
              color: _page == 2
                  ? Colors.white
                  : Theme
                  .of(context)
                  .textTheme.caption.color,
              onPressed: ()=>_pageController.jumpToPage(2),
            ),

            IconButton(
              icon: Icon(
                Icons.notifications,
                size: 24.0,
              ),
              color: _page == 3
                  ? Colors.white
                  : Theme
                  .of(context)
                  .textTheme.caption.color,
              onPressed: ()=>_pageController.jumpToPage(3),
            ),

            IconButton(
              icon: Icon(
                Icons.person,
                size: 24.0,
              ),
              color: _page == 4
                  ? Colors.white
                  : Theme
                  .of(context)
                  .textTheme.caption.color,
              onPressed: ()=>_pageController.jumpToPage(4),
            ),
            SizedBox(width: 7,)
          ],
        ),
        color: Theme.of(context).primaryColor,
        shape: CircularNotchedRectangle(),
      ),

      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 10.0,
        child: Icon(
          Icons.add,
        ),
        onPressed: () => _pageController.jumpToPage(2),
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChaged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
