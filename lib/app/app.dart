import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trade_lab_app/ui/dashboard/dashboard_view.dart';
import 'package:trade_lab_app/ui/form/form_view.dart';
import 'package:trade_lab_app/ui/login/login_view.dart';
import 'package:trade_lab_app/ui/marketWatch/marketwatch_view.dart';
import 'package:trade_lab_app/ui/orders/orders_view.dart';
import 'package:trade_lab_app/ui/profile/profile_view.dart';

@StackedApp(routes: [
  MaterialRoute<dynamic>(page: Login, initial: true),
  MaterialRoute<dynamic>(page: Dashboard),
  MaterialRoute<dynamic>(page: Orders),
  MaterialRoute<dynamic>(page: Profile),
  MaterialRoute<dynamic>(page: MarketWatch),
  MaterialRoute<dynamic>(page: FormOrder),
], dependencies: [
  LazySingleton(classType: NavigationService),
])
class AppSetup {}
