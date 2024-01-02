import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:khatma_azkar/Screens/MainPages/settings_page/sub_screens/start_khatma_2.dart';
import 'package:khatma_azkar/Screens/services/Providers/juzz_start.dart';
import 'package:provider/provider.dart';

class StartKhatma extends StatelessWidget {
  const StartKhatma({super.key});

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "الرجاء تحديد المكان او الجزء الذي تريد \nأن تبدء منه الختمة",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 42, 42, 42),
                  fontSize: 16,
                  fontFamily: "khatma",
                  fontWeight: FontWeight.w900,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: DropdownButton<int>(
                      icon: const FaIcon(FontAwesomeIcons.chevronDown),
                      underline: Container(),
                      value: 1,
                      items: const [
                        DropdownMenuItem(
                          value: 1,
                          child: Text(
                            "بداية المصحف",
                          ),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: Text(
                            "الجزء الثاني",
                          ),
                        ),
                        DropdownMenuItem(
                          value: 3,
                          child: Text(
                            "الجزء الثالث",
                          ),
                        ),
                        DropdownMenuItem(
                          value: 4,
                          child: Text(
                            "الجزء الرابع",
                          ),
                        ),
                        DropdownMenuItem(
                          value: 5,
                          child: Text(
                            "الجزء الخامس",
                          ),
                        ),
                        DropdownMenuItem(
                          value: 6,
                          child: Text(
                            "الجزء السادس",
                          ),
                        ),
                        DropdownMenuItem(
                          value: 7,
                          child: Text(
                            "الجزء السابع",
                          ),
                        ),
                        DropdownMenuItem(
                          value: 8,
                          child: Text(
                            "الجزء الثامن",
                          ),
                        ),
                        DropdownMenuItem(
                          value: 9,
                          child: Text(
                            "الجزء التاسع",
                          ),
                        ),
                        DropdownMenuItem(
                          value: 10,
                          child: Text(
                            "الجزء العاشر",
                          ),
                        ),
                        DropdownMenuItem(
                          value: 11,
                          child: Text(
                            "الجزء الحادي عشر",
                          ),
                        ),
                        DropdownMenuItem(
                          value: 12,
                          child: Text(
                            "الجزء الثاني عشر",
                          ),
                        ),
                        DropdownMenuItem(
                          value: 13,
                          child: Text(
                            "الجزء الثالث عشر",
                          ),
                        ),
                        DropdownMenuItem(
                          value: 14,
                          child: Text(
                            "الجزء الرابع عشر",
                          ),
                        ),
                        DropdownMenuItem(
                          value: 15,
                          child: Text(
                            "الجزء الخامس عشر",
                          ),
                        ),
                        DropdownMenuItem(
                          value: 16,
                          child: Text(
                            "الجزء السادس عشر",
                          ),
                        ),
                        DropdownMenuItem(
                          value: 17,
                          child: Text(
                            "الجزء السابع عشر",
                          ),
                        ),
                        DropdownMenuItem(
                          value: 18,
                          child: Text(
                            "الجزء الثامن عشر",
                          ),
                        ),
                        DropdownMenuItem(
                          value: 19,
                          child: Text(
                            "الجزء التاسع عشر",
                          ),
                        ),
                        DropdownMenuItem(
                          value: 20,
                          child: Text(
                            "الجزء العشرون",
                          ),
                        ),
                        DropdownMenuItem(
                          value: 21,
                          child: Text(
                            "الجزء الواحد والعشرون",
                          ),
                        ),
                        DropdownMenuItem(
                          value: 22,
                          child: Text(
                            "الجزء الثاني والعشرون",
                          ),
                        ),
                        DropdownMenuItem(
                          value: 23,
                          child: Text(
                            "الجزء الثالث والعشرون",
                          ),
                        ),
                        DropdownMenuItem(
                          value: 24,
                          child: Text(
                            "الجزء الرابع والعشرون",
                          ),
                        ),
                        DropdownMenuItem(
                          value: 25,
                          child: Text(
                            "الجزء الخامس والعشرون",
                          ),
                        ),
                        DropdownMenuItem(
                          value: 26,
                          child: Text(
                            "الجزء السادس واالعشرون",
                          ),
                        ),
                        DropdownMenuItem(
                          value: 27,
                          child: Text(
                            "الجزء السابع والعشرون",
                          ),
                        ),
                        DropdownMenuItem(
                          value: 28,
                          child: Text(
                            "الجزء الثامن والعشرون",
                          ),
                        ),
                        DropdownMenuItem(
                          value: 29,
                          child: Text(
                            "الجزء التاسع والعشرون",
                          ),
                        ),
                        DropdownMenuItem(
                          value: 30,
                          child: Text(
                            "الجزء الثلاثون",
                          ),
                        ),
                      ],
                      onChanged: (int? newValue) {
                        Provider.of<JuzzStartProvider>(context).index =
                            newValue;
                      },
                      style: const TextStyle(
                        color: Color.fromARGB(255, 42, 42, 42),
                        fontSize: 16,
                        fontFamily: "khatma",
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  const Text(
                    " : البدء من",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "khatma",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Material(
                elevation: 6,
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const SetKhatma(),
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
      ),
    );
  }
}
