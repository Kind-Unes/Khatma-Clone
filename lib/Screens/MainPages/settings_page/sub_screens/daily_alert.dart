import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:khatma_azkar/Screens/services/Providers/daily_alert_provider/daily_1.dart';
import 'package:khatma_azkar/Screens/services/Providers/daily_alert_provider/daily_2.dart';
import 'package:khatma_azkar/Screens/services/Providers/daily_alert_provider/daily_3.dart';
import 'package:khatma_azkar/Screens/services/Providers/daily_alert_provider/daily_4.dart';
import 'package:khatma_azkar/Screens/services/Providers/daily_alert_provider/daily_5.dart';
import 'package:provider/provider.dart';

class DailyAlert extends StatelessWidget {
  const DailyAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 217, 215, 215),
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "المنبه اليومي",
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
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                "يمكنك تحديد وقت المنبه لتذكيرك بالورد يوميا",
                textAlign: TextAlign.right,
                style: TextStyle(
                    color:
                        const Color.fromARGB(255, 19, 19, 19).withOpacity(0.9),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: "khatma"),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TimeTile(
              gearFunction: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        titlePadding: const EdgeInsets.all(0),
                        backgroundColor: Colors.white,
                        content: Container(
                            height: 250,
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Column(
                              children: [
                                Transform.scale(
                                  scale: 1.539,
                                  child: Container(
                                    height: 74,
                                    decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 26, 124, 29)),
                                    child: const Padding(
                                      padding: EdgeInsets.only(right: 14),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          "ضبط الوقت",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox()
                              ],
                            )));
                  },
                );
              },
              number: "04:00",
              isToggled:
                  Provider.of<AlertOneProvider>(context, listen: true).vanish,
              function: (bool satus) {
                Provider.of<AlertOneProvider>(context, listen: false)
                    .setVanish(satus);
              },
            ),
            const SizedBox(
              height: 13,
            ),
            TimeTile(
              gearFunction: () {},
              number: "05:00",
              isToggled:
                  Provider.of<AlertTwoProvider>(context, listen: true).vanish,
              function: (bool satus) {
                Provider.of<AlertTwoProvider>(context, listen: false)
                    .setVanish(satus);
              },
            ),
            const SizedBox(
              height: 13,
            ),
            TimeTile(
              gearFunction: () {},
              number: "06:00",
              isToggled:
                  Provider.of<AlertThreeProvider>(context, listen: true).vanish,
              function: (bool satus) {
                Provider.of<AlertThreeProvider>(context, listen: false)
                    .setVanish(satus);
              },
            ),
            const SizedBox(
              height: 13,
            ),
            TimeTile(
              gearFunction: () {},
              number: "07:00",
              isToggled:
                  Provider.of<AlertFourProvider>(context, listen: true).vanish,
              function: (bool satus) {
                Provider.of<AlertFourProvider>(context, listen: false)
                    .setVanish(satus);
              },
            ),
            const SizedBox(
              height: 13,
            ),
            TimeTile(
              gearFunction: () {},
              number: "08:00",
              isToggled:
                  Provider.of<AlertFiveProvider>(context, listen: true).vanish,
              function: (bool satus) {
                Provider.of<AlertFiveProvider>(context, listen: false)
                    .setVanish(satus);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TimeTile extends StatelessWidget {
  const TimeTile({
    super.key,
    required this.isToggled,
    required this.function,
    required this.number,
    required this.gearFunction,
  });

  final bool isToggled;
  final Function(bool) function;
  final String number;
  final Function() gearFunction;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(7),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Colors.white,
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Transform.scale(
                scale: 1.2,
                child: Switch.adaptive(
                  activeColor: const Color.fromARGB(
                      255, 6, 127, 10), // Color when the switch is ON
                  value: isToggled,
                  onChanged: function,
                ),
              ),
              const Spacer(),
              isToggled
                  ? IconButton(
                      onPressed: gearFunction,
                      icon: const FaIcon(
                        FontAwesomeIcons.gear,
                        color: Color.fromARGB(255, 22, 95, 24),
                      ))
                  : Container(),
              Padding(
                padding: const EdgeInsets.only(top: 15, right: 5),
                child: Text(
                  "م",
                  style: TextStyle(
                      fontFamily: "khatma",
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: isToggled
                          ? const Color.fromARGB(255, 22, 95, 24)
                          : Colors.grey),
                ),
              ),
              Text(
                number,
                style: TextStyle(
                    fontFamily: "khatma",
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: isToggled
                        ? const Color.fromARGB(255, 22, 95, 24)
                        : Colors.grey),
              ),
            ]),
      ),
    );
  }
}
