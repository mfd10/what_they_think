import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:what_they_think/models/post.dart';
class DatabaseService {
  final String? uid;

  DatabaseService({  this.uid});

 // final CollectionReference _postsCollection = FirebaseFirestore.instance
      //.collection("User");
  final CollectionReference _userCollection = FirebaseFirestore.instance
      .collection("User");
  final _posts = FirebaseFirestore.instance.collection("User").doc().collection('posts');

  //update post data
  Future updatePost(String title) async {
    return await _userCollection.doc(uid).set({
      'title': title
    });
  }
  Future getUser() async{
    return await _userCollection.doc(uid).get();
  }

  Future updateUserData(String username, String email) async {
    return await _userCollection.doc(uid).set({
      'username': username,
      'email': email
    });
  }
//convert snapshot to list

List<Post> _postList(QuerySnapshot snapshot){
    return snapshot.docs.map((post){
      return Post(
          title: post.get('title') ?? 'null'
      );
    }).toList();
}

Stream<List<Post>?> get getPosts{
    return _posts.snapshots().map(_postList);
}
/*
  void getData() {
    _userCollection.get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        _userCollection
            .doc(result.id)
            .collection("Post")
            .get()
            .then((querySnapshot) {
          querySnapshot.docs.map(_postList).toList();
        });
      });
    });
  }
*/
}