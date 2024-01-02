import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:khatma_azkar/Models/azkar/azkar.dart';
import 'package:khatma_azkar/Screens/MainPages/quran_page/quran_slider.dart';
import 'package:khatma_azkar/Screens/services/Providers/Wird_Value.dart';
import 'package:khatma_azkar/Screens/services/Providers/book_mark.dart';
import 'package:khatma_azkar/Screens/services/Providers/quran_slider.dart';
import 'package:khatma_azkar/Screens/services/Providers/wird_quantity.dart';
import 'package:provider/provider.dart';

class QuranPage extends StatelessWidget {
  const QuranPage({super.key});

  @override
  Widget build(BuildContext context) {
    int deviser;

    if (Provider.of<WirdQuantityProvider>(context).currentIndex == 1) {
      deviser = 30;
    } else if (Provider.of<WirdQuantityProvider>(context).currentIndex == 2) {
      deviser = 15;
    } else if (Provider.of<WirdQuantityProvider>(context).currentIndex == 3) {
      deviser = 10;
    } else if (Provider.of<WirdQuantityProvider>(context).currentIndex == 5) {
      deviser = 6;
    } else if (Provider.of<WirdQuantityProvider>(context).currentIndex == 6) {
      deviser = 5;
    } else if (Provider.of<WirdQuantityProvider>(context).currentIndex == 10) {
      deviser = 3;
    } else {
      deviser = 30;
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
            iconSize: 30,
          ),
          IconButton(
            onPressed: () {
              Provider.of<QuranSliderProvider>(context, listen: false).setIndex(
                  Provider.of<BookMarkProivder>(context, listen: false).index);
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const QuranSlider(),
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
            icon: const Icon(Icons.bookmark),
            iconSize: 30,
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.only(top: 14, right: 15),
            child: Text(
              "الورد الحالي",
              style: TextStyle(
                fontSize: 22,
                fontFamily: "khatma",
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Material(
              elevation: 6,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.36,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                                "${wird[Provider.of<QuranSliderProvider>(context, listen: true).index]}"
                                " الجزء",
                                style: const TextStyle(
                                    fontFamily: "khatma",
                                    color: Color.fromARGB(255, 2, 92, 5),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800)),
                            const Spacer(),
                            const Text("من قوله تعالى",
                                style: TextStyle(
                                    fontFamily: "khatma",
                                    color: Color.fromARGB(255, 2, 92, 5),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800)),
                          ],
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        Center(
                          child: Text(
                            quranAhzabAya[Provider.of<WirdValueProvider>(
                                    context,
                                    listen: false)
                                .currentIndex],
                            style: const TextStyle(
                                fontFamily: "Quran",
                                fontWeight: FontWeight.w800,
                                fontSize: 20),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            Text(
                                "${quranAhzabStartPage[Provider.of<WirdValueProvider>(context, listen: false).currentIndex]} صحفة",
                                style: const TextStyle(
                                    fontFamily: "khatma",
                                    color: Color.fromARGB(255, 2, 92, 5),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800)),
                            const Spacer(),
                            Text(
                                "سورة ${quranAhzabStartAya[Provider.of<WirdValueProvider>(context, listen: false).currentIndex]} اية ${quranSurahStartIndex[Provider.of<WirdValueProvider>(context, listen: false).currentIndex]}",
                                style: const TextStyle(
                                    fontFamily: "khatma",
                                    color: Color.fromARGB(255, 2, 92, 5),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800)),
                          ],
                        ),
                        const Divider(
                          color: Color.fromARGB(170, 0, 0, 0),
                        ),
                        Row(
                          children: [
                            Text(
                                "${quranAhzabEndPage[Provider.of<WirdValueProvider>(context, listen: false).currentIndex]} صفحة ",
                                style: const TextStyle(
                                    fontFamily: "khatma",
                                    color: Color.fromARGB(255, 2, 92, 5),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800)),
                            const Spacer(),
                            Text(
                                "سورة ${quranAhzabEndAya[Provider.of<WirdValueProvider>(context, listen: false).currentIndex]} اية ${quranSurahEndIndex[Provider.of<WirdValueProvider>(context, listen: false).currentIndex]}",
                                style: const TextStyle(
                                    fontFamily: "khatma",
                                    color: Color.fromARGB(255, 2, 92, 5),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800)),
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Material(
                  elevation: 6,
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          "لقد اتممت قراءة وردك لهذا اليوم",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "khatma",
                              fontSize: 17,
                              fontWeight: FontWeight.w800),
                        ),
                        duration: Duration(
                            seconds:
                                1), // Optional: Set the duration for how long the SnackBar should be displayed.
                      ));
                      Provider.of<WirdValueProvider>(context, listen: false)
                          .setStart(Provider.of<WirdValueProvider>(context,
                                      listen: false)
                                  .currentIndex +
                              Provider.of<WirdQuantityProvider>(context,
                                      listen: false)
                                  .currentIndex);

                      Provider.of<QuranSliderProvider>(context, listen: false)
                          .setIndex(quranAhzabStartPage[
                                  Provider.of<WirdValueProvider>(context,
                                          listen: false)
                                      .currentIndex] -
                              1);
                    },
                    child: Ink(
                      width: MediaQuery.of(context).size.width * 0.44,
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFDC17),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.angleLeft,
                            size: 20,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            "اتممت القراءة",
                            style: TextStyle(
                                fontFamily: "khatma",
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Material(
                  elevation: 6,
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () {
                      //
                      print(
                          "----------------------------------------------------------------------- my value is${Provider.of<QuranSliderProvider>(context, listen: false).index} ");

                      //
                      if (Provider.of<QuranSliderProvider>(context,
                                  listen: false)
                              .index <=
                          quranAhzabStartPage[Provider.of<WirdValueProvider>(
                                      context,
                                      listen: false)
                                  .currentIndex] -
                              1) {
                        Provider.of<QuranSliderProvider>(context, listen: false)
                            .setIndex(quranAhzabStartPage[
                                    Provider.of<WirdValueProvider>(context,
                                            listen: false)
                                        .currentIndex] -
                                1);
                      }
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const QuranSlider(),
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
                      width: MediaQuery.of(context).size.width * 0.44,
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(67, 124, 1, 1.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "اقرأ الورد",
                          style: TextStyle(
                              fontFamily: "khatma",
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: Color.fromARGB(170, 0, 0, 0),
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "الختمة الحالية",
                style: TextStyle(
                    fontFamily: "khatma",
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color.fromARGB(188, 8, 3, 3)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Transform(
              transform: Matrix4.rotationY(
                  math.pi), // Rotate by 180 degrees (pi radians)
              alignment: Alignment.center,
              child: LinearProgressIndicator(
                value: wird[
                        Provider.of<QuranSliderProvider>(context, listen: true)
                            .index] /
                    deviser,
                backgroundColor: Colors.grey[300], // Set the background color
                valueColor: const AlwaysStoppedAnimation<Color>(
                    Colors.grey), // Set the progress color
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                    "${30 - wird[Provider.of<QuranSliderProvider>(context, listen: true).index]}"
                    "  الأوراد القادمة",
                    style: const TextStyle(
                        fontFamily: "khatma",
                        color: Color.fromARGB(188, 8, 3, 3),
                        fontSize: 16,
                        fontWeight: FontWeight.w800)),
                const Spacer(),
                Text(
                    "${wird[Provider.of<QuranSliderProvider>(context, listen: true).index]}"
                    "  الأوراد السابقة",
                    style: const TextStyle(
                        fontFamily: "khatma",
                        color: Color.fromARGB(188, 8, 3, 3),
                        fontSize: 16,
                        fontWeight: FontWeight.w800)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
