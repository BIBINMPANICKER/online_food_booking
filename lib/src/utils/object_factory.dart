import 'package:online_food_booking/src/resources/repository/repository.dart';

import 'api_client.dart';

class ObjectFactory {
  static final _objectFactory = ObjectFactory._internal();

  ObjectFactory._internal();

  factory ObjectFactory() => _objectFactory;

  //Initialisation of Objects
  ApiClient _apiClient = ApiClient();
  Repository _repository = Repository();

  ///
  /// Getters of Objects
  ///
  ApiClient get apiClient => _apiClient;

  Repository get repository => _repository;
}
