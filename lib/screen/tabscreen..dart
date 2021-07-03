import 'package:flutter/material.dart';
import './favorites_screen.dart';
import './categories_screen.dart';
import '../widgets/main_drawe.dart';
import '../models/meal_modal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favmealss;
  TabsScreen(this.favmealss);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

int _selectpageindex = 0;

class _TabsScreenState extends State<TabsScreen> {
  @override
  void initState() {
    _pages = [
      {'page': CatergoriesScreen(), 'title': 'Categories'},
      {'page': FavScreen(widget.favmealss), 'title': 'Favorites'}
    ];
    // TODO: implement initState
    super.initState();
  }

  List<Map<String, Object>> _pages;
  void _selectpage(int index) {
    setState(() {
      _selectpageindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(_pages[_selectpageindex]['title']),
      ),
      body: _pages[_selectpageindex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectpageindex,
        onTap: _selectpage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favorites'),
          )
        ],
      ),
    );
  }
}
