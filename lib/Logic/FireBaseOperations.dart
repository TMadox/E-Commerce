import 'package:e_commerce/Models/ItemInfo.dart';
import 'package:e_commerce/Widgets/ColorsNConstants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod/riverpod.dart';
import '../Widgets/ColorsNConstants.dart';

class Authentication {
  final auth = FirebaseAuth.instance;
  Future signup(String email, String password) async {
    final result = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return result;
  }

  Future adminsignup(String email, String password, String name) async {
    final result = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    result.user.updateProfile(displayName: "ADMIN");
    return result;
  }

  Future login(String email, String password) async {
    final result = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result;
  }
}

//##############################################################################################################

class FirestoreOperations {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  void addproduct(ItemInfo item) {
    _firestore.collection(itemcollection).add({
      itemname: item.name,
      itemcategory: item.category,
      itemdescription: item.description,
      itemprice: item.price,
      itemimagelocation: item.imagelocation
    });
  }

  void deleteproduct(List<String> ids) {
    ids.forEach((element) {
      _firestore.collection(itemcollection).doc(element).delete();
    });
  }

  void addfavourite(String id) {
    var doc = _firestore.collection(itemcollection).doc(id);
    doc.get().then((value) => _firestore
        .collection(favouritescollection)
        .doc(auth.currentUser.uid)
        .collection("My Favourites")
        .add(value.data()));
  }
}



final favouritesstream = StreamProvider<QuerySnapshot>((ref) {
  final auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance
      .collection(favouritescollection)
      .doc(auth.currentUser.uid)
      .collection(myfavourites);
  return users.snapshots();
});

final firebasestream = StreamProvider<QuerySnapshot>((ref) {
  CollectionReference users =
      FirebaseFirestore.instance.collection(itemcollection);
  return users.snapshots();
});
