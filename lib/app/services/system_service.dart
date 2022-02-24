import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:cuuhoxe/app/services/globals.dart' as globals;

class SystemService extends GetxService {
  void setCurrentHotline(String hotline) async {
    globals.hotLine = hotline;
  }

  void setCurrentServerTime(String time) {
    globals.serverTime = time;
  }

  void setActivePackageRemaining(int remaining) {
    globals.timePackageRemaining = remaining;
  }
}
