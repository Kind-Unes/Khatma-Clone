// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:khatma_azkar/Screens/MainPages/settings_page/settings.dart';

class SalahSettings extends StatelessWidget {
  const SalahSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 241, 241),
      appBar: AppBar(
        toolbarHeight: 70,
        actions: const [
          Padding(
            padding: EdgeInsets.only(top: 14, right: 15),
            child: Text(
              "اعدادات المواقيت",
              style: TextStyle(
                fontSize: 22,
                fontFamily: "khatma",
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(right: 15, left: 15, top: 5),
        child: Column(
          children: [
            const TitleWidget(title: "القبلة"),
            TileWidget(
              title: "اتجاه القبلة",
              icon: FontAwesomeIcons.kaaba,
              function: () {},
            ),
            const Divider(
              color: Color.fromARGB(255, 81, 80, 80),
            ),
            const TitleWidget(title: "تنبيهات"),
            TileWidget(
              title: "تنبيهات الأذان",
              icon: FontAwesomeIcons.bell,
              function: () {},
            ),
            const Divider(
              color: Color.fromARGB(255, 81, 80, 80),
            ),
            const TitleWidget(title: "الموقع"),
            TimeTileWidget2(
                title: "الموقع الحالي", time: "وادي السمار", function: () {}),
            SwitchTileWidget2(title: "تحديد الموقع تلقائيا", isSwitched: true),
            TileWidget2(title: "تحديد الموقع يدويا", function: () {}),
            const Divider(
              color: Color.fromARGB(255, 81, 80, 80),
            ),
            const TitleWidget(title: "طريقة حساب المواقيت"),
            SwitchTileWidget2(
                title: "اعدادات تلقائية للمواقيت", isSwitched: false),
            TileSubTitleWidget(
                title: "طريقة الحساب",
                function: () {},
                subTitle: "الجزائر (وزارة الأوقاف و الشؤون الاسلامية)"),
            TileSubTitleWidget(
                title: "حساب وقت العصر (المذهب)",
                function: () {},
                subTitle: "شافعي ,حنبلي, مالكي"),
            TileWidget2(title: "التوقيت الصيفي", function: () {}),
            TileWidget2(title: "تعديل المواقيت يدويا", function: () {}),
            TileWidget2(title: "ظبط خط العرض المرتفع", function: () {}),
            const Divider(
              color: Color.fromARGB(255, 81, 80, 80),
            ),
            const TitleWidget(
              title: "التاريخ الهجري",
            ),
            TileSubTitleButtonsWidget(
                functionAdd: () {},
                functionMinus: () {},
                function: () {},
                title: "تصحيح التاريخ الهجري",
                subTitle: "5 ربيع الثاني 1445ه"),
            const Divider(
              color: Color.fromARGB(255, 81, 80, 80),
            ),
            const TitleWidget(
              title: "لغة الأرقام",
            ),
            TileButtonsWidget(
              function: () {},
              title: "عرض الارقام",
              isSelected: true,
            ),
            const Divider(
              color: Color.fromARGB(255, 81, 80, 80),
            ),
            const TitleWidget(
              title: "دقة التنبيهات",
            ),
            SwitchTileWidget2(
                title: "السماح بوصول التنبيهات بدقة", isSwitched: false),
            const Text(
              "قم بتفعيل هذهالخاصية في حالة عدم استلام بعض التنبيهات ستظهر أيقونة منبه في شريط الحالة بشكل دائم",
              style: TextStyle(
                  color: Color.fromARGB(255, 126, 126, 126),
                  fontFamily: "khatma",
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.right,
            )
          ],
        ),
      ),
    );
  }
}

class SwitchTileWidget2 extends StatefulWidget {
  final String title;
  bool isSwitched;

  SwitchTileWidget2({
    Key? key,
    required this.title,
    required this.isSwitched,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SwitchTileWidget2State createState() => _SwitchTileWidget2State();
}

class _SwitchTileWidget2State extends State<SwitchTileWidget2> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            Transform.scale(
              scale: 1.2,
              child: Switch.adaptive(
                activeColor: const Color.fromARGB(
                    255, 6, 127, 10), // Color when the switch is ON
                value: widget.isSwitched,
                onChanged: (value) {
                  setState(() {
                    widget.isSwitched = value;
                  });
                },
              ),
            ),
            const Spacer(flex: 8),
            Text(
              widget.title,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: "khatma",
                fontSize: 17,
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}

class TimeTileWidget2 extends StatelessWidget {
  final String title;
  final String time;
  final Function() function;

  const TimeTileWidget2({
    Key? key,
    required this.title,
    required this.time,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            Text(time,
                style: const TextStyle(
                    fontFamily: "khatma",
                    fontSize: 14,
                    color: Color.fromARGB(255, 120, 120,
                        120))), // Use widget.time to access the time property
            const Spacer(flex: 8),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: "khatma",
                fontSize: 17,
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}

class TileWidget2 extends StatelessWidget {
  final String title;
  final Function() function;
  const TileWidget2({
    super.key,
    required this.title,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: SizedBox(
        height: 50,
        child: Row(children: [
          const Spacer(
            flex: 11,
          ),
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: "khatma",
                fontSize: 17),
          ),
          const Spacer(
            flex: 1,
          ),
        ]),
      ),
    );
  }
}

class TileSubTitleWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final Function() function;
  const TileSubTitleWidget({
    super.key,
    required this.title,
    required this.function,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: SizedBox(
        height: 65,
        child: Row(children: [
          const Spacer(
            flex: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: "khatma",
                    fontSize: 17),
              ),
              Text(
                subTitle,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                    fontFamily: "khatma",
                    fontSize: 15),
              ),
            ],
          ),
          const Spacer(
            flex: 1,
          ),
        ]),
      ),
    );
  }
}

class TileSubTitleButtonsWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final Function() function;
  final Function() functionAdd;
  final Function() functionMinus;

  const TileSubTitleButtonsWidget({
    super.key,
    required this.title,
    required this.function,
    required this.subTitle,
    required this.functionAdd,
    required this.functionMinus,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: Row(children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(children: [
            IconButton(
                onPressed: functionAdd,
                icon: const FaIcon(FontAwesomeIcons.plus)),
            IconButton(
                onPressed: functionMinus,
                icon: const FaIcon(FontAwesomeIcons.minus)),
          ]),
        ),
        const SizedBox(
          width: 25,
        ),
        const Text(
          "0",
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 0, 93, 3),
              fontFamily: "khatma",
              fontSize: 25),
        ),
        const Spacer(
          flex: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: "khatma",
                  fontSize: 17),
            ),
            Text(
              subTitle,
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                  fontFamily: "khatma",
                  fontSize: 15),
            ),
          ],
        ),
        const Spacer(
          flex: 1,
        ),
      ]),
    );
  }
}

class TileButtonsWidget extends StatelessWidget {
  final String title;
  final Function() function;
  final bool isSelected;
  const TileButtonsWidget({
    super.key,
    required this.title,
    required this.function,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: SizedBox(
        height: 60,
        child: Row(children: [
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        topLeft: Radius.circular(5)),
                    border: Border.fromBorderSide(
                      BorderSide(
                        color: !isSelected
                            ? const Color.fromARGB(255, 2, 68, 4)
                            : Colors.grey,
                      ),
                    ),
                    color: !isSelected
                        ? const Color.fromARGB(255, 199, 226, 200)
                        : const Color.fromARGB(255, 219, 217, 217),
                  ),
                  child: Center(
                      child: Text(
                    "١٢٣٤",
                    style: TextStyle(
                        fontSize: 17,
                        color: !isSelected
                            ? const Color.fromARGB(255, 2, 68, 4)
                            : const Color.fromARGB(255, 46, 46, 46)),
                  )),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(5),
                        topRight: Radius.circular(5)),
                    border: Border.fromBorderSide(
                      BorderSide(
                        color: isSelected
                            ? const Color.fromARGB(255, 2, 68, 4)
                            : Colors.grey,
                      ),
                    ),
                    color: isSelected
                        ? const Color.fromARGB(255, 199, 226, 200)
                        : const Color.fromARGB(255, 219, 217, 217),
                  ),
                  child: Center(
                      child: Text(
                    "1234",
                    style: TextStyle(
                        fontSize: 17,
                        color: isSelected
                            ? const Color.fromARGB(255, 2, 68, 4)
                            : const Color.fromARGB(255, 46, 46, 46)),
                  )),
                ),
              ),
            ],
          ),
          const Spacer(
            flex: 11,
          ),
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: "khatma",
                fontSize: 17),
          ),
          const Spacer(
            flex: 1,
          ),
        ]),
      ),
    );
  }
}
