import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/pages/Login_page.dart';

class HomePage extends StatefulWidget {
  var items = new List<Item>();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController newTaskCtrl = TextEditingController();

  void add() {
    setState(() {
      widget.items.add(Item(title: newTaskCtrl.text, done: false));
      newTaskCtrl.text = "";
      save();
    });
  }

  void remove(index) {
    setState(() {
      widget.items.removeAt(index);
      save();
    });
  }

  save() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('data', jsonEncode(widget.items));
  }

  Future loadData() async {
    var prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('data');
    if (data != null) {
      Iterable decoded = jsonDecode(data);
      List<Item> result = decoded.map((x) => Item.fromJson(x)).toList();
      setState(() {
        widget.items = result;
      });
    }
  }

  _HomePageState() {
    loadData();
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Tela 0: Tela Principal',
      style: optionStyle,
    ),
    Text(
      'Tela 1: Professores',
      style: optionStyle,
    ),
    Text(
      'Tela 2: Alunos',
      style: optionStyle,
    ),
    Text(
      'Tela 3:  Perfil',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.logout, color: Colors.white),
            label: Text('Sair'),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Principal',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Professores',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.border_color),
            label: 'Alunos',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_sharp),
            label: 'Perfil',
            backgroundColor: Colors.orange,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
