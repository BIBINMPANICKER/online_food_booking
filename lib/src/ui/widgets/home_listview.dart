import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_food_booking/src/models/restaurant/restaurant_model.dart';
import 'package:online_food_booking/src/ui/widgets/update_cart.dart';
import 'package:online_food_booking/src/utils/utils.dart';

class HomeListView extends StatefulWidget {
  final List<CategoryDish> categoryDishes;

  HomeListView(this.categoryDishes);

  @override
  _HomeListViewState createState() => _HomeListViewState(categoryDishes);
}

class _HomeListViewState extends State<HomeListView>
    with AutomaticKeepAliveClientMixin {
  final List<CategoryDish> categoryDishes;

  @override
  bool get wantKeepAlive => true; //stops rebuilding tabs on every tab change

  _HomeListViewState(this.categoryDishes);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.only(top: 10),
        separatorBuilder: (context, index) => Divider(
              color: Colors.black45,
            ),
        itemCount: categoryDishes.length,
        itemBuilder: (context, index) => listItem(categoryDishes[index]));
  }

  Widget listItem(CategoryDish item) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 6, left: 8),
          child: Image.asset(
            'assets/icons/veg.png',
            scale: 100,
            // green color for veg and red for non veg dishes
            color: item.dishType == 1 ? Colors.red : Colors.green,
          ),
        ),
        Expanded(
          child: ListTile(
            contentPadding: EdgeInsets.only(left: 4, right: 6),
            title:
                Text(item.dishName, style: Theme.of(context).textTheme.title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '${item.dishCurrency} ${item.dishPrice}',
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                      Text('${item.dishCalories} calories',
                          style: Theme.of(context).textTheme.subtitle)
                    ],
                  ),
                ),
                SizedBox(
                    height: screenHeight(
                  context,
                  dividedBy: 62,
                )),
                Text(
                  item.dishDescription,
                  style: Theme.of(context).textTheme.subhead,
                ),
                SizedBox(
                    height: screenHeight(
                  context,
                  dividedBy: 62,
                )),
                UpdateCart(),
                SizedBox(
                    height: screenHeight(
                  context,
                  dividedBy: 92,
                )),
                item.addonCat.isNotEmpty
                    ? Text(
                        'Customizations Available',
                        style: Theme.of(context)
                            .textTheme
                            .subhead
                            .copyWith(color: Colors.red),
                      )
                    : SizedBox()
              ],
            ),
            trailing: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              child: CachedNetworkImage(
                height: screenHeight(context, dividedBy: 3.8),
                width: screenWidth(context, dividedBy: 5.5),
                fit: BoxFit.fill,
                imageUrl: '${item.dishImage}',
                errorWidget: (context, url, error) => Image.asset(
                  'assets/images/no_image.jpg',
                  height: screenHeight(context, dividedBy: 3.8),
                  width: screenWidth(context, dividedBy: 5.5),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
