import 'package:online_food_booking/src/models/restaurant/restaurant_model.dart';
import 'package:online_food_booking/src/resources/api_providers/restaurant_api_provider.dart';

class Repository {
  final restaurantApiProvider = RestaurantApiProvider();

  Future<RestaurantModel> getRestaurantDetails() =>
      restaurantApiProvider.getRestaurantDetails();
}
