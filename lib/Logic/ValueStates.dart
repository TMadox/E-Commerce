import 'package:get/get.dart';

class States extends GetxController {
  bool loadingstate = false;
  bool adminuser = false;
  int selectedtapindex = 0;
  List<String> selecteditems = [];
  bool deleteselected = false;
  int categoryindex = 0;
  bool alwayssigned = false;
  void changeusertype() {
    adminuser = !adminuser;
    update();
  }

  void changeloadingstate() {
    loadingstate = !loadingstate;
    update();
  }

  void changetabiconcolor(int index) {
    selectedtapindex = index;
    update();
  }

  void addtoselecteditems(String name) {
    selecteditems.add(name);
    update();
  }

  void removefromselecteditems(String name) {
    selecteditems.remove(name);
    update();
  }

  void checkselecteditems() {
    if (selecteditems.isEmpty) {
      deleteselected = false;
      update();
    } else {
      deleteselected = true;
      update();
    }
  }

  void clearselecteditemslist() {
    selecteditems.clear();
    update();
  }

  void changecategoryindex(int index) {
    categoryindex = index;
    update();
  }

  void changealwayssignedstate() {
    alwayssigned = !alwayssigned;
    update();
  }
}
