import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:khatma_azkar/Screens/MainPages/azkar_page/azkar_slider.dart';

class Azkar extends StatefulWidget {
  const Azkar({super.key});

  @override
  State<Azkar> createState() => _AzkarState();
}

typedef VoidCallback = void Function();

class _AzkarState extends State<Azkar> {
  @override
  Widget build(BuildContext context) {
    double half = MediaQuery.of(context).size.width * 0.485;
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        children: [
          const SizedBox(
            height: 7,
          ),
          RowTile(
              widget: Sobh(),
              icon: FontAwesomeIcons.sun,
              text: "أذكار الصباح",
              iconColor: const Color.fromARGB(255, 125, 195, 222),
              colors: const [Color(0xFF21A5ED), Color(0xFF064789)],
              width: double.infinity),
          const SizedBox(
            height: 7,
          ),
          RowTile(
              widget: Masaa(),
              icon: FontAwesomeIcons.moon,
              text: "أذكار المساء",
              iconColor: const Color(0xFF8D65B1),
              colors: const [Color(0xFF63288A), Color(0xFF1C0833)],
              width: double.infinity),
          const SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RowTile(
                  widget: Noom(),
                  icon: FontAwesomeIcons.starAndCrescent,
                  text: "أذكار النوم",
                  iconColor: const Color(0xFFE77FD7), // RGB(231, 127, 215),
                  colors: const [
                    Color(0xFFB02D9C), // RGB(176, 45, 156)
                    Color(0xFF300527)
                  ], // RGB(48, 5, 39)],
                  width: half),
              RowTile(
                  widget: Salaa(),
                  icon: FontAwesomeIcons.personPraying,
                  text: "بعد الصلاة",
                  iconColor: const Color(0xFF5B9666),
                  colors: const [
                    Color(0xFF2DA04C), // RGB(45, 176, 76)
                    Color(0xFF095013), // RGB(9, 80, 19)
                  ],
                  width: half),
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RowTile(
                  widget: Wake(),
                  icon: FontAwesomeIcons.cloudSunRain,
                  text: "الاستيقاظ",
                  iconColor: const Color(0xFF4495AC),
                  colors: const [Color(0xFF1EACCC), Color(0xFF06506D)],
                  width: half),
              RowTile(
                  widget: Mosque(),
                  icon: FontAwesomeIcons.mosque,
                  text: "أذكار المسجد",
                  iconColor: const Color(0xFFBC7650),
                  colors: const [Color(0xFFE57718), Color(0xFF852904)],
                  width: half),
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RowTile(
                  widget: Mathoora(),
                  icon: FontAwesomeIcons.solidStar,
                  text: "أدعية مأثورة",
                  iconColor: const Color(0xFF8FD438),
                  colors: const [Color(0xFF74BD0D), Color(0xFF275E03)],
                  width: half),
              RowTile(
                  widget: Quran(),
                  icon: FontAwesomeIcons.bookQuran,
                  text: "أدعيى قرأنية",
                  iconColor: const Color(0xFFC2A958),
                  colors: const [Color(0xFFDEC40A), Color(0xFF7E5701)],
                  width: half),
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RowTile(
                  widget: Travel(),
                  icon: FontAwesomeIcons.plane,
                  text: "دعاء السفر",
                  iconColor: const Color.fromARGB(255, 174, 101, 177),
                  colors: const [Color(0xFFC95CD0), Color(0xFF6C1A6F)],
                  width: half),
              RowTile(
                  widget: Roqya(),
                  icon: FontAwesomeIcons.hands,
                  text: "الرقية الشرعية",
                  iconColor: const Color(0xFF70D7D3),
                  colors: const [
                    Color(0xFF1ECCCB),
                    Color(0xFF066B65),
                  ],
                  width: half),
            ],
          ),
          const SizedBox(
            height: 7,
          ),
        ],
      ),
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.all(18),
            child: Text(
              "الأذكار",
              style: TextStyle(
                fontFamily: "khatma",
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
          )
        ],
        toolbarHeight: 70,
      ),
    );
  }
}

class RowTile extends StatelessWidget {
  const RowTile({
    super.key,
    required this.text,
    required this.colors,
    required this.iconColor,
    required this.width,
    required this.icon,
    required this.widget,
  });
  final double width;
  final String text;
  final List<Color> colors;
  final Color iconColor;
  final IconData icon;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: const Color.fromARGB(82, 0, 0, 0),
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => widget,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.easeInOut;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

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
      child: Ink(
        height: MediaQuery.of(context).size.height * 1 / 6,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: colors)),
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                text,
                style: const TextStyle(
                  fontFamily: "khatma",
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: FaIcon(
                icon,
                color: iconColor,
                size: 85,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
