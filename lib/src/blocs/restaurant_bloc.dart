import 'dart:async';

import 'package:online_food_booking/src/models/restaurant/restaurant_model.dart';
import 'package:online_food_booking/src/utils/constants.dart';
import 'package:online_food_booking/src/utils/object_factory.dart';

import 'base_bloc.dart';

class RestaurantBloc extends BaseBloc {
  StreamController<RestaurantModel> _restaurantController =
      new StreamController<RestaurantModel>.broadcast();

  Stream<RestaurantModel> get restaurantRes => _restaurantController.stream;

// fetch the restaurant's details
  getRestaurantDetails() async {
    final restaurantResponse =
        await ObjectFactory().repository.getRestaurantDetails();
    if (restaurantResponse != null) {
      _restaurantController.sink.add(restaurantResponse);
    } else {
      _restaurantController.sink.addError(Constants.SOME_ERROR_OCCURRED);
    }
  }

  @override
  void dispose() {
    _restaurantController?.close();
  }
}

final restaurantBloc = RestaurantBloc();
