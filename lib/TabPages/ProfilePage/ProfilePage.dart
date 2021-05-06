import 'package:e_commerce/Widgets/ColorsNConstants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';

class ProfilePage extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var listView = ListView(
      children: [
        ListTile(
          leading: Icon(Icons.person),
          title: Text("Display name"),
          subtitle: Text("Mohamed Mamdoh"),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text("Display name"),
          subtitle: Text("Mohamed Mamdoh"),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.person),
            title: Text("Display name"),
            subtitle: Text("Mohamed Mamdoh"),
          ),
        )
      ],
    );
    return Container(
      padding: EdgeInsets.only(top: height * 0.02),
      child: Column(
        children: [
          Expanded(
              child: SettingsList(
            backgroundColor: Colors.white,
            sections: [
              SettingsSection(
                title: 'Profile info',
                tiles: [
                  SettingsTile(
                    title: 'Name',
                    subtitle: 'Mohamed Mamdoh',
                    leading: Icon(Icons.person),
                    onPressed: (BuildContext context) {},
                  ),
                  SettingsTile(
                    title: 'Email',
                    subtitle: 'mamdohahmed33@yahoo.com',
                    leading: Icon(Icons.mail),
                    onPressed: (BuildContext context) {},
                  ),
                  SettingsTile(
                    title: 'Phone',
                    subtitle: '01061715164',
                    leading: Icon(
                      Icons.phone,
                    ),
                    onPressed: (BuildContext context) {},
                  ),
                  SettingsTile(
                    title: 'Language',
                    subtitle: 'English',
                    leading: Icon(Icons.language),
                    onPressed: (BuildContext context) {},
                  ),
                ],
              ),
            ],
          )),
          ElevatedButton.icon(
              onPressed: () {
                auth.signOut();
                Get.offAllNamed('/loginpage/');
              },
              icon: Icon(Icons.logout),
              label: Text("Logout"))
        ],
      ),
    );
  }
}
