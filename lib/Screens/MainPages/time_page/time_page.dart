import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:khatma_azkar/Screens/services/Providers/clock.dart';
import 'package:provider/provider.dart';

class TimePage extends StatelessWidget {
  TimePage({super.key});
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    PrayerTimes prayerTimes = prayertimes();
    // var fadjer = prayerTimes.fajr;
    // var dhuhr = prayerTimes.dhuhr;
    // var asr = prayerTimes.asr;
    // var maghrib = prayerTimes.maghrib;
    var isha = prayerTimes.maghrib;

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.39,
              decoration: const BoxDecoration(
                color: Color(0xFF437C01),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Consumer<ClockProvider>(
                  builder: (context, clock, child) {
                    return Column(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () async {},
                              icon: const FaIcon(FontAwesomeIcons.gear,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const FaIcon(FontAwesomeIcons.kaaba,
                                    color: Colors.white)),
                            const Spacer(),
                            const Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "مواقيت الصلاة",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontFamily: "khatma",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    "واد السمار",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontFamily: "khatma",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ])
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "مضى/تبقى على اذان العشاء",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 17,
                          fontFamily: "khatma",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                // :${_formatTwoDigits((isha.second - clock.currentTime.second).abs())}
                                '${_formatTwoDigits((isha!.hour - clock.currentTime.hour).abs())}:${_formatTwoDigits(((isha.minute - clock.currentTime.minute)).abs())}',
                                style: const TextStyle(
                                    fontSize: 50.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 4, left: 7),
                                child: Text(
                                  //
                                  _formatTwoDigits(
                                      (isha.second - clock.currentTime.second)
                                          .abs()),
                                  style: const TextStyle(
                                      fontSize: 37.0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                            ]),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 57, 106, 1)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const FaIcon(
                                      FontAwesomeIcons.chevronLeft,
                                      color: Colors.white,
                                      size: 30,
                                    )),
                                const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "اليوم السبت,7 أكتوبر ",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontFamily: "khatma",
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      "22 ربيع الاول 1445 هـ",
                                      textDirection: TextDirection.rtl,
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontFamily: "khatma",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const FaIcon(
                                      FontAwesomeIcons.chevronRight,
                                      size: 30,
                                      color: Colors.white,
                                    )),
                              ]),
                        ),
                      )
                    ]);
                  },
                ),
              )),
          Expanded(
            child: Center(
              child: PageView.builder(
                controller: controller,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        MyTile(
                          text: "الفجر",
                          time: "05:21",
                          isSelected: true,
                          Paam: "ص",
                        ),
                        MyTile(
                          text: "الشروق",
                          time: "06:47",
                          isSelected: true,
                          Paam: "ص",
                        ),
                        MyTile(
                          text: "الظهر",
                          time: "12:36",
                          isSelected: true,
                          Paam: "ص",
                        ),
                        MyTile(
                          text: "العصر",
                          time: "03:51",
                          isSelected: true,
                          Paam: "ص",
                        ),
                        MyTile(
                          text: "المغرب",
                          time: "06:23",
                          isSelected: true,
                          Paam: "ص",
                        ),
                        MyTile(
                          text: "العشاء",
                          time: "07:34",
                          isSelected: true,
                          Paam: "ص",
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    ));
  }

  PrayerTimes prayertimes() {
    // Replace the coordinates with the location you want prayer times for
    Coordinates coordinates = Coordinates(36.71, 3.155);

    // Replace the date with the desired date
    DateTime date = DateTime.now();

    // Use the Muslim World League calculation method as an example
    CalculationParameters params = CalculationMethod.Morocco();
    params.madhab = Madhab.Shafi;

    // Create a PrayerTimes object
    PrayerTimes prayerTimes = PrayerTimes(coordinates, date, params);

    return prayerTimes;
  }

  String _formatTwoDigits(int value) {
    return value < 10 ? '0$value' : '$value';
  }
}

class MyTile extends StatelessWidget {
  final String text;
  final String time;
  final bool isSelected;
  final String Paam;
  const MyTile({
    super.key,
    required this.text,
    required this.time,
    required this.isSelected,
    required this.Paam,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.5),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.bell),
            color: isSelected
                ? const Color.fromARGB(255, 11, 98, 14)
                : const Color.fromARGB(255, 11, 98, 14).withOpacity(0.5),
            iconSize: 30,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            "$time $Paam",
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: Color.fromARGB(255, 34, 34, 34),
              fontSize: 22,
              fontFamily: "khatma",
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          Text(
            text,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: Color.fromARGB(255, 62, 60, 60),
              fontSize: 21,
              fontFamily: "khatma",
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
