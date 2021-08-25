import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trade_lab_app/app/app.locator.dart';
import 'package:trade_lab_app/app/app.router.dart';

class DashboardViewModel extends BaseViewModel {
  final _navigator = locator<NavigationService>();
  int get currentIndex => _currentIndex;
  int _currentIndex = 0;

  void setIndex(int index) {
    _currentIndex = index;

    notifyListeners();
    if (_currentIndex == 1) {
      _navigator.navigateTo(Routes.orders);
    } else if (_currentIndex == 2) {
      _navigator.navigateTo(Routes.profile);
    } else {
      _navigator.navigateTo(Routes.marketWatch);
    }
  }
}
