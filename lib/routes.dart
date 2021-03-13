import 'package:baithul1/screens/newhome/new_home.dart';
import 'package:baithul1/screens/recipts/receipts_screen.dart';
import 'package:baithul1/screens/request_details/request_details_screen.dart';
import 'package:baithul1/screens/sign_in/sign_in_screen.dart';
import 'package:baithul1/screens/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  '/': (context) => SplashScreen(),
  '/login': (context) => SignInScreen(),
  '/home': (context) => NewHomeScreen(),
  '/recipts': (context) => ReceiptsScreen(),
  '/rdetails': (context) => RequestDetailsScreen(),
  '/testuser': (context) => NewHomeScreen(),
};
