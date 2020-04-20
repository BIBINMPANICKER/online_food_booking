import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:online_food_booking/src/blocs/cart_counter_bloc.dart';
import 'package:online_food_booking/src/blocs/restaurant_bloc.dart';
import 'package:online_food_booking/src/models/restaurant/restaurant_model.dart';
import 'package:online_food_booking/src/ui/widgets/home_listview.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    restaurantBloc.getRestaurantDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: StreamBuilder<RestaurantModel>(
          stream: restaurantBloc.restaurantRes,
          builder: (context, snapshot) {
            return snapshot.hasData
                ? DefaultTabController(
                    length: snapshot.data.tableMenuList.length,
                    child: Scaffold(
                      appBar: AppBar(
                          title: Text(
                            snapshot.data.restaurantName,
                            style: Theme.of(context).textTheme.headline,
                          ),
                          leading: BackButton(
                            color: Colors.black45,
                          ),
                          actions: <Widget>[
                            Row(
                              children: <Widget>[
                                Text('My Orders',
                                    style: Theme.of(context).textTheme.subhead),
                                StreamBuilder<int>(
                                    stream: cartCounterBloc.getCount,
                                    builder: (context, snap) {
                                      print(snap.data.toString());
                                      return Badge(
                                          padding: EdgeInsets.all(3),
                                          badgeContent: Text(
                                            snap.data.toString(),
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          position: BadgePosition.topRight(
                                              right: 8, top: 6),
                                          child: IconButton(
                                              padding: EdgeInsets.all(0),
                                              icon: Icon(
                                                Icons.shopping_cart,
                                                color: Colors.black45,
                                              ),
                                              onPressed: null));
                                    }),
                              ],
                            )
                          ],
                          bottom: TabBar(
                            tabs: tabList(snapshot.data.tableMenuList),
                            isScrollable: true,
                          )),
                      body: TabBarView(
                        children: snapshot.data.tableMenuList
                            .map((tableMenuItem) =>
                                HomeListView(tableMenuItem.categoryDishes))
                            .toList(),
                      ),
                    ))
                : Material(
                    child: Center(
                    child: CircularProgressIndicator(),
                  ));
          }),
    );
  }

  // creating list for tab bar
  List<Tab> tabList(List<TableMenuList> tableMenuList) {
    List<Tab> _tabList = [];
    tableMenuList.forEach((f) {
      _tabList.add(Tab(
        text: '${f.menuCategory}',
      ));
    });
    return _tabList;
  }
}
