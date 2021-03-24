import 'package:first_app/screens/filters_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
              title: 'Meals',
              icon: Icons.restaurant,
              tabHandler: () {
                Navigator.of(context).pushReplacementNamed('/');
              }),
          buildListTile(
              title: 'Filters',
              icon: Icons.settings,
              tabHandler: () {
                Navigator.of(context)
                    .pushReplacementNamed(FiltersScreen.routeName);
              }),
        ],
      ),
    );
  }

  Widget buildListTile(
      {@required String title,
      IconData icon = Icons.access_time,
      @required Function tabHandler}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: tabHandler,
    );
  }
}
