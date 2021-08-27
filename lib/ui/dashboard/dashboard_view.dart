import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trade_lab_app/ui/marketWatch/marketwatch_view.dart';
import 'package:trade_lab_app/ui/orders/orders_view.dart';
import 'package:trade_lab_app/ui/profile/profile_view.dart';

import 'dashboard_viewmodel.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: model.currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black87,
          selectedFontSize: 16,
          unselectedFontSize: 12,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Market Watch',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          onTap: model.setIndex,
        ),
        body: getViewForIndex(model.currentIndex),
      ),
      viewModelBuilder: () => DashboardViewModel(),
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 1:
        return Orders(list: {}, orderType: '', quantity: 0, orderPrice: 0);
      case 2:
        return Profile();
      default:
        return MarketWatch();
    }
  }
}
