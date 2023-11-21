import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_designs_practice/screens/login.dart';

class LocalizationPractice extends StatefulWidget {
  const LocalizationPractice({super.key});

  @override
  State<LocalizationPractice> createState() => _LocalizationPracticeState();
}

class _LocalizationPracticeState extends State<LocalizationPractice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Language Selection").tr(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.setLocale(Locale("en", "US"));
              },
              child: Text(
                "English",
                style: TextStyle(
                  color: context.locale == Locale('en', 'US')
                      ? Colors.white
                      : Colors.blue,
                ),
              ).tr(),
              style: ElevatedButton.styleFrom(
                backgroundColor: context.locale == Locale('en', 'US')
                    ? Colors.blue
                    : Colors.white,
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                context.setLocale(Locale("am", "ET"));
                print(Locale('am', 'ET'));
              },
              child: Text(
                "Amharic",
                style: TextStyle(
                  color: context.locale == Locale('am', 'ET')
                      ? Colors.white
                      : Colors.blue,
                ),
              ).tr(),
              style: ElevatedButton.styleFrom(
                backgroundColor: context.locale == Locale('am', 'ET')
                    ? Colors.blue
                    : Colors.white,
              ),
            ),
            SizedBox(
              height: 150,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Container(
                width: 75,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Next",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ).tr(),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
