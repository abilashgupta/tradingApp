import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trade_lab_app/app/app.locator.dart';
// import 'package:trade_lab_app/app/app.router.dart';
import 'package:trade_lab_app/ui/form/form_view.dart';

class MarketWatchViewModel extends BaseViewModel {
  final _navigator = locator<NavigationService>();
  var client = http.Client();
  Future fetchData() async {
    try {
      var url = Uri.parse('http://192.168.0.101:3000/stocks');
      final list = await client.get(url);
      print(list);
      // final responseData = await json.decode(response.body);
      print('response');
    } on Exception catch (err) {
      print(err);
    }
  }

  final quantityTextController = TextEditingController();
  final priceTextController = TextEditingController();
  var list = {
    "stocks": [
      {
        "name": "JPASSOCIAT",
        "id": 11460,
        "exchange": "NSE",
        "current_price": 55.3
      },
      {"name": "ACC", "id": 22, "exchange": "NSE", "current_price": 35.6},
      {
        "name": "Nifty 50",
        "id": 26000,
        "exchange": "NSE",
        "current_price": 556
      },
      {"name": "HDFCAMC", "id": 4244, "exchange": "NSE", "current_price": 45},
      {"name": "HDFC", "id": 1330, "exchange": "NSE", "current_price": 123.5},
      {"name": "SBILIFE", "id": 21808, "exchange": "NSE", "current_price": 453},
      {"name": "SBIN", "id": 3045, "exchange": "NSE", "current_price": 543},
      {
        "name": "USDINR APR FUT",
        "id": 2794,
        "exchange": "CDS",
        "current_price": 66
      },
      {"name": "INFY", "id": 1594, "exchange": "NSE", "current_price": 765},
      {
        "name": "USDINR AUG FUT",
        "id": 3692,
        "exchange": "CDS",
        "current_price": 996
      }
    ]
  };

  int get length => list['stocks']!.length;
  void navigateToFormOrder(int index, String orderType) {
    _navigator.navigateToView(
      FormOrder(list: list['stocks']![index], orderType: orderType),
    );
  }
}
