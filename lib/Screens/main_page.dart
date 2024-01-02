import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:khatma_azkar/Screens/MainPages/fahras_page/fahras_page.dart';
import 'package:khatma_azkar/Screens/MainPages/quran_page/quran_page.dart';
import 'package:khatma_azkar/Screens/MainPages/settings_page/settings.dart';
import 'package:khatma_azkar/Screens/MainPages/time_page/time_page.dart';
import 'package:khatma_azkar/Screens/services/Providers/page_index.dart';
import 'package:khatma_azkar/Screens/MainPages/azkar_page/azkar.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    int currentIndex =
        Provider.of<PageIndexProvider>(context, listen: true).index;

    List pages = [
      const SettingsMenu(),
      const FahrasPage(),
      TimePage(),
      const Azkar(),
      const QuranPage()
    ];
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: const BottomAppBar(
        height: 80,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavigationBarItem(
                index: 0, text: "المزيد", icon: FontAwesomeIcons.circleUser),
            BottomNavigationBarItem(
                index: 1, text: "الفهرس", icon: FontAwesomeIcons.bars),
            BottomNavigationBarItem(
                index: 2, text: "الصلاة", icon: FontAwesomeIcons.mosque),
            BottomNavigationBarItem(
                index: 3,
                text: "الأذكار",
                icon: FontAwesomeIcons.starAndCrescent),
            BottomNavigationBarItem(
                index: 4, text: "ورد اليوم", icon: FontAwesomeIcons.bookOpen),
          ],
        ),
      ),
    );
  }
}

class BottomNavigationBarItem extends StatelessWidget {
  const BottomNavigationBarItem({
    Key? key,
    required this.index,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final int index;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(50)),
      splashColor: const Color.fromARGB(255, 34, 216, 30).withOpacity(0.3),
      onTap: () {
        Provider.of<PageIndexProvider>(context, listen: false).index = index;
      },
      child: Ink(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.black,
        ),
        width: MediaQuery.of(context).size.width * 1 / 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              icon,
              size: 30,
              color: index != Provider.of<PageIndexProvider>(context).index
                  ? const Color.fromARGB(255, 255, 255, 255)
                  : const Color.fromARGB(255, 91, 208, 95),
            ),
            Text(
              text,
              style: TextStyle(
                fontFamily: "khatma",
                color: index != Provider.of<PageIndexProvider>(context).index
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : Colors.green,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
