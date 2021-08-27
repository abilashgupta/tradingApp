import 'package:stacked/stacked.dart';

class OrdersViewModel extends BaseViewModel {
  List get displayOrder => _displayOrder;
  // List roughOrder =[];
  // roughOrder.addAll(_displayOrder);
  List _displayOrder = [];

  void refreshOrders(List order) {
    _displayOrder.addAll(order);
    notifyListeners();
    print(_displayOrder);
  }
}
