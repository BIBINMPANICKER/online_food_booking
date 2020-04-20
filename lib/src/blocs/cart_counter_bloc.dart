import 'package:online_food_booking/src/blocs/base_bloc.dart';
import 'package:rxdart/rxdart.dart';

class CartCounterBloc extends BaseBloc {
  BehaviorSubject<int> _count = BehaviorSubject<int>.seeded(0);

  Stream<int> get getCount => _count.stream;

  int get count => _count.value;

  //increase the cart's counter by 1
  void increment() {
    print(count);
    _count.sink.add(count + 1);
  }

  //decrease the cart's counter by 1
  void decrement() {
    _count.add(count - 1);
  }

  @override
  void dispose() {
    _count?.close();
  }
}

final cartCounterBloc = CartCounterBloc();
