import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unsplash/pages/search_page.dart';

import 'collection_page.dart';


class HomePage extends StatefulWidget {
  static const String id = "home_page";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController? _pageController;
  int _currentTap = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Unsplash",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.pix_sharp,
            color: Colors.white,
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          SearchPage(),
          CollectionPage(),
        ],
        onPageChanged: (int index) {
          setState(() {
            _currentTap = index;
          });
        },
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 32,
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.collections,
                size: 32,
              )),
        ],
        onTap: (int index) {
          setState(() {
            _currentTap = index;
          });
          _pageController!.animateToPage(index,
              duration: Duration(milliseconds: 200), curve: Curves.easeIn);
        },
        currentIndex: _currentTap,
        activeColor: Colors.white,
      ),
    );
  }
}