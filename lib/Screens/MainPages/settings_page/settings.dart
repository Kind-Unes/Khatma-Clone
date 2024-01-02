import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:khatma_azkar/Models/azkar/azkar.dart';
import 'package:khatma_azkar/Screens/MainPages/fahras_page/surah_juzz_slider.dart';
import 'package:khatma_azkar/Screens/MainPages/settings_page/sub_screens/daily_alert.dart';
import 'package:khatma_azkar/Screens/MainPages/settings_page/sub_screens/salah_times_settings.dart';
import 'package:khatma_azkar/Screens/MainPages/settings_page/sub_screens/start_khatma_1.dart';
import 'package:khatma_azkar/Screens/MainPages/settings_page/sub_screens/start_khatma_2.dart';
import 'package:khatma_azkar/Screens/services/Providers/book_mark.dart';
import 'package:khatma_azkar/Screens/services/Providers/quran_slider_X.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsMenu extends StatefulWidget {
  const SettingsMenu({super.key});

  @override
  State<SettingsMenu> createState() => _SettingsMenuState();
}

class _SettingsMenuState extends State<SettingsMenu> {
  @override
  Widget build(BuildContext context) {
    var url = Uri.parse('https://www.instagram.com/kind.unes/');

    int selectedIndex = 0;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 241, 247, 240),
        appBar: AppBar(
          toolbarHeight: 70,
          actions: const [
            Padding(
              padding: EdgeInsets.only(top: 14, right: 15),
              child: Text(
                "المزيد",
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: "khatma",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        body: const Body());
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    var url = Uri.parse('https://www.instagram.com/kind.unes/');
    var linkedInURI = Uri.parse("https://www.linkedin.com/in/younes-hellalet");

    return ListView(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        const SizedBox(
          height: 10,
        ),
        const TitleWidget(title: "الأوراد االحالية"),
        const SizedBox(
          height: 7,
        ),
        WirdTile(
          number: 5,
          text: "الأوراد السابقة",
          function: () {},
        ),
        WirdTile(
          number: 25,
          text: "الأوراد القادمة",
          function: () {},
        ),
        const SizedBox(
          height: 6,
        ),
        TileWidget(
          title: "الفاصل",
          icon: FontAwesomeIcons.solidBookmark,
          function: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const QuranSliderX(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.easeInOut;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));

                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
                transitionDuration: const Duration(milliseconds: 500),
              ),
            );
          },
        ),
        Divider(
          color: Colors.black.withOpacity(0.5),
        ),
        const TitleWidget(title: "سنن قرأنية"),
        TileWidget(
          title: "سورة الكـهف",
          icon: FontAwesomeIcons.bookBookmark,
          function: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const QuranSliderX(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.easeInOut;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));

                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
                transitionDuration: const Duration(milliseconds: 500),
              ),
            );
          },
        ),
        const SizedBox(
          height: 7,
        ),
        TileWidget(
          title: "سورة المـلك",
          icon: FontAwesomeIcons.bookQuran,
          function: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const QuranSliderX(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.easeInOut;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));

                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
                transitionDuration: const Duration(milliseconds: 500),
              ),
            );
          },
        ),
        const SizedBox(
          height: 7,
        ),
        TileWidget(
          title: "سورة البـقرة",
          icon: FontAwesomeIcons.book,
          function: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const QuranSliderX(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.easeInOut;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));

                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
                transitionDuration: const Duration(milliseconds: 500),
              ),
            );
          },
        ),
        Divider(
          color: Colors.black.withOpacity(0.5),
        ),
        const TitleWidget(title: "الاعدادات"),
        TileWidget(
          title: "المنبه اليومي",
          icon: FontAwesomeIcons.solidBell,
          function: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const DailyAlert(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.easeInOut;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));

                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
                transitionDuration: const Duration(milliseconds: 500),
              ),
            );
          },
        ),
        TileWidget(
          title: "بدء ختمة جديدة",
          // ignore: deprecated_member_use
          icon: FontAwesomeIcons.add,
          function: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const StartKhatma(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.easeInOut;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));

                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
                transitionDuration: const Duration(milliseconds: 500),
              ),
            );
          },
        ),
        Divider(
          color: Colors.black.withOpacity(0.5),
        ),
        const TitleWidget(title: "مواقيت الصلاة"),
        TileWidget(
          title: "اعدادات مواقيت الصلاة",
          icon: FontAwesomeIcons.mosque,
          function: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const SalahSettings(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.easeInOut;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));

                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
                transitionDuration: const Duration(milliseconds: 500),
              ),
            );
          },
        ),
        TileWidget(
          title: "اتجاه القبلة",
          icon: FontAwesomeIcons.kaaba,
          function: () {},
        ),
        Divider(
          color: Colors.black.withOpacity(0.5),
        ),
        const TitleWidget(title: "منبهات الأذكار"),
        SwitchTileWidget(
          title: "منبه أذكار الصباح",
          icon: FontAwesomeIcons.solidSun,
          isSwitched: true,
        ),
        TimeTileWidget(
          title: "وقت أذكار الصباح",
          icon: FontAwesomeIcons.clock,
          time: "07:00 AM",
          function: () {},
        ),
        SwitchTileWidget(
          title: "منبه أذكار المساء",
          icon: FontAwesomeIcons.solidMoon,
          isSwitched: false,
        ),
        TimeTileWidget(
          title: "وقت أذكار المساء",
          icon: FontAwesomeIcons.clock,
          time: "05:30 PM",
          function: () {},
        ),
        Divider(
          color: Colors.black.withOpacity(0.5),
        ),
        const TitleWidget(title: "منبهات السنن"),
        SwitchTileWidget(
            title: "منبه سورة الملك",
            icon: FontAwesomeIcons.solidBell,
            isSwitched: true),
        TimeTileWidget(
          title: "وقت سورة الملك",
          icon: FontAwesomeIcons.clock,
          time: "09:00 AM",
          function: () {},
        ),
        SwitchTileWidget(
          title: "منبه سورة البقرة",
          icon: FontAwesomeIcons.solidBell,
          isSwitched: true,
        ),
        TimeTileWidget(
          title: "وقت سورة البقرة",
          icon: FontAwesomeIcons.clock,
          time: "09:30 PM",
          function: () {},
        ),
        Divider(
          color: Colors.black.withOpacity(0.5),
        ),
        const TitleWidget(title: "تطبيق ختمة"),
        TileWidget(
          title: "اللغة",
          icon: FontAwesomeIcons.gear,
          function: () {},
        ),
        TileWidget(
          title: "الاتصال بنا",
          icon: FontAwesomeIcons.circleInfo,
          function: () {},
        ),
        TileWidget(
          title: "تابعنا على لينكد ان",
          icon: FontAwesomeIcons.linkedin,
          function: () {
            launchUrl(linkedInURI, mode: LaunchMode.inAppWebView);
          },
        ),
        TileWidget(
            title: "تابعنا على انستقرام",
            icon: FontAwesomeIcons.instagram,
            function: () {
              launchUrl(url, mode: LaunchMode.inAppWebView);
            }),
        TileWidget(
          title: "انشر التطبيق",
          icon: FontAwesomeIcons.share,
          function: () {},
        ),
        TileWidget(
          title: "قيم تطبيق ختمة",
          icon: FontAwesomeIcons.solidThumbsUp,
          function: () {},
        ),
      ],
    );
  }
}

class WirdTile extends StatelessWidget {
  const WirdTile({
    super.key,
    required this.number,
    required this.text,
    required this.function,
  });
  final int number;
  final String text;
  final Function() function;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            Container(
              height: 30,
              width: 40,
              decoration: BoxDecoration(
                  color: const Color(0xFF437C01),
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Text(
                  number.toString(),
                  style: const TextStyle(
                      fontFamily: "khatma",
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Spacer(flex: 10),
            Text(
              text,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: "khatma",
                  fontSize: 17),
            ),
            const Spacer(flex: 3),
            const FaIcon(
              FontAwesomeIcons.chevronLeft,
              color: Color(0xFF437C01),
            ),
          ],
        ),
      ),
    );
  }
}

class TileWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function() function;
  const TileWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: SizedBox(
        height: 50,
        child: Row(children: [
          const Spacer(
            flex: 5,
          ),
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: "khatma",
                fontSize: 17),
          ),
          const Spacer(
            flex: 1,
          ),
          FaIcon(
            icon,
            color: const Color(0xFF437C01),
          ),
        ]),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  final String title;

  const TitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Text(
        title,
        style: TextStyle(
          fontFamily: "khatma",
          fontWeight: FontWeight.w700,
          fontSize: 17,
          color: Colors.black.withOpacity(0.5),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class SwitchTileWidget extends StatefulWidget {
  final IconData icon;
  final String title;
  bool isSwitched;

  SwitchTileWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.isSwitched,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SwitchTileWidgetState createState() => _SwitchTileWidgetState();
}

class _SwitchTileWidgetState extends State<SwitchTileWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            Transform.scale(
              scale: 1.2,
              child: Switch.adaptive(
                activeColor: const Color.fromARGB(
                    255, 6, 127, 10), // Color when the switch is ON
                value: widget.isSwitched,
                onChanged: (value) {
                  setState(() {
                    widget.isSwitched = value;
                  });
                },
              ),
            ),
            const Spacer(flex: 4),
            Text(
              widget.title,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: "khatma",
                fontSize: 17,
              ),
            ),
            const Spacer(flex: 1),
            FaIcon(
              widget.icon,
              color: const Color(0xFF437C01),
            ),
          ],
        ),
      ),
    );
  }
}

class TimeTileWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String time;
  final Function() function;

  const TimeTileWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.time,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            Text(time,
                style: const TextStyle(
                    fontSize: 19,
                    color: Color.fromARGB(255, 0, 85,
                        3))), // Use widget.time to access the time property
            const Spacer(flex: 4),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: "khatma",
                fontSize: 17,
              ),
            ),
            const Spacer(flex: 1),
            FaIcon(
              icon,
              color: const Color(0xFF437C01),
            ),
          ],
        ),
      ),
    );
  }
}
