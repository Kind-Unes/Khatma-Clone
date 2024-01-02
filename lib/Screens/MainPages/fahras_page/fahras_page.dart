import 'package:flutter/material.dart';
import 'package:khatma_azkar/Models/azkar/azkar.dart';
import 'package:khatma_azkar/Screens/MainPages/fahras_page/surah_juzz_slider.dart';
import 'package:khatma_azkar/Screens/services/Providers/quran_slider_X.dart';
import 'package:provider/provider.dart';

class FahrasPage extends StatelessWidget {
  const FahrasPage({super.key});

  @override
  Widget build(BuildContext context) {
    List juzzSurah = surah_juzz;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            bottom: const TabBar(indicatorColor: Colors.white, tabs: [
              Tab(
                child: Text(
                  "الأجزاء",
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      fontFamily: "khatma",
                      color: Colors.white),
                ),
              ),
              Tab(
                child: Text(
                  "السور",
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      fontFamily: "khatma",
                      color: Colors.white),
                ),
              ),
            ]),
            actions: const [
              Padding(
                padding: EdgeInsets.all(7),
                child: Text(
                  "الفهرس",
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                      fontFamily: "khatma",
                      color: Colors.white),
                ),
              ),
            ]),
        body: TabBarView(children: [
          ListView.builder(
              padding: const EdgeInsets.all(5),
              itemCount: juzzSurah.length,
              itemBuilder: ((context, index) {
                double size = 17;
                Color colorGreen = const Color.fromARGB(255, 48, 90, 1);
                return InkWell(
                  onTap: () {
                    Provider.of<QuranSliderProviderX>(context, listen: false)
                        .setIndex(surah_juzz[index] - 1);
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
                  child: Ink(
                    child: ListTile(
                        title: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "${surah_juzz[index]}" " صفحة",
                          style: TextStyle(
                              fontSize: size,
                              fontWeight: FontWeight.w500,
                              fontFamily: "khatma",
                              color: const Color.fromARGB(255, 125, 125, 125)),
                        ),
                        const Spacer(),
                        Text(
                          "الجزء" " ${numbers[index]}",
                          style: TextStyle(
                              fontSize: size,
                              fontWeight: FontWeight.w700,
                              fontFamily: "khatma",
                              color: colorGreen),
                        ),
                        Text(
                          "  .${index + 1}",
                          style: TextStyle(
                              fontSize: size,
                              fontWeight: FontWeight.w700,
                              fontFamily: "khatma",
                              color: colorGreen),
                        ),
                      ],
                    )),
                  ),
                );
              })),
          ListView.builder(
              padding: const EdgeInsets.all(5),
              itemCount: quranSurahs.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Provider.of<QuranSliderProviderX>(context, listen: false)
                        .setIndex(quranSurahsPage[index] - 1);
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
                  child: ListTile(
                      title: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                        Text(
                          "${quranSurahsPage[index]}" " صفحة",
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              fontFamily: "khatma",
                              color: Color.fromARGB(255, 125, 125, 125)),
                        ),
                        const Spacer(),
                        Text(
                          "سورة " "${quranSurahs[index]}",
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              fontFamily: "khatma",
                              color: Color.fromARGB(255, 48, 90, 1)),
                        ),
                        Text(
                          "  .${index + 1}",
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              fontFamily: "khatma",
                              color: Color.fromARGB(255, 48, 90, 1)),
                        ),
                      ])),
                );
              })
        ]),
      ),
    );
  }

  int switchSurahName(int page) {
    int surahUrl;
    switch (page) {
      case 1:
        surahUrl = 1;
        break;
      case (>= 2 || < 50):
        surahUrl = 2;
        break;
      case (>= 50 || < 77):
        surahUrl = 50;
        break;
      case (>= 77 || < 106):
        surahUrl = 77;

        break;
      case (>= 106 || < 128):
        surahUrl = 106;
        break;
      case (>= 128 || < 151):
        surahUrl = 128;
        break;
      case (>= 151 || < 177):
        surahUrl = 151;
        break;
      case (>= 177 || < 187):
        surahUrl = 177;
        break;
      case (>= 187 || < 208):
        surahUrl = 187;
        break;
      case (>= 208 || < 221):
        surahUrl = 208;
        break;
      case (>= 221 || < 235):
        surahUrl = 221;
        break;
      case (>= 235 || < 249):
        surahUrl = 235;
        break;
      case (>= 249 || < 255):
        surahUrl = 249;
        break;
      case (>= 255 || < 262):
        surahUrl = 255;
        break;
      case (>= 262 || < 267):
        surahUrl = 262;

      default:
        surahUrl = 0;
    }
    return surahUrl;
  }
}
