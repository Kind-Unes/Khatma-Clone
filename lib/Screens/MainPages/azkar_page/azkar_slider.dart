import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:khatma_azkar/Models/azkar/azkar.dart';
import 'package:khatma_azkar/Screens/services/Providers/page_view.dart';
import 'package:khatma_azkar/Screens/services/Providers/page_view_clicks.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class AzkarSlider extends StatelessWidget {
  const AzkarSlider({
    super.key,
    required this.text,
    required this.data,
    required this.times_data,
  });

  final String text;
  final List data;
  final List times_data;

  @override
  Widget build(BuildContext context) {
    //variables that reinialize everytime the widget rebuild it self
    final PageController pageController = PageController();

    PageProvider currentPageOn = Provider.of<PageProvider>(context);

    var azkar = data;
    var times = times_data;

    String? arabicNumber;

    if (times[Provider.of<PageProvider>(context, listen: false)
            .currentPage
            .toInt()] ==
        1) {
      arabicNumber = "مرة واحدة";
    } else if (times[Provider.of<PageProvider>(context, listen: false)
            .currentPage
            .toInt()] ==
        2) {
      arabicNumber = "مرتين";
    } else if (times[Provider.of<PageProvider>(context, listen: false)
            .currentPage
            .toInt()] ==
        3) {
      arabicNumber = "ثلاث مرات";
    } else if (times[Provider.of<PageProvider>(context, listen: false)
            .currentPage
            .toInt()] ==
        4) {
      arabicNumber = "أربع مرات";
    } else if (times[Provider.of<PageProvider>(context, listen: false)
            .currentPage
            .toInt()] ==
        7) {
      arabicNumber = "سبع مرات";
    } else if (times[Provider.of<PageProvider>(context, listen: false)
            .currentPage
            .toInt()] ==
        100) {
      arabicNumber = "مئة مرة";
    } else {
      arabicNumber = "عشرة مرات";
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: Text(
              text,
              style: const TextStyle(
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
      //-------------------------------------------------------------------------------------------
      //-------------------------------------------------------------------------------------------

      body: WillPopScope(
        onWillPop: () async {
          Provider.of<PageProvider>(context, listen: false).setCurrentPage(0);
          Provider.of<ClickCounterProvider>(context, listen: false)
              .setClickCount(0);
          0;

          return true;
        },
        child: Column(children: [
          //?                                                         Child 1 :
          Material(
            elevation: 0.5,
            child: Container(
              padding: const EdgeInsets.all(20),
              height: 70,
              decoration: const BoxDecoration(color: Color(0xFFE8E8DE)),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                    style: const TextStyle(fontSize: 20),
                    "${azkar.length}/${currentPageOn.currentPage.toInt() + 1}"),
                const Spacer(),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: const MyLinearProgressBar())
              ]),
            ),
          ),
          //?                                                       Child 2 :

          GestureDetector(
            onTap: () async {
              if (Provider.of<ClickCounterProvider>(context, listen: false)
                          .clickCount +
                      1 ==
                  times[Provider.of<PageProvider>(context, listen: false)
                      .currentPage
                      .toInt()]) {
                Provider.of<ClickCounterProvider>(context, listen: false)
                    .incrementClickCount();
                await Future.delayed(const Duration(milliseconds: 100));
                pageController.jumpToPage(
                    Provider.of<PageProvider>(context, listen: false)
                            .currentPage
                            .toInt() +
                        1);
                Provider.of<ClickCounterProvider>(context, listen: false)
                    .setClickCount(0);
              } else {
                Provider.of<ClickCounterProvider>(context, listen: false)
                    .incrementClickCount();
              }
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: 70 * 6.2,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255)),
              child: PageView.builder(
                controller: pageController,
                // List of Widgets representing pages
                reverse: true,
                pageSnapping: true,
                physics: const ClampingScrollPhysics(),
                allowImplicitScrolling: true,
                // Use ClampingScrollPhysics to remove overscroll effect
                onPageChanged: (int index) {
                  currentPageOn.setCurrentPage(index.toDouble());
                  Provider.of<ClickCounterProvider>(context, listen: false)
                      .setClickCount(0);
                },

                itemCount: azkar.length,
                itemBuilder: (context, index) {
                  if (index != 31) {
                    return Page(index);
                  } else {
                    return GestureDetector(
                        child: EndPage(),
                        onTap: () async {
                          if (Provider.of<ClickCounterProvider>(context,
                                          listen: false)
                                      .clickCount +
                                  1 ==
                              times[Provider.of<PageProvider>(context,
                                      listen: false)
                                  .currentPage
                                  .toInt()]) {
                            Provider.of<ClickCounterProvider>(context,
                                    listen: false)
                                .incrementClickCount();
                            await Future.delayed(
                                const Duration(milliseconds: 150));
                            pageController.jumpToPage(Provider.of<PageProvider>(
                                        context,
                                        listen: false)
                                    .currentPage
                                    .toInt() +
                                1);
                            Provider.of<ClickCounterProvider>(context,
                                    listen: false)
                                .setClickCount(0);
                          }
                        });
                  }
                },
              ),
            ),
          ),
          Container(
              padding: const EdgeInsets.all(16),
              height: 105,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255)),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      String shareZikr = azkar[
                          Provider.of<PageProvider>(context, listen: false)
                              .currentPage
                              .toInt()];
                      print(shareZikr);
                    },
                    child: const FaIcon(
                      FontAwesomeIcons.shareNodes,
                      size: 30,
                      color: Color(0xFF437C01),
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Consumer<ClickCounterProvider>(
                    builder: (context, clickCounterProvider, child) {
                      return times[Provider.of<PageProvider>(context,
                                      listen: false)
                                  .currentPage
                                  .toInt()] ==
                              1
                          ? Container()
                          : Stack(
                              alignment: Alignment.center,
                              children: [
                                Text(
                                  "${Provider.of<ClickCounterProvider>(context, listen: false).clickCount}",
                                  style: const TextStyle(
                                      fontFamily: "khatma",
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 75,
                                  width: 75,
                                  child: TweenAnimationBuilder<double>(
                                    tween: Tween<double>(
                                      begin: 0.0,
                                      end: 1.0,
                                    ),
                                    duration: const Duration(
                                        milliseconds:
                                            100), // Adjust the duration as needed
                                    builder: (BuildContext context,
                                        double value, Widget? child) {
                                      return CircularProgressIndicator(
                                        value: value,
                                        backgroundColor: const Color.fromARGB(
                                            255, 69, 63, 63),
                                        valueColor:
                                            const AlwaysStoppedAnimation<Color>(
                                                Colors.grey),
                                        strokeWidth: 2.0,
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 75,
                                  width: 75,
                                  child: TweenAnimationBuilder<double>(
                                    tween: Tween<double>(
                                      begin: 0.0,
                                      end: clickCounterProvider.clickCount /
                                          times[Provider.of<PageProvider>(
                                                  context,
                                                  listen: false)
                                              .currentPage
                                              .toInt()],
                                    ),
                                    duration: const Duration(
                                        milliseconds:
                                            100), // Adjust the duration as needed
                                    builder: (BuildContext context,
                                        double value, Widget? child) {
                                      return CircularProgressIndicator(
                                        value: value,
                                        backgroundColor: Colors.transparent,
                                        valueColor:
                                            const AlwaysStoppedAnimation<Color>(
                                                Color(0xFF437C01)),
                                        strokeWidth: 8.0,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                    },
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Text(
                    arabicNumber,
                    style: const TextStyle(
                        fontFamily: "khatma",
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF437C01)),
                  )
                ],
              )),
          //?                                                         Child 3 :

          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255)),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 61, 114, 1), // Set the background color
                  ),
                  onPressed: () async {
                    if (Provider.of<ClickCounterProvider>(context,
                                    listen: false)
                                .clickCount +
                            1 ==
                        times[Provider.of<PageProvider>(context, listen: false)
                            .currentPage
                            .toInt()]) {
                      Provider.of<ClickCounterProvider>(context, listen: false)
                          .incrementClickCount();
                      await Future.delayed(const Duration(milliseconds: 150));
                      pageController.jumpToPage(
                          Provider.of<PageProvider>(context, listen: false)
                                  .currentPage
                                  .toInt() +
                              1);
                      Provider.of<ClickCounterProvider>(context, listen: false)
                          .setClickCount(0);
                    } else {
                      Provider.of<ClickCounterProvider>(context, listen: false)
                          .incrementClickCount();
                    }
                  },
                  child: const Center(
                      child: Text(
                    "قراءة",
                    style: TextStyle(
                        fontFamily: "khatma",
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ))),
            ),
          ),
        ]),
      ),
    );
  }
}

Widget Page(index) {
  var azkar = azkar_sobh;
  return Container(
      padding: const EdgeInsets.all(30),
      child: Text(
          textDirection: TextDirection.rtl, // Change text direction here
          style: const TextStyle(
              fontFamily: "quran", fontWeight: FontWeight.w700, fontSize: 22),
          azkar[index]));
}

Widget EndPage() {
  return const Center(child: Text("hi"));
}

class MyLinearProgressBar extends StatelessWidget {
  const MyLinearProgressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationY(math.pi),
      child: ClipRRect(
          borderRadius:
              BorderRadius.circular(1000), // Adjust the radius as needed
          child: TweenAnimationBuilder<double>(
              tween: Tween(
                  begin: 0.0,
                  end: Provider.of<PageProvider>(context).currentPage / 30),
              duration: const Duration(
                  milliseconds: 100), // Adjust the duration as needed
              builder: (context, value, child) {
                return LinearProgressIndicator(
                  minHeight: 7,
                  value: value,
                  backgroundColor: const Color.fromARGB(255, 200, 199, 199),
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    Color.fromARGB(255, 43, 163, 16),
                  ),
                );
              })),
    );
  }
}
// Container(
//     padding: const EdgeInsets.all(30),
//     child: const Center(
//         child: Column(
//       children: [
//         FaIcon(
//           FontAwesomeIcons.solidCircleCheck,
//           color: Color.fromARGB(255, 249, 227, 27),
//           size: 10,
//         ),
//         Text(
//           "لقد أتممت قراءة اذكارك",
//           style: TextStyle(
//               fontFamily: "khatma", fontWeight: FontWeight.w900, fontSize: 10),
//         )
//       ],
//     )),
//   );

Widget Sobh() {
  return AzkarSlider(
    text: "أذكار الصباح",
    times_data: times_sobh,
    data: azkar_sobh,
  );
}

Widget Masaa() {
  return AzkarSlider(
    text: "أذكار المساء",
    times_data: times_sobh,
    data: azkar_sobh,
  );
}

Widget Noom() {
  return AzkarSlider(
    text: "أذكار النوم",
    times_data: times_sobh,
    data: azkar_sobh,
  );
}

Widget Salaa() {
  return AzkarSlider(
    text: "بعد الصلاة",
    times_data: times_sobh,
    data: azkar_sobh,
  );
}

Widget Wake() {
  return AzkarSlider(
    text: "الاستيقاظ",
    times_data: times_sobh,
    data: azkar_sobh,
  );
}

Widget Mosque() {
  return AzkarSlider(
    text: "أذكار المسجد",
    times_data: times_sobh,
    data: azkar_sobh,
  );
}

Widget Mathoora() {
  return AzkarSlider(
    text: "أدعية مأثورة",
    times_data: times_sobh,
    data: azkar_sobh,
  );
}

Widget Quran() {
  return AzkarSlider(
    text: "أدعية قرأنية",
    times_data: times_sobh,
    data: azkar_sobh,
  );
}

Widget Travel() {
  return AzkarSlider(
    text: "دعاء السفر",
    times_data: times_sobh,
    data: azkar_sobh,
  );
}

Widget Roqya() {
  return AzkarSlider(
    text: "الرقية الشرعية",
    times_data: times_sobh,
    data: azkar_sobh,
  );
}
