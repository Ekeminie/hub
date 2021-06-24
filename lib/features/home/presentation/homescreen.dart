import "package:flutter/material.dart";
import 'package:hub/features/home/presentation/homepage.dart';
import 'package:hub/features/home/presentation/hub_page.dart';
import 'package:hub/features/home/presentation/png_page.dart';

import 'document_page.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController;
  int currentIndex = 0;


  @override
  void initState() {
    super.initState();
    _pageController = PageController(keepPage: true);
  }

  dispose() {
    _pageController.dispose();
    super.dispose();
  }


  navigateToPage(int index) {
    _pageController.jumpToPage(index);
    setState(() {
      currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    // final tab = Opacity(
    //   opacity: 0.70,
    //   child: Container(
    //       margin:EdgeInsets.symmetric(horizontal: 20),
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.all(Radius.circular(10)),
    //         color: Colors.white,
    //       ),
    //       child:TabBar(
    //           indicatorColor: Colors.red,
    //           onTap: (index){
    //             setState(() {
    //               currentTabIndex = index;
    //             });
    //           },
    //           labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),
    //           tabs: [
    //             //Tab( text: "GLC Chat Room", ),
    //             Tab( child: Text("R", style:TextStyle(color:currentTabIndex== 0? Colors.blue:Colors.grey, fontSize: 30)),),
    //             Padding(padding:EdgeInsets.symmetric(horizontal: 10),
    //                 child: Icon(Icons.compare_arrows)),
    //             Tab(child: Icon(Icons.widgets_outlined,color:currentTabIndex== 0? Colors.blue:Colors.grey)),
    //           ])
    //   )
    // );
    return DefaultTabController(
    length: 2,
      child: SafeArea(
        child: Scaffold(
          body: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            children: [
              HomePage(),
              DocumentsPage(),
              ShowPNGPage(),
              ShowHubPage()
            ],
          ),
          bottomNavigationBar: Container(
            decoration:BoxDecoration(color:Colors.white),
            height: 60,
            width: double.infinity,
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              onTap: (index) {
                _pageController.jumpToPage(index);
                setState(() {
                  currentIndex = index;
                });
              },
              // A6A6B1
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined,
                      color: currentIndex == 0
                          ? Color(0xff3F3F9D)
                          : Color(0xFFA6A6B1)),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.file_present,
                      color: currentIndex == 1
                          ? Color(0xff3F3F9D)
                          : Color(0xFFA6A6B1)),
                  label: 'Document',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.image,
                      color: currentIndex == 2
                          ? Color(0xff3F3F9D)
                          : Color(0xFFA6A6B1)),
                  label: 'PNG',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.file_present,
                      color: currentIndex == 3
                          ? Color(0xff3F3F9D)
                          : Color(0xFFA6A6B1)),
                  label: 'HUB',
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
