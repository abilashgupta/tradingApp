import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trade_lab_app/app/app.locator.dart';
import 'package:trade_lab_app/ui/orders/orders_view.dart';

class FormOrderViewModel extends BaseViewModel {
  final _navigator = locator<NavigationService>();
  final quantityTextController = TextEditingController();
  final priceTextController = TextEditingController();
  double get orderPrice => double.parse(priceTextController.text);
  int get quantity => int.parse(quantityTextController.text);

  void navigateToOrders(Map list, String orderType, BuildContext context) {
    Navigator.of(context).pop();
    _navigator.navigateToView(Orders(
      list: list,
      orderType: orderType,
      orderPrice: orderPrice,
      quantity: quantity,
    ));
  }
}
