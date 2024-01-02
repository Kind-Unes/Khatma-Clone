import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:khatma_azkar/Models/azkar/azkar.dart';
import 'package:khatma_azkar/Screens/MainPages/quran_page/quran_page.dart';
import 'package:khatma_azkar/Screens/MainPages/settings_page/sub_screens/start_khatma_1.dart';
import 'package:khatma_azkar/Screens/services/Providers/quran_slider_X.dart';
import 'package:provider/provider.dart';

class SetKhatma extends StatelessWidget {
  const SetKhatma({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 225, 225),
      appBar: AppBar(
        toolbarHeight: 70,
        actions: const [
          Padding(
            padding: EdgeInsets.only(top: 14, right: 15),
            child: Text(
              "بدء ختمة جديدة",
              style: TextStyle(
                fontSize: 22,
                fontFamily: "khatma",
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "الرجاء تحديد المدة التي تريد أن تختم فيها أو كمية الورد اليومي الذي تود قراءته",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 42, 42, 42),
                  fontSize: 17,
                  fontFamily: "khatma",
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 18, 100, 21)),
                          borderRadius: BorderRadius.circular(100.0),
                          color: Colors.white),
                      child: Row(children: [
                        Material(
                          borderRadius: BorderRadius.circular(
                              100.0), // Adjust the border radius as needed
                          child: IconButton(
                              onPressed: () {},
                              icon: const FaIcon(FontAwesomeIcons.plus)),
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(
                              100.0), // Adjust the border radius as needed
                          child: IconButton(
                              onPressed: () {},
                              icon: const FaIcon(FontAwesomeIcons.minus)),
                        ),
                      ]),
                    ),
                    //
                    Container(
                      height: 45,
                      width: 155,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: const Center(
                        child: Text(
                          "30 يوما",
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 66, 117, 8),
                            fontSize: 17,
                            fontFamily: "khatma",
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      ":مدة الختمة",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 42, 42, 42),
                        fontSize: 17,
                        fontFamily: "khatma",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 200,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: DropdownButton<int>(
                          onTap: () {}, //
                          underline: Container(),
                          items: const [
                            DropdownMenuItem(
                              value: 1,
                              child: Text(
                                "جزء",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 42, 42, 42),
                                  fontSize: 17,
                                  fontFamily: "khatma",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 1,
                              child: Text(
                                "جزءان",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 42, 42, 42),
                                  fontSize: 17,
                                  fontFamily: "khatma",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 1,
                              child: Text(
                                "ثلاثة أجزاء",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 42, 42, 42),
                                  fontSize: 17,
                                  fontFamily: "khatma",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 1,
                              child: Text(
                                "اربعة أجزاء",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 42, 42, 42),
                                  fontSize: 17,
                                  fontFamily: "khatma",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 1,
                              child: Text(
                                "خمسة أجزاء",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 42, 42, 42),
                                  fontSize: 17,
                                  fontFamily: "khatma",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 1,
                              child: Text(
                                "ستة أجزاء",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 42, 42, 42),
                                  fontSize: 17,
                                  fontFamily: "khatma",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 1,
                              child: Text(
                                "سبعة أجزاء",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 42, 42, 42),
                                  fontSize: 17,
                                  fontFamily: "khatma",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 1,
                              child: Text(
                                "ثمانية أجزاء",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 42, 42, 42),
                                  fontSize: 17,
                                  fontFamily: "khatma",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 1,
                              child: Text(
                                "نسعة أجزاء",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 42, 42, 42),
                                  fontSize: 17,
                                  fontFamily: "khatma",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 1,
                              child: Text(
                                "عشرة أجزاء",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 42, 42, 42),
                                  fontSize: 17,
                                  fontFamily: "khatma",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                          onChanged: (int) {}),
                    ),
                    const Text(
                      "كمية \n الورد",
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: "khatma",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ]),
            ),
            Material(
              elevation: 6,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () {},
                child: Ink(
                  width: MediaQuery.of(context).size.width * 0.92,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 66, 117, 8),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                    child: Text(
                      "الاستمرار",
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
      ),
    );
  }
}
