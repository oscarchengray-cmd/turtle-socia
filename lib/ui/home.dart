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

  int selectedIndex = 0;

  void onItemTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF303F7D),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF303F7D),
        title: Row(
          children: [
            // _appBar.elementAt(_selectedIndex)
          ],
        ),
      ),
      body: Column(
        children: [
          // _body.elementAt(_selectedIndex)
          // ShowImage()
        ],
      ),

      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: onItemTap,
          backgroundColor: Color(0xFF303F7D),
          selectedItemColor: Color(0xFFB4B2D5),
          selectedLabelStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          showUnselectedLabels: false,
          unselectedItemColor: Colors.white.withAlpha(70),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: '主頁',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_add_alt_1_sharp),
              label: '好友',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history_rounded),
              label: '回顧',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_sharp),
              label: '個人',
            ),
          ],
        ),
      ),

      floatingActionButton: selectedIndex == 0
          ? Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: FloatingActionButton(
                backgroundColor: Colors.blueAccent,
                onPressed: () {},
                child: const Icon(Icons.add, color: Colors.white),
              ),
            )
          : SizedBox(),
    );
  }
}
