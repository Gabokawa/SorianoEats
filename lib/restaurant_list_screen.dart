import 'package:flutter/material.dart';

class RestaurantListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get username from arguments passed from LoginScreen
    final Object? args = ModalRoute.of(context)!.settings.arguments;
    String username = args != null ? (args as Map)['username'] : 'Guest';

    return Scaffold(
      backgroundColor: Color(0xFFE4CCFF),
      appBar: AppBar(
        title: Text('Welcome, $username!'),
        backgroundColor: Color(0xFFFFA629),
        leading: IconButton(
          icon: Icon(Icons.logout),
          onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context,
              '/',
              (Route route) =>
                  false), // Navigate to '/' and remove all above routes
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          RestaurantTile(),
          RestaurantTile(),
          RestaurantTile(),
        ],
      ),
    );
  }
}

class RestaurantTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: SizedBox(
          width: 50, // Specify the width
          height: 50, // Specify the height
          child: Placeholder(),
        ),
        title: Text('Restaurant Name'),
        subtitle: Text('Address goes here\nTime Open'),
        onTap: () {
          Navigator.pushNamed(context, '/menuList');
        },
      ),
    );
  }
}
