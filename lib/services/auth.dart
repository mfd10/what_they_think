import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:what_they_think/models/custom_user.dart';
import 'package:what_they_think/services/database.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;



  //convert Firebase user into custom user
  CustomUser? _customUser(User? user){
    return user !=null ?CustomUser(uid: user.uid, eMail: user.email) : null;
  }


  //sign in method
 Future<CustomUser?> signIn(String email, String password) async {
  try{
    UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    User? user = result.user;
    return _customUser(user);
  }catch(e){
  print(e.toString());
  return null;
  }
 }

 Future<String?> getUserId() async{
   String? uid= _auth.currentUser?.uid;
     return uid;
   }
 //sing out from the application
 signOut  () async{
   return await _auth.signOut();
 }

 Future<CustomUser?> registerUser(String name, String email, String password,) async{
 try{
   UserCredential result =await _auth.createUserWithEmailAndPassword(email: email, password: password);
   User? user=result.user;
   if(user !=null ){
     await DatabaseService(uid: user.uid).updatePost('title');
     await DatabaseService(uid: user.uid).updateUserData(name, email);
     return _customUser(user);
   }
 }catch(e){
   print(e.toString());
   return null;
 }
}

//check auth changes
Stream<CustomUser?> get customUser{
    return _auth.authStateChanges().map(_customUser);
}


}