import 'package:flutter/material.dart';
import 'package:wish_store/utils/wishstore.dart';
import 'package:wish_store/utils/my_navigator.dart';
import 'package:wish_store/widgets/walkthrough.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController controller = new PageController();
  int currentPage = 0;
  bool lastPage = false;

  void _onPageChanged(int page){
    setState(() {
      currentPage = page;
      if (currentPage == 3) {
        lastPage = true;
      } else {
        lastPage = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFEEEEEE),
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(),
            flex: 1,
          ),
          Expanded(
            flex: 3,
            child: PageView(
              children: <Widget>[
                Walkthrough(
                  title: Wishstore.wt1,
                  content: Wishstore.wc1,
                  imageIcon: Icons.mobile_screen_share,
                ),
                Walkthrough(
                  title: Wishstore.wt2,
                  content: Wishstore.wc2,
                  imageIcon: Icons.search,
                ),
                Walkthrough(
                  title: Wishstore.wt3,
                  content: Wishstore.wc3,
                  imageIcon: Icons.shopping_cart,
                ),
                Walkthrough(
                  title: Wishstore.wt4,
                  content: Wishstore.wc4,
                  imageIcon: Icons.verified_user,
                )
              ],
              controller: controller,
              onPageChanged: _onPageChanged,
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                    onPressed: () =>
                      lastPage ? null : MyNavigator.goToHome(context),
                    child: Text(
                      lastPage ? "" : Wishstore.skip,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0
                      ),
                    )
                ),
                FlatButton(
                  child: Text(lastPage ? Wishstore.gotIt : Wishstore.next,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                  onPressed: () => lastPage
                      ? MyNavigator.goToHome(context)
                      : controller.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
