import 'package:flutter/material.dart';
import 'package:flutter_application_1/signup_screen.dart';
import 'login_screen.dart';
import 'restaurant_list_screen.dart';
import 'menu_list_screen.dart';
import 'order_summary_screen.dart';

void main() {
  runApp(FoodDeliveryApp());
}

class FoodDeliveryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SorianoEats App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/restaurantList': (context) => RestaurantListScreen(),
        '/menuList': (context) => MenuListScreen(),
        '/orderSummary': (context) => OrderSummaryScreen(),
        '/signup': (context) => SignupScreen()
      },
    );
  }
}
