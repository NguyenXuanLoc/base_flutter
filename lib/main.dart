import 'dart:io';

import 'package:cuuhoxe/app/config/constant.dart';
import 'package:cuuhoxe/app/services/system_service.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'app/routes/app_pages.dart';
import 'generated/locales.g.dart';

void main() async {
  await configApp();

  await SentryFlutter.init(
    (options) {
      options.dsn = SENTRY_DNS;
    },
    appRunner: () => runApp(
      GetMaterialApp(
        title: 'CuuHoXe',
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        theme: ThemeData(
          textTheme: GoogleFonts.mulishTextTheme(),
          backgroundColor: Colors.white,
          primaryColor: Colors.white,
          dividerColor: Colors.transparent,
          shadowColor: Colors.transparent,
          appBarTheme: AppBarTheme(elevation: 0),
        ),
        defaultTransition: Transition.native,
        translationsKeys: AppTranslation.translations,
        locale: Locale('vi', 'VN'),
        fallbackLocale: Locale('en', 'US'),
        debugShowCheckedModeBanner: false,
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: FirebaseAnalytics()),
        ],
      ),
    ),
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> configApp() async {
  HttpOverrides.global = new MyHttpOverrides();

  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  await Firebase.initializeApp();

  await dotenv.load(fileName: '.env');

  if (!kIsWeb) {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  Get.put(SystemService());
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

/**
 * https://api-sosxe.flextech.asia/api-docs/
 * https://www.figma.com/file/t1nx3yHFNQ009LHELQE4C0/C%E1%BB%A9u-h%E1%BB%99-xe?node-id=0%3A1
 * https://www.figma.com/file/TAOQ1ZGg8TXo0Wx1IS6LBk/C%E1%BB%A9u-h%E1%BB%99?node-id=89%3A0
 * get create page:forgot_pass
 * get generate model with assets/model/payload.json
 * get generate locales assets/locale
 * fgen -o lib/generated/resource.dart
 */
