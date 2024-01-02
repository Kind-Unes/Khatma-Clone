import 'package:flutter/material.dart';

class PreviousWird extends StatelessWidget {
  const PreviousWird({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 217, 217),
      appBar: AppBar(
        toolbarHeight: 70,
        actions: const [
          Padding(
            padding: EdgeInsets.only(top: 14, right: 15),
            child: Text(
              "الأوراد السابقة",
              style: TextStyle(
                fontSize: 22,
                fontFamily: "khatma",
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(7),
          itemCount: 5,
          itemBuilder: ((context, index) {
            return InkWell(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                height: MediaQuery.of(context).size.height * 0.2,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "الورد ${index + 1}",
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: "khatma",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "من سورة الفاتحة - اية 1",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "khatma",
                          color: Color.fromARGB(255, 51, 94, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "الى سورة البقرة - أية 74",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "khatma",
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 54, 101, 1),
                        ),
                      ),
                      const Text(
                        "صفحة 1 ألى 11",
                        style: TextStyle(
                          color: Color.fromARGB(255, 112, 112, 112),
                          fontSize: 17,
                          fontFamily: "khatma",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          })),
    );
  }
}

Widget noPreviuosWird() {
  return const Center(
    child: Text(
      "لا توجد اوراد سابقة",
      style: TextStyle(
        fontSize: 16,
        fontFamily: "khatma",
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
