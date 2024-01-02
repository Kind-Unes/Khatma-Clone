import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:khatma_azkar/Models/azkar/azkar.dart';
import 'package:khatma_azkar/Screens/services/Providers/Wird_Value.dart';
import 'package:khatma_azkar/Screens/services/Providers/book_mark.dart';
import 'package:khatma_azkar/Screens/services/Providers/page_quran_vanish.dart';
import 'dart:math' as math;
import 'package:fluttertoast/fluttertoast.dart';

import 'package:khatma_azkar/Screens/services/Providers/quran_slider.dart';
import 'package:khatma_azkar/Screens/services/Providers/wird_quantity.dart';
import 'package:provider/provider.dart';

class QuranSlider extends StatelessWidget {
  const QuranSlider({super.key});
  @override
  Widget build(BuildContext context) {
    bool isVanish = Provider.of<PageVanishProvider>(context).vanish;
    PageController pageViewController = PageController(
        initialPage:
            Provider.of<QuranSliderProvider>(context, listen: true).index);
    return Scaffold(
      bottomNavigationBar: isVanish
          ? const BottomAppBar()
          : MyBNB(pageViewController: pageViewController),
      appBar: isVanish
          ? AppBar(
              toolbarHeight: 0,
              elevation: 0,
              backgroundColor: Colors.white,
            )
          : AppBar(
              toolbarHeight: 65,
              backgroundColor: const Color.fromARGB(255, 83, 82, 82),
              actions: [
                const Spacer(),
                const Center(
                    child: FaIcon(
                  color: Colors.black,
                  FontAwesomeIcons.kaaba,
                  size: 40,
                )),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      " سورة ${switchSurahName(Provider.of<QuranSliderProvider>(context, listen: true).index + 1)}",
                      style: const TextStyle(
                          fontFamily: "khatma",
                          fontSize: 17,
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      "${wird[Provider.of<QuranSliderProvider>(context, listen: true).index]} صفحة ${Provider.of<QuranSliderProvider>(context, listen: false).index + 1},جزء",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontFamily: "khatma",
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: const FaIcon(FontAwesomeIcons.gear)),
                IconButton(
                    onPressed: () {
                      Provider.of<BookMarkProivder>(context, listen: false)
                          .index = Provider.of<QuranSliderProvider>(context,
                              listen: false)
                          .index;
                      _showAutoDismissSnackBar(context);
                    },
                    icon: const FaIcon(FontAwesomeIcons.solidBookmark)),
              ],
            ),
      body: MyBody(pageViewController: pageViewController),
    );
  }

  void _showAutoDismissSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "تم وضع الفاصل في هذه الصفحة",
          textAlign: TextAlign.right,
          style: TextStyle(
              fontFamily: "khatma", fontSize: 17, fontWeight: FontWeight.w800),
        ),
        duration: Duration(seconds: 2),
      ),
    );
  }

  String switchSurahName(int page) {
    String surahName;
    switch (page) {
      case 1:
        surahName = 'الفاتحة';
        break;
      case (>= 2 && < 50):
        surahName = 'البقرة';
        break;
      case (>= 50 && < 77):
        surahName = 'آل عمران';
        break;
      case (>= 77 && < 106):
        surahName = 'النساء';
        break;
      case (>= 106 && < 128):
        surahName = 'المائدة';
        break;
      case (>= 128 && < 151):
        surahName = 'الأنعام';
        break;
      case (>= 151 && < 177):
        surahName = 'الأعراف';
        break;
      case (>= 177 && < 187):
        surahName = 'الأنفال';
        break;
      case (>= 187 && < 208):
        surahName = 'التوبة';
        break;
      case (>= 208 && < 221):
        surahName = 'يونس';
        break;
      // Add more cases for other page numbers as needed
      case (>= 221 && < 235):
        surahName = 'هود';
        break;
      case (>= 235 && < 249):
        surahName = 'يوسف';
        break;
      case (>= 249 && < 255):
        surahName = 'الرعد';
        break;
      case (>= 255 && < 262):
        surahName = 'إبراهيم';
        break;
      case (>= 262 && < 267):
        surahName = 'الحجر';
        break;
      case (>= 267 && < 282):
        surahName = 'النحل';
        break;
      case (>= 282 && < 293):
        surahName = 'الإسراء';
        break;
      case (>= 293 && < 305):
        surahName = 'الكهف';
        break;
      case (>= 305 && < 312):
        surahName = 'مريم';
        break;
      case (>= 312 && < 322):
        surahName = 'طه';
        break;
      case (>= 322 && < 332):
        surahName = 'الأنبياء';
        break;
      case (>= 332 && < 342):
        surahName = 'الحج';
        break;
      case (>= 342 && < 350):
        surahName = 'المؤمنون';
      case (>= 350 && < 359):
        surahName = 'النور';
        break;
      case (>= 359 && < 367):
        surahName = 'الفرقان';
        break;
      case (>= 367 && < 377):
        surahName = 'الشعراء';
        break;
      case (>= 377 && < 385):
        surahName = 'النمل';
        break;
      case (>= 385 && < 396):
        surahName = 'القصص';
        break;
      case (>= 396 && < 404):
        surahName = 'العنكبوت';
        break;
      case (>= 404 && < 411):
        surahName = 'الروم';
        break;
      case (>= 411 && < 415):
        surahName = 'لقمان';
        break;
      case (>= 415 && < 418):
        surahName = 'السجدة';
        break;
      case (>= 418 && < 428):
        surahName = 'الأحزاب';
        break;
      case (>= 428 && < 434):
        surahName = 'سبأ';
        break;
      case (>= 434 && < 440):
        surahName = 'فاطر';
        break;
      case (>= 440 && < 446):
        surahName = 'يس';
        break;
      case (>= 446 && < 453):
        surahName = 'الصافات';
        break;
      case (>= 453 && < 458):
        surahName = 'ص';
        break;
      case (>= 458 && < 467):
        surahName = 'الزمر';
        break;
      case (>= 467 && < 477):
        surahName = 'غافر';
        break;
      case (>= 477 && < 483):
        surahName = 'فصلت';
        break;
      case (>= 483 && < 489):
        surahName = 'الشورى';
        break;
      case (>= 489 && < 496):
        surahName = 'الزخرف';
        break;
      case (>= 496 && < 499):
        surahName = 'الدخان';
        break;
      case (>= 499 && < 502):
        surahName = 'الجاثية';
        break;
      case (>= 502 && < 507):
        surahName = 'الأحقاف';
        break;
      case (>= 507 && < 511):
        surahName = 'محمد';
        break;
      case (>= 511 && < 515):
        surahName = 'الفتح';
        break;
      case (>= 515 && < 518):
        surahName = 'الحشر';
        break;
      case (>= 518 && < 520):
        surahName = 'ق';
        break;
      case (>= 520 && < 523):
        surahName = 'الذاريات';
        break;
      case (>= 523 && < 526):
        surahName = 'الطور';
        break;
      case (>= 526 && < 528):
        surahName = 'النجم';
        break;
      case (>= 528 && < 531):
        surahName = 'القمر';
        break;
      case (>= 531 && < 534):
        surahName = 'الرحمن';
        break;
      case (>= 534 && < 537):
        surahName = 'الواقعة';
        break;
      case (>= 537 && < 542):
        surahName = 'الحديد';
        break;
      case (>= 542 && < 545):
        surahName = 'المجادلة';
        break;
      case (>= 545 && < 549):
        surahName = 'الحشر';
        break;
      case (>= 549 && < 551):
        surahName = 'الممتحنة';
        break;
      case (>= 551 && < 553):
        surahName = 'الصف';
        break;
      case (>= 553 && < 554):
        surahName = 'الجمعة';
        break;
      case (>= 554 && < 556):
        surahName = 'المنافقون';
        break;
      case (>= 556 && < 558):
        surahName = 'التغابن';
        break;
      case (>= 558 && < 560):
        surahName = 'الطلاق';
        break;
      case (>= 560 && < 562):
        surahName = 'التحريم';
        break;
      case (>= 562 && < 564):
        surahName = 'الملك';
        break;
      case (>= 564 && < 566):
        surahName = 'القلم';
        break;
      case (>= 566 && < 568):
        surahName = 'الحاقة';
        break;
      case (>= 568 && < 570):
        surahName = 'المعارج';
        break;
      case (>= 570 && < 572):
        surahName = 'نوح';
        break;
      case (>= 572 && < 574):
        surahName = 'الجن';
        break;
      case (>= 0574 && < 575):
        surahName = 'المزمل';
        break;
      case (>= 575 && < 577):
        surahName = 'المدثر';
        break;
      case (>= 577 && < 578):
        surahName = 'القيامة';
        break;
      case (>= 578 && < 580):
        surahName = 'الإنسان';
        break;
      case (>= 580 && < 582):
        surahName = 'المرسلات';
        break;
      case (>= 582 && < 583):
        surahName = 'النبأ';
        break;
      case (>= 583 && < 585):
        surahName = 'النازعات';
        break;
      case (>= 585 && < 586):
        surahName = 'عبس';
        break;
      case (>= 586 && < 586):
        surahName = 'التكوير';
        break;
      case (586):
        surahName = 'الإنفطار';
        break;
      case (>= 587 && < 589):
        surahName = 'المطففين';
        break;
      case (>= 589 && < 590):
        surahName = 'الإنشقاق';
        break;
      case (>= 590 && < 591):
        surahName = 'البروج';
        break;
      case 591:
        surahName = 'الأعلى/الطارق';
        break;
      case 592:
        surahName = 'الغاشية';
        break;
      case 593:
        surahName = 'الفجر';
        break;
      case 594:
        surahName = 'البلد';
        break;
      case 595:
        surahName = 'الشمس/الليل';
        break;
      case 596:
        surahName = 'الضحى/الشرح';
        break;
      case 597:
        surahName = 'التين/العلق';
        break;
      case 598:
        surahName = 'القدر/البينة';
        break;
      case 599:
        surahName = 'الزلزلة/العاديات';
        break;
      case 600:
        surahName = 'القارعة/التكاثر';
        break;
      case 601:
        surahName = 'العصر/الهمزة/الفيل';

      case 602:
        surahName = 'قريش/الماعون/قريش';
        break;
      case 603:
        surahName = 'الكافرون/النصر/المسد';
        break;
      case 604:
        surahName = 'الإخلاص/الفلق/الناس';
        break;
      case 113:
      default:
        surahName = "Error";
        break;
    }
    return surahName;
  }
}

class MyBody extends StatelessWidget {
  const MyBody({
    super.key,
    required this.pageViewController,
  });

  final PageController pageViewController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          Provider.of<PageVanishProvider>(context, listen: false).setVanish(
              !Provider.of<PageVanishProvider>(context, listen: false).vanish);
        },
        child: Container(
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 254, 251, 251)),
          width: double.infinity,
          height: double.infinity,
          child: PageView.builder(
            controller: pageViewController,
            physics: const ClampingScrollPhysics(),
            onPageChanged: (int newIndex) {
              Provider.of<QuranSliderProvider>(context, listen: false)
                  .setIndex(newIndex);
              pageViewController.jumpToPage(
                  Provider.of<QuranSliderProvider>(context, listen: false)
                      .index);
              if (Provider.of<QuranSliderProvider>(context, listen: false)
                      .index ==
                  quranAhzabStartPage[Provider.of<WirdQuantityProvider>(context,
                                  listen: false)
                              .currentIndex +
                          Provider.of<WirdValueProvider>(context, listen: false)
                              .currentIndex] -
                      1) {
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

                Provider.of<WirdValueProvider>(context, listen: false).setStart(
                    Provider.of<WirdValueProvider>(context, listen: false)
                            .currentIndex +
                        Provider.of<WirdQuantityProvider>(context,
                                listen: false)
                            .currentIndex);
              }
            },
            reverse: true,
            itemCount: pageAssetPaths.length - 1,
            itemBuilder: (context, index) {
              //! we start here

              return Image.asset(
                pageAssetPaths[index],
                fit: BoxFit.contain, // Adjust the fit property as needed
              );
            },
          ),
        ),
      ),
    );
  }
}

class MyBNB extends StatelessWidget {
  const MyBNB({
    super.key,
    required this.pageViewController,
  });

  final PageController pageViewController;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      child: BottomAppBar(
          elevation: 10,
          color: Colors.white,
          height: 60,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(math.pi),
                child: Slider(
                  activeColor: const Color.fromARGB(255, 65, 146, 67),
                  value: Provider.of<QuranSliderProvider>(
                    context,
                  ).index.toDouble(),
                  onChanged: (double newIndex) {
                    Provider.of<QuranSliderProvider>(context, listen: false)
                        .setIndex(newIndex.toInt());
                    pageViewController.jumpToPage(
                        Provider.of<QuranSliderProvider>(context, listen: false)
                                .index +
                            1);
                  },
                  min: 0,
                  max: pageAssetPaths.length.toDouble(),
                  divisions: pageAssetPaths.length + 1,
                )),
          )),
    );
  }
}
