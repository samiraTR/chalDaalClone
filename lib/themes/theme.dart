import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tst_app2/utils/theme.dart';

//--------------Settings Colors----------------------
const bACKGROUNDCOLOR = Color(0xff2D2E3F);
const cOLORPRIMARY = Color(0xff6F5A80);
const cOLORSECONDARY = Color(0xff3E3548);
const cOLORWhite = Colors.white;
const cOLORBlack = Colors.black;
const cOLORGreen1 = Color(0xff9DC284);
const cOLORGrey = Color(0xFFBEC0BD);
const cOLORGrey1 = Color(0xff545454);
const cOLORCyan1 = Color(0xff95C6C9);
const cOLORPurple1 = Color(0xff4E2F53);
const cOLORPurple2 = Color(0xffece8ef);
const cOLORAmber1 = Color(0xffa2be4b);

//--------------Action Panel Colors----------------------
const cOLORBlack1 = Color(0xff1E1E28);
const cOLORGrey2 = Color(0xff3B3D52);
const cOLORGrey3 = Color(0xff505470);
const cOLORBlue1 = Color(0xff51508B);
const cOLOROliveGreen = Color(0xff4B6962);
const cOLORLightGreen = Color(0xff7AAEA2);
const cOLORNavyBlue = Color(0xff3A51A3);
const cOLORGreyBlue = Color(0xff5F5F82);
const cOLORGreen2 = Color(0xff46994E);
const cOLORRed1 = Color(0xffC62C2C);
const cOLORRed2 = Color(0xff7D3E3E);
const cOLORLightPurple = Color(0xff6251A2);

const textSTYLEHeadline4 =
    TextStyle(color: cOLORWhite, fontWeight: FontWeight.w400, fontSize: 34);
const textSTYLEHeadline5 =
    TextStyle(color: cOLORWhite, fontWeight: FontWeight.w400, fontSize: 24);
const textSTYLEHeadline6 =
    TextStyle(color: cOLORWhite, fontWeight: FontWeight.w500, fontSize: 20);
const textSTYLEHeadline18 =
    TextStyle(color: cOLORWhite, fontWeight: FontWeight.w400, fontSize: 18);
const textSTYLEHeadline18Black =
    TextStyle(color: cOLORBlack, fontWeight: FontWeight.w400, fontSize: 18);

const textSTYLEHeadline13 =
    TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 13);
const textSTYLEHeadline15 =
    TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14);
const textSTYLEHeadline14 =
    TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 15);
const textSTYLEHeadline16 =
    TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16);

DateTime getCurrentDateTime(String time) {
  return DateTime.parse(time);
}

enum AppTheme { system, light, dark }

final defaultTheme = {
  AppTheme.system: ThemeData(
    // appBarTheme: AppBarTheme(backgroundColor: Colors.white),
    brightness: Brightness.light,
    primaryColor: Colors.red,
  ),
  AppTheme.light: ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF6A75EB),
    appBarTheme:  AppBarTheme(
        backgroundColor: mainColor,
        iconTheme: IconThemeData(color: white),
        titleTextStyle: GoogleFonts.inter(
                              color: white, fontSize: 18
       ),
        ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: cOLORBlack,
      ),
      displayMedium: TextStyle(
        color: cOLORBlack,
      ),
      displaySmall: TextStyle(
        color: cOLORBlack,
      ),
      headlineMedium: TextStyle(
        color: cOLORBlack,
      ),
      headlineSmall: TextStyle(
        color: cOLORBlack,
      ),
      titleLarge: TextStyle(
        color: cOLORBlack,
      ),
      titleMedium: TextStyle(
        color: cOLORBlack,
      ),
      titleSmall: TextStyle(
        color: cOLORBlack,
      ),
      bodySmall: TextStyle(
        color: cOLORBlack,
      ),
      bodyMedium: TextStyle(
        color: cOLORBlack,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: cOLORBlack,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      contentPadding: const EdgeInsets.all(10),
    ),
    listTileTheme: const ListTileThemeData(
      tileColor: cOLORWhite,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: cOLORPRIMARY,
        // elevation: 20,
      ),
    ),
    // cardTheme: const CardTheme(
    //   color: Colors.transparent,
    //   // elevation: 8,
    //   shadowColor: Colors.grey,
    // ),
    dialogTheme: DialogTheme(
      backgroundColor: cOLORSECONDARY,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: cOLORWhite, width: 3),
        borderRadius: BorderRadius.circular(15),
      ),
      titleTextStyle: textSTYLEHeadline5,
    ),
    timePickerTheme: const TimePickerThemeData(
      backgroundColor: bACKGROUNDCOLOR,
      dialTextColor: cOLORWhite,
      hourMinuteTextColor: cOLORWhite,
    ),
    colorScheme: const ColorScheme.light(
      primary: cOLORPRIMARY,
      surface: cOLORGrey2,
    ).copyWith(background: bACKGROUNDCOLOR),
    bottomAppBarTheme: const BottomAppBarTheme(color: cOLORSECONDARY),
  ),

  //======================================================DARK THEME=======================================

  AppTheme.dark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF6A75EB),
    primarySwatch: Colors.blueGrey,
    appBarTheme: AppBarTheme(
        backgroundColor: mainColor,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(color: Colors.white)),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: cOLORWhite,
      ),
      displayMedium: TextStyle(
        color: cOLORWhite,
      ),
      displaySmall: TextStyle(
        color: cOLORWhite,
      ),
      headlineMedium: TextStyle(
        color: cOLORWhite,
      ),
      headlineSmall: TextStyle(
        color: cOLORWhite,
      ),
      titleLarge: TextStyle(
        color: cOLORWhite,
      ),
      titleMedium: TextStyle(
        color: cOLORWhite,
      ),
      titleSmall: TextStyle(
        color: cOLORWhite,
      ),
      bodySmall: TextStyle(
        color: cOLORWhite,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: cOLORBlack,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      contentPadding: const EdgeInsets.all(10),
    ),
    listTileTheme: const ListTileThemeData(
      tileColor: Colors.transparent,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: cOLORPRIMARY,
        // elevation: 20,
      ),
    ),
    cardTheme: const CardTheme(
      color: Colors.transparent,
      // elevation: 8,
      shadowColor: Colors.grey,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: cOLORSECONDARY,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: cOLORWhite, width: 3),
        borderRadius: BorderRadius.circular(15),
      ),
      titleTextStyle: textSTYLEHeadline5,
    ),
    timePickerTheme: const TimePickerThemeData(
      backgroundColor: bACKGROUNDCOLOR,
      dialTextColor: cOLORWhite,
      hourMinuteTextColor: cOLORWhite,
    ),
    colorScheme: const ColorScheme.dark(
      primary: cOLORPRIMARY,
      surface: cOLORGrey2,
    ).copyWith(background: bACKGROUNDCOLOR),
    bottomAppBarTheme: const BottomAppBarTheme(color: cOLORBlack),
  )
}; 
//  ThemeData(
//   canvasColor: bACKGROUNDCOLOR,
//   bottomNavigationBarTheme:
//       const BottomNavigationBarThemeData(backgroundColor: cOLORSECONDARY),
//   primaryColor: cOLORPRIMARY,
//   appBarTheme: const AppBarTheme(
//       color: cOLORSECONDARY, titleTextStyle: textSTYLEHeadline4),
//   //drawerTheme: const DrawerThemeData(backgroundColor: cOLORSECONDARY),
//   textTheme: const TextTheme(
//     displayLarge: TextStyle(
//       color: cOLORWhite,
//     ),
//     displayMedium: TextStyle(
//       color: cOLORWhite,
//     ),
//     displaySmall: TextStyle(
//       color: cOLORWhite,
//     ),
//     headlineMedium: TextStyle(
//       color: cOLORWhite,
//     ),
//     headlineSmall: TextStyle(
//       color: cOLORWhite,
//     ),
//     titleLarge: TextStyle(
//       color: cOLORWhite,
//     ),
//     titleMedium: TextStyle(
//       color: cOLORWhite,
//     ),
//     titleSmall: TextStyle(
//       color: cOLORWhite,
//     ),
//     bodySmall: TextStyle(
//       color: cOLORWhite,
//     ),
//   ),
//   inputDecorationTheme: InputDecorationTheme(
//     filled: true,
//     fillColor: cOLORWhite,
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(5.0),
//     ),
//     contentPadding: const EdgeInsets.all(10),
//   ),
//   listTileTheme: const ListTileThemeData(
//     tileColor: cOLORWhite,
//   ),
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ElevatedButton.styleFrom(
//       backgroundColor: cOLORPRIMARY,
//       elevation: 20,
//     ),
//   ),
//   cardTheme: const CardTheme(
//     color: Colors.transparent,
//     elevation: 8,
//     shadowColor: Colors.grey,
//   ),
//   dialogTheme: DialogTheme(
//     backgroundColor: cOLORSECONDARY,
//     shape: RoundedRectangleBorder(
//       side: const BorderSide(color: cOLORWhite, width: 3),
//       borderRadius: BorderRadius.circular(15),
//     ),
//     titleTextStyle: textSTYLEHeadline5,
//   ),
//   timePickerTheme: const TimePickerThemeData(
//     backgroundColor: bACKGROUNDCOLOR,
//     dialTextColor: cOLORWhite,
//     hourMinuteTextColor: cOLORWhite,
//   ),
//   colorScheme: const ColorScheme.light(
//     primary: cOLORPRIMARY,
//     surface: cOLORGrey2,
//   ).copyWith(background: bACKGROUNDCOLOR),
//   bottomAppBarTheme: const BottomAppBarTheme(color: cOLORSECONDARY),
// );
