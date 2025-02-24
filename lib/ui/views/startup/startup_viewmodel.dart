import 'package:stacked/stacked.dart';
import 'package:test_test/app/app.locator.dart';
import 'package:test_test/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void navToHome() {
    _navigationService.navigateToHomeView();
  }
}
