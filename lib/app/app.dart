import 'package:test_test/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:test_test/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:test_test/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:test_test/ui/dialogs/iasmin/iasmin_dialog.dart';
import 'package:test_test/ui/bottom_sheets/lola/lola_sheet.dart';
import 'package:test_test/services/user_service.dart';
import 'package:test_test/ui/views/home2/home2_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView),
    MaterialRoute(page: Home2View),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: UserService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    StackedBottomsheet(classType: LolaSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: IasminDialog),
// @stacked-dialog
  ],
)
class App {}
