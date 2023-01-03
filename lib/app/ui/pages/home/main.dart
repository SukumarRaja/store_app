import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/main.dart';
import '../../themes/colors.dart';
import '../profile.dart';
import 'home.dart';

class HomeMain extends StatelessWidget {
  HomeMain({Key? key}) : super(key: key);
  final List<Widget> pages = [
    Profile(),
    Container(
      child: const Center(
        child: Text("categories"),
      ),
    ),
    const Home(),
    Container(
      child: const Center(
        child: Text("cart"),
      ),
    ),
    Container(
      child: const Center(
        child: Text("search"),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 0.01,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          // height: kBottomNavigationBarHeight * 0.1,
          child: Container(
            decoration: const BoxDecoration(
                color: AppColors.white,
                border: Border(
                    top: BorderSide(color: AppColors.grey, width: 0.05))),
            child: Obx(
              () => BottomNavigationBar(
                currentIndex: MainController.to.pageIndex,
                type: BottomNavigationBarType.fixed,
                unselectedItemColor: AppColors.grey,
                elevation: 25,
                selectedItemColor: AppColors.primary,
                showUnselectedLabels: false,
                showSelectedLabels: true,
                selectedLabelStyle: const TextStyle(fontFamily: "Oswald"),
                selectedIconTheme:
                    const IconThemeData(color: AppColors.primary),
                unselectedIconTheme: const IconThemeData(color: AppColors.grey),
                onTap: (data) {
                  MainController.to.pageIndex = data;
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: "Profile"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.list_alt_outlined), label: "Categories"),
                  BottomNavigationBarItem(
                      icon: Icon(null), activeIcon: null, label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.add_shopping_cart), label: "Cart"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search), label: "Search"),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          hoverElevation: 10.0,
          backgroundColor: AppColors.primary,
          splashColor: AppColors.grey,
          tooltip: "Home",
          elevation: 4,
          child: const Icon(Icons.home),
          onPressed: () {
            MainController.to.pageIndex = 2;
          },
        ),
      ),
      body: Obx(() => pages[MainController.to.pageIndex]),
    );
  }
}
