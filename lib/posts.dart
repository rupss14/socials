import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String postId; // Unique identifier for the post
  final String userId; // User ID of the post creator
  final String userName; // Display name of the post creator
  final String userProfileImage; // URL to the user's profile picture
  final String content; // Text content of the post
  final List<String> imageUrls; // List of URLs for images or videos
  final DateTime timestamp; // Timestamp when the post was created

  Post({
    required this.postId,
    required this.userId,
    required this.userName,
    required this.userProfileImage,
    required this.content,
    required this.imageUrls,
    required this.timestamp,
  });
}



Future<List<Post>> fetchPosts() async {
  List<Post> posts = [];

  QuerySnapshot postSnapshot = await FirebaseFirestore.instance.collection('posts').get();

  for (QueryDocumentSnapshot postDoc in postSnapshot.docs) {
    Map<String, dynamic> postData = postDoc.data() as Map<String, dynamic>;

    Post post = Post(
      postId: postDoc.id,
      userId: postData['userId'],
      content: postData['content'],
      // Add more fields based on your Post data model
    );

    posts.add(post);
  }
  ListView.builder(
    itemCount: posts.length,
    itemBuilder: (context, index) {
      Post post = posts[index];
      return ListTile(
        title: Text(post.content),
// Add more widgets to display other post details
      );
    },
  );

  return posts;
}


// Reference to Firestore collection
CollectionReference postsCollection = FirebaseFirestore.instance.collection('posts');


Future<void> addNewPost(String userId, String content, List<String> imageUrls) async {
  await postsCollection.add({
    'userId': userId,           // User ID of the post creator
    'content': content,         // Text content of the post
    'imageUrls': imageUrls,     // List of image URLs
    'timestamp': FieldValue.serverTimestamp(), // Server timestamp
  });
}

Stream<QuerySnapshot> getAllPosts() {
  return postsCollection.snapshots();
}
Stream<QuerySnapshot> getPostsByUser(String userId) {
  return postsCollection.where('userId', isEqualTo: userId).snapshots();
}



