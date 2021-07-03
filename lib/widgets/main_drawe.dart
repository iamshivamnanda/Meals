import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget _listtilebuild(
      BuildContext context, String title, IconData icon, Function taphandler) {
    return ListTile(
      onTap: taphandler,
      leading: Icon(
        icon,
        size: 34,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            child: Text(
              'App By Shivam Nanda',
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontFamily: 'Raleway',
                  fontSize: 23,
                  fontWeight: FontWeight.w900),
            ),
            height: MediaQuery.of(context).size.height * 0.2,
            color: Theme.of(context).primaryColor,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          SizedBox(
            height: 20,
          ),
          _listtilebuild(context, 'Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          _listtilebuild(context, 'Filter', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed('/filter');
          }),
        ],
      ),
    );
  }
}
