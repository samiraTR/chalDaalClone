import 'package:flutter/material.dart';


  Color mainColor = const Color(0xff0012a9); 
  Color mainColorShadow = const Color.fromARGB(255, 61, 80, 251); 
  Color secondaryColor =const Color.fromARGB(255, 226, 229, 246);
  Color mainShadeColor = const Color.fromARGB(95, 75, 139, 216);
  Color mainShadeColorNow = const Color(0xffe1eeff);
  Color mainShadeColorSecond = const Color.fromARGB(95, 13, 66, 131);
  Color darkGrayColor = const Color(0xff41454E);
  Color lightGrayColor = const Color.fromARGB(255, 96, 95, 95);
  Color greenColor = const Color(0xff5B853A);
  Color greenShadeColor = const Color(0xffE0EFD2);
  Color blackColor = const Color(0xff000800);
  Color bottomNavColor = const Color(0xffF7F7FF);
  Color splashColor = const Color.fromARGB(184, 247, 135, 238);
  Color white = const Color.fromARGB(255, 255, 255, 255);
  Color green = const Color.fromARGB(255, 2, 136, 7);
  //Color backgroundColor =Color.fromARGB(255, 245, 243, 243);
  Color backgroundColor =const Color.fromARGB(255, 239, 239, 249);



// const TEXTSTYLE_Headline4 =
//     TextStyle(color: COLOR_White, fontWeight: FontWeight.w400, fontSize: 34);
final appbarTextStyle =
    TextStyle(color: white, fontWeight: FontWeight.bold, fontSize: 20);
    
// const TEXTSTYLE_Headline6 =
//     TextStyle(color: COLOR_White, fontWeight: FontWeight.w500, fontSize: 20);
// const TEXTSTYLE_Headline18 =
//     TextStyle(color: COLOR_White, fontWeight: FontWeight.w400, fontSize: 18);
// const TEXTSTYLE_Headline18_black =
//     TextStyle(color: COLOR_Black, fontWeight: FontWeight.w400, fontSize: 18);

// const TEXTSTYLE_Headline13 =
//     TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 13);
// const TEXTSTYLE_Headline15 =
//     TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14);
// const TEXTSTYLE_Headline14 =
//     TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 15);
// const TEXTSTYLE_Headline16 =
//     TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16);

// DateTime getCurrentDateTime(String time) {
//   return DateTime.parse(time);
// }

ThemeData defaultTheme = ThemeData(
  primaryColor: mainColor,

  // appBarTheme: AppBarTheme(
  //         iconTheme: IconThemeData(
  //           color: Colors.white, // Set the color here
  //         ),
  //       ),
   appBarTheme: AppBarTheme( 
       color: mainColor,
       iconTheme:const IconThemeData(
        color: Colors.white
      ),
      
),
  //drawerTheme: const DrawerThemeData(backgroundColor: COLOR_SECONDARY),
  textTheme: const TextTheme(
    // bodyText2: TextStyle(

    //     ),
    // headline1: TextStyle(
    //   color: COLOR_White,
    // ),
    // headline2: TextStyle(
    //   color: COLOR_White,
    // ),
    // headline3: TextStyle(
    //   color: COLOR_White,
    // ),
    // headline4: TextStyle(
    //   color: COLOR_White,
    // ),
    // headline5: TextStyle(
    //   color: COLOR_White,
    // ),
    // headline6: TextStyle(
    //   color: COLOR_White,
    // ),
    // subtitle1: TextStyle(
    //   color: COLOR_White,
    // ),
    // subtitle2: TextStyle(
    //   color: COLOR_White,
    // ),
    // caption: TextStyle(
    //   color: COLOR_White,
    // ),
  ), colorScheme: ColorScheme.light(
    primary: mainColor,
    surface: secondaryColor,
  ).copyWith(background: backgroundColor),

  
  // inputDecorationTheme: InputDecorationTheme(
  //   filled: true,
  //   fillColor: COLOR_White,
  //   border: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(5.0),
  //   ),
  //   contentPadding: const EdgeInsets.all(10),
  // ),
  // listTileTheme: const ListTileThemeData(
  //   tileColor: COLOR_White,
  // ),
  // elevatedButtonTheme: ElevatedButtonThemeData(
  //   style: ElevatedButton.styleFrom(
  //     primary: COLOR_PRIMARY,
  //     elevation: 20,
  //   ),
  // ),
  // cardTheme: const CardTheme(
  //   color: Colors.transparent,
  //   elevation: 8,
  //   shadowColor: Colors.grey,
  // ),
  // dialogTheme: DialogTheme(
  //   backgroundColor: COLOR_SECONDARY,
  //   shape: RoundedRectangleBorder(
  //     side: const BorderSide(color: COLOR_White, width: 3),
  //     borderRadius: BorderRadius.circular(15),
  //   ),
  //   titleTextStyle: TEXTSTYLE_Headline5,
  // ),
  // timePickerTheme: const TimePickerThemeData(
  //   backgroundColor: BACKGROUND_COLOR,
  //   dialTextColor: COLOR_White,
  //   hourMinuteTextColor: COLOR_White,
  // ),
);