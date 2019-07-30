import 'package:flutter/material.dart';
import 'package:wish_store/pages/trending_screen.dart';
import 'package:wish_store/utils/wishlist.dart';
import 'package:wish_store/widgets/slide_item.dart';
import 'package:wish_store/utils/categories.dart';
import 'package:wish_store/utils/friends.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin<HomeScreen> {
  final TextEditingController _searchControl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: PreferredSize(
                child: AppBar(
                    elevation: 0.0,
                    actions: <Widget>[
                      new IconButton(icon: new Icon(Icons.search),
                        onPressed: (){},
                      ),
                    ],
                    automaticallyImplyLeading: false,
                  ),
                  preferredSize: Size(
                      MediaQuery.of(context).size.width, 60.0
                  ),
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Trending Wishes",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800
                  ),
                ),
                FlatButton(
                  child: Text(
                    "See all (43)",
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                          return TrendingScreen();
                        },
                        ),
                    );
                  },
                )
              ],
            ),
            SizedBox(height: 10.0),
            Container(
              height: MediaQuery.of(context).size.height/2.4,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: restaurants == null ? 0 : restaurants.length,
                itemBuilder: (BuildContext context, int index) {
                  Map restaurant = restaurants[index];

                  return Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: SlideItem(
                      img: restaurant["img"],
                      title: restaurant["title"],
                      address: restaurant["address"],
                      rating: restaurant["rating"],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Category",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                FlatButton(
                  child: Text(
                    "See all (9)",
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  onPressed: () {},
                )
              ],
            ),
            SizedBox(height: 10.0),
            Container(
              height: MediaQuery.of(context).size.height/6,
              child: ListView.builder(
                primary: false,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: categories == null ? 0: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  Map cat = categories[index];

                  return Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Stack(
                        children: <Widget>[
                          Image.asset(
                            cat["img"],
                            height: MediaQuery.of(context).size.height/6,
                            width: MediaQuery.of(context).size.width/6,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [0.2,0.7],
                                colors: [
                                  cat['color1'],
                                  cat['color2']
                                ],
                              ),
                            ),
                            height: MediaQuery.of(context).size.height/6,
                            width: MediaQuery.of(context).size.width/6,
                          ),
                          Center(
                            child: Container(
                              height: MediaQuery.of(context).size.height/6,
                              width: MediaQuery.of(context).size.width/6,
                              padding: EdgeInsets.all(1),
                              constraints: BoxConstraints(
                                minWidth: 20,
                                minHeight: 20
                              ),
                              child: Center(
                                child: Text(
                                  cat["name"],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );

                },
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Friends",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800
                  ),
                ),
                FlatButton(
                  child: Text(
                    "See all (59)",
                    style: TextStyle(
                      color: Theme.of(context).accentColor
                    ),
                  ),
                  onPressed: () {},
                )
              ],
            ),
            SizedBox(height: 10.0),
            Container(
              height: 50.0,
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: friends == null ? 0 : friends.length,
                itemBuilder: (BuildContext context, int index) {
                  String img = friends[index];

                  return Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        img
                      ),
                      radius: 25.0,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}