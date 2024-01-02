import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khatma_azkar/Screens/main_page.dart';
import 'package:khatma_azkar/Screens/services/Providers/Wird_Value.dart';
import 'package:khatma_azkar/Screens/services/Providers/book_mark.dart';
import 'package:khatma_azkar/Screens/services/Providers/clock.dart';
import 'package:khatma_azkar/Screens/services/Providers/daily_alert_provider/daily_1.dart';
import 'package:khatma_azkar/Screens/services/Providers/daily_alert_provider/daily_2.dart';
import 'package:khatma_azkar/Screens/services/Providers/daily_alert_provider/daily_3.dart';
import 'package:khatma_azkar/Screens/services/Providers/daily_alert_provider/daily_4.dart';
import 'package:khatma_azkar/Screens/services/Providers/daily_alert_provider/daily_5.dart';
import 'package:khatma_azkar/Screens/services/Providers/fahras_tab_bar.dart';
import 'package:khatma_azkar/Screens/services/Providers/juzz_start.dart';
import 'package:khatma_azkar/Screens/services/Providers/page_index.dart';
import 'package:khatma_azkar/Screens/services/Providers/page_quran_vanish.dart';
import 'package:khatma_azkar/Screens/services/Providers/page_selection.dart';
import 'package:khatma_azkar/Screens/services/Providers/page_view.dart';
import 'package:khatma_azkar/Screens/services/Providers/page_view_clicks.dart';
import 'package:khatma_azkar/Screens/services/Providers/quran_slider.dart';
import 'package:khatma_azkar/Screens/services/Providers/quran_slider_X.dart';
import 'package:khatma_azkar/Screens/services/Providers/wird_quantity.dart';
import 'package:khatma_azkar/ViewModels/countries_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AlertOneProvider()),
        ChangeNotifierProvider(create: (context) => AlertTwoProvider()),
        ChangeNotifierProvider(create: (context) => AlertThreeProvider()),
        ChangeNotifierProvider(create: (context) => AlertFourProvider()),
        ChangeNotifierProvider(create: (context) => AlertFiveProvider()),
        ChangeNotifierProvider(create: (context) => QuranSliderProviderX()),
        ChangeNotifierProvider(create: (context) => PageIndexProvider()),
        ChangeNotifierProvider(create: (context) => PageSelectionProvider()),
        ChangeNotifierProvider(create: ((context) => PageProvider())),
        ChangeNotifierProvider(create: (context) => ClickCounterProvider()),
        ChangeNotifierProvider(create: (context) => QuranSliderProvider()),
        ChangeNotifierProvider(create: (context) => BookMarkProivder()),
        ChangeNotifierProvider(create: (context) => PageVanishProvider()),
        ChangeNotifierProvider(create: (context) => ClockProvider()),
        ChangeNotifierProvider(create: (context) => TabProvider()),
        ChangeNotifierProvider(create: (context) => JuzzStartProvider()),
        ChangeNotifierProvider(create: (context) => CountryViewModel()),
        ChangeNotifierProvider(create: (context) => WirdQuantityProvider()),
        ChangeNotifierProvider(create: (context) => WirdValueProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF437C01),
        statusBarBrightness: Brightness.dark));
    return MaterialApp(
      home: const MainPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme:
              const AppBarTheme(color: Color(0xFF437C01), toolbarHeight: 70)),
    );
  }
}




// الفالصل رسالة في حالة provider = 0 
// 9ibla direction
// share ability
// unes insta redirection
// my linkedin redirection
// call us



// notfs system
// share system
// wird system
// Language system
// redirection system*
// alarm system
// time system