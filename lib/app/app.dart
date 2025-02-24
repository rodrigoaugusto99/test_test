import 'package:test_test/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:test_test/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:test_test/ui/views/home/home_view.dart';
import 'package:test_test/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:test_test/ui/dialogs/iasmin/iasmin_dialog.dart';
import 'package:test_test/ui/bottom_sheets/lola/lola_sheet.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
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
