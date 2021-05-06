import 'package:e_commerce/TabPages/CartPage/CartPage.dart';
import 'package:e_commerce/Widgets/ColorsNConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'Logic/ValueStates.dart';
import 'Logic/TabController.dart';
import 'TabPages/FavouritesPage/FavouritesPage.dart';
import 'TabPages/MenuPage/MenuPage.dart';
import 'TabPages/ProfilePage/ProfilePage.dart';

// ignore: must_be_immutable
class UserPage extends HookWidget {
  final States statecontroller = Get.put(States());
  final MyTabController _tabcontroller = Get.put(MyTabController());
  int currenttabindex;
  final GlobalKey<NavigatorState> navkey = new GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    _tabcontroller.controller.addListener(() {
      statecontroller.changetabiconcolor(_tabcontroller.controller.index);
    });
    return DefaultTabController(
      length: 4,
      child: GetBuilder<States>(
        builder: (getcontroller) => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            bottom: TabBar(
              controller: _tabcontroller.controller,
              indicatorColor: ember,
              unselectedLabelColor: Colors.white,
              labelColor: ember,
              tabs: [
                Tab(
                  text: "Menu",
                  icon: Icon(Icons.menu_book,
                      color: getcontroller.selectedtapindex == 0
                          ? ember
                          : Colors.white),
                ),
                Tab(
                  text: "Cart",
                  icon: Icon(Icons.shopping_bag,
                      color: getcontroller.selectedtapindex == 1
                          ? ember
                          : Colors.white),
                ),
                Tab(
                  text: "Favourites",
                  icon: Icon(Icons.favorite,
                      color: getcontroller.selectedtapindex == 2
                          ? ember
                          : Colors.white),
                ),
                Tab(
                  text: "Profile",
                  icon: Icon(Icons.person,
                      color: getcontroller.selectedtapindex == 3
                          ? ember
                          : Colors.white),
                )
              ],
            ),
            backgroundColor: violet,
            title: Text("Best-B"),
          ),
          body: TabBarView(controller: _tabcontroller.controller, children: [
            MenuPage(),
            CartPage(),
            FavouritesPage(),
            ProfilePage()
          ]),
        ),
      ),
    );
  }
}
