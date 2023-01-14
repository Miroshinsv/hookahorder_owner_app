import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
    fontFamily: "Montserrat",
    disabledColor: const Color.fromRGBO(151, 193, 193, 1),
    appBarTheme: const AppBarTheme(
      color: Color.fromRGBO(39, 129, 129, 1),
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.white,
      )
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          const Color.fromRGBO(39, 129, 129, 1),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(
        color: Colors.grey,
      ),
      contentPadding:
          const EdgeInsets.only(left: 13.0, top: 12.0, bottom: 12.0),
      counterStyle: const TextStyle(
        fontFamily: "Montserrat",
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
      filled: true,
      fillColor: const Color.fromRGBO(198, 222, 222, 1),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
  );
}
