import 'package:flutter/material.dart';
import 'package:online_food_booking/src/blocs/cart_counter_bloc.dart';
import 'package:online_food_booking/src/utils/utils.dart';

class UpdateCart extends StatefulWidget {
  @override
  _UpdateCartState createState() => _UpdateCartState();
}

class _UpdateCartState extends State<UpdateCart> {
  int itemsAdded = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: new BorderRadius.circular(30)),
        height: screenHeight(
          context,
          dividedBy: 18,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              onPressed: () {
                setState(() {
                  if (itemsAdded != 0) {
                    itemsAdded--;
                    //decrease cart's counter
                    cartCounterBloc.decrement();
                  }
                });
              },
              icon: Icon(
                Icons.remove,
                color: Colors.white,
              ),
              padding: EdgeInsets.all(0),
            ),
            Text(
              itemsAdded.toString(),
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  itemsAdded++;
                  // increase cart's counter
                  cartCounterBloc.increment();
                });
              },
              icon: Icon(Icons.add, color: Colors.white),
              padding: EdgeInsets.all(0),
            )
          ],
        ));
  }
}
