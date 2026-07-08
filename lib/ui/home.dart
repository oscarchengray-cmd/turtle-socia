import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turtle_social/ui/ShowImage.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List<Widget> _appBar = [];
  // List<Widget> _body = [ShowImage()];

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF151E2A),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF151E2A),
        title: Row(
          children: [
            // _appBar.elementAt(_selectedIndex)
          ],
        ),
      ),
      body: Column(
        children: [
          // _body.elementAt(_selectedIndex)
          ShowImage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Color(0xFF151E2A),
        selectedItemColor: Color(0xFF4C76DB),
        unselectedItemColor: Colors.white.withAlpha(70),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      floatingActionButton: _selectedIndex == 0? Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: FloatingActionButton(
          backgroundColor: Colors.blueAccent,
          onPressed: (){

          },
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ) : SizedBox(),
    );
  }
}
