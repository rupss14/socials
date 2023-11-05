import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // User's profile picture
            Container(
              margin: EdgeInsets.all(16),
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/profile_image.jpg'), // Replace with user's profile picture URL
              ),
            ),
            // User's username
            Text(
              'Rupali',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            // User's bio
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Photography enthusiast 📸 | Nature lover 🌿 | Explorer 🌍',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            // Follow button or other user actions
            ElevatedButton(
              onPressed: () {
                // Implement the logic for following/unfollowing the user
              },
              child: Text('Follow'),
            ),
            // User's posts, followers, and following counts
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      'Posts',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('123'),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Followers',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('1,234'),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Following',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('567'),
                  ],
                ),
              ],
            ),
            // User's posts (a scrollable list of posts)
            // Replace this with your post list or feed
            Container(
              height: 200, // Adjust the height as needed
              child: ListView.builder(
                itemCount: 5, // Replace with the actual number of posts
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text('Post $index'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
