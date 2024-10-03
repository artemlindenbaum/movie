import 'package:flutter/material.dart';

class AppColors {

  static Color white = const Color(0xFFFFFFFF);
  static Color black = const Color(0xFF000000);
  static Color transparent = const Color(0x00000000);
  
  static Color grayA52 = const Color(0xFF1F3A52);
  static Color grayD73 = const Color(0xFF445D73);
  static Color gray78D = const Color(0xFF60778D);
  static Color gray39F = const Color(0xFF89939F);
  static Color gray3A7 = const Color(0xFF7F93A7);
  static Color grayEBF = const Color(0xFF9DAEBF);
  static Color gray0DD = const Color(0xFFC2D0DD);
  static Color gray8EF = const Color(0xFFE1E8EF);
  static Color gray1FC = const Color(0xFFE5F1FC);
  static Color gray2F4 = const Color(0xFFEFF2F4);  
  
  static Color blue6FF = const Color(0xFF45A6FF);
  static Color blueCE4 = const Color(0xFF2D8CE4);
  static Color blueD75 = const Color(0xFF003D75);
  static Color blueF5A = const Color(0xFF002F5A);
  static Color blueA29 = const Color(0xFF081A29);

  static Color green950 = const Color(0xFF41A950);
  static Color green43D = const Color(0xFF95C43D); //#95C43D
  static Color redA47 = const Color(0xFFD21A47);
  static Color redD6E = const Color(0xFFBA1D6E);
  static Color yellow3D2 = const Color(0xFFFAF3D2);
  static Color pinkE6E = const Color(0x4DBC1E6E);


  static Gradient redGradient = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFFE63158),
      Color(0xFFBA1D6E),
      Color(0xFF95238D),
    ],
    stops: [0.1763, 0.4935, 0.8945],
  );  
}

