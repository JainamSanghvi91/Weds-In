import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wedsinui/providers/google_provider.dart';
import 'package:wedsinui/screens/badHabits.dart';
import 'package:wedsinui/screens/birthFamilyPlans.dart';
import 'package:wedsinui/screens/eductional.dart';
import 'package:wedsinui/screens/gender.dart';
import 'package:wedsinui/screens/healthHabits.dart';
import 'package:wedsinui/screens/homePage.dart';
import 'package:wedsinui/screens/kudli.dart';
import 'package:wedsinui/screens/livingFamilyPlans.dart';
import 'package:wedsinui/screens/marriedstatus.dart';
import 'package:wedsinui/screens/matchAnswer.dart';
import 'package:wedsinui/screens/name.dart';
import 'package:wedsinui/screens/personalDetails.dart';
import 'package:wedsinui/screens/personal_info.dart';
import 'package:wedsinui/screens/professional.dart';
import 'package:wedsinui/screens/religion.dart';
import 'package:wedsinui/screens/settingUp.dart';
import 'package:wedsinui/screens/siblings.dart';
import 'package:wedsinui/screens/signup-signip.dart';
import 'package:wedsinui/screens/splashScreen.dart';
import 'package:wedsinui/screens/verified.dart';

import 'screens/familyDetails.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ChangeNotifierProvider(
        create: (contex) => GoogleSingnInProvider(),
        child: StreamBuilder(
          stream: FirebaseAuth.instance.onAuthStateChanged,
          builder: (context, userSnapshot) {
            final provider = Provider.of<GoogleSingnInProvider>(context);
            if (userSnapshot.connectionState == ConnectionState.waiting) {
              return SplashScreen();
            } else if (provider.isSigningIn) {
              return SplashScreen();
            } else if (userSnapshot.hasData) {
              return PersonalInfo();
            }
            return HomePage();
          },
        ),
      ),
      routes: {
        GenderInfo.routename: (ctx) => GenderInfo(),
        NameInfo.routename: (ctx) => NameInfo(),
        MarriedInfo.routename: (ctx) => MarriedInfo(),
        PersonalDetails.routename: (ctx) => PersonalDetails(),
        Religion.routename: (ctx) => Religion(),
        Kundli.routename: (ctx) => Kundli(),
        ProfessionalDetails.routename: (ctx) => ProfessionalDetails(),
        Educational.routename: (ctx) => Educational(),
        FamilyDetails.routename: (ctx) => FamilyDetails(),
        Siblings.routename: (ctx) => Siblings(),
        BadHabit.routename: (ctx) => BadHabit(),
        HealthHabit.routename: (ctx) => HealthHabit(),
        BirthFamily.routename: (ctx) => BirthFamily(),
        LivingFamilyPlans.routename: (ctx) => LivingFamilyPlans(),
        SettingUp.routename: (ctx) => SettingUp(),
        Verified.routename: (ctx) => Verified(),
        Matching.routename: (ctx) => Matching(),
        AuthScreen.routename: (ctx) => AuthScreen(),
      },
    );
  }
}
