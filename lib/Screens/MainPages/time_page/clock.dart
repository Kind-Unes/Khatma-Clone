import 'package:flutter/material.dart';
import 'package:khatma_azkar/Screens/services/Providers/clock.dart';
import 'package:provider/provider.dart';
import 'package:adhan_dart/adhan_dart.dart';

class MyClock extends StatelessWidget {
  const MyClock({super.key});
  @override
  Widget build(BuildContext context) {
    // PrayerTimes prayerTimes = prayertimes();
    // var fadjer = prayerTimes.fajr;
    // var dhuhr = prayerTimes.dhuhr;
    // var asr = prayerTimes.asr;
    // var maghrib = prayerTimes.maghrib;
    // var isha = prayerTimes.isha;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Real-Time Clock Example'),
      ),
      body: Center(
        child: Consumer<ClockProvider>(
          builder: (context, clock, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 16.0),
                Text(
                  'Date: ${(clock.currentTime.day)}/${_formatTwoDigits(clock.currentTime.month)}/${clock.currentTime.year}',
                  style: const TextStyle(fontSize: 24.0),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  PrayerTimes prayertimes() {
    // Replace the coordinates with the location you want prayer times for
    Coordinates coordinates = Coordinates(35.78056, -78.6389);

    // Replace the date with the desired date
    DateTime date = DateTime.now();

    // Use the Muslim World League calculation method as an example
    CalculationParameters params = CalculationMethod.MuslimWorldLeague();
    params.madhab = Madhab.Hanafi;

    // Create a PrayerTimes object
    PrayerTimes prayerTimes = PrayerTimes(coordinates, date, params);

    return prayerTimes;
  }

  String _formatTwoDigits(int value) {
    return value < 10 ? '0$value' : '$value';
  }
}
