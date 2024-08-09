import 'package:adv_exam/screen/bookMark/bookMArk_screen.dart';
import 'package:adv_exam/screen/detail/view/detail_screen.dart';
import 'package:adv_exam/screen/home/view/home_screen.dart';
import 'package:adv_exam/screen/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';

Map<String,WidgetBuilder> app_routes={
  '/':(c1) => const SplashScreen(),
  'home':(c1) => const HomeScreen(),
  'detail':(c1) => const DetailScreen(),
  'bookmark':(c1) => const BookMarkScreen(),
};