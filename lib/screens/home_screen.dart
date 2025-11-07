import 'package:flutter/material.dart';
import '../widgets/TopBarWidget.dart';
import '../widgets/StoryItemWidget.dart';
import '../widgets/PostItemWidget.dart';
import '../widgets/BottomNavBarWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> stories = [
    {"name": "Your Story", "image": "assets/images/stories/story1.png"},
    {"name": "karennne", "image": "assets/images/stories/story2.png"},
    {"name": "zackjohn", "image": "assets/images/stories/story3.png"},
    {"name": "kieron_d", "image": "assets/images/stories/story4.png"},
    {"name": "craig", "image": "assets/images/stories/story5.png"},
  ];

  final List<Map<String, dynamic>> posts = [
    {
      "username": "joshua_l",
      "location": "Tokyo, Japan",
      "profileImage": "assets/images/profiles/poster1.png",
      "images": [
        "assets/images/posts/post1.png",
        "assets/images/posts/post1.png",
        "assets/images/posts/post1.png",
      ], // ← 3 صور لتفعيل العداد والـ dots
      "caption":
          "The game in Japan was amazing and I want to share some photos",
      "date": "September 19",
      "verified": true,
      "likedBy": "assets/images/profiles/liker1.png",
      "fakeTotal": 3,
    },
    {
      "username": "joshua_l",
      "location": "Tokyo, Japan",
      "profileImage": "assets/images/profiles/poster1.png",
      "images": [
        "assets/images/posts/post2.png",
        "assets/images/posts/post2.png",
        "assets/images/posts/post2.png",
      ], // ← 3 صور لتفعيل العداد والـ dots
      "caption":
          "The game in Japan was amazing and I want to share some photos",
      "date": "September 19",
      "verified": true,
      "likedBy": "assets/images/profiles/liker1.png",
      "fakeTotal": 3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const TopBarWidget(),

            // STORIES
            SizedBox(
              height: 98,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: stories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final s = stories[index];
                  return StoryItemWidget(
                    name: s['name']!,
                    imageUrl: s['image']!,
                    showLiveIcon: index == 1,
                  );
                },
              ),
            ),

            const Divider(color: Color(0xFFDBDBDB), thickness: 0.3, height: 0),

            // POSTS
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 0, bottom: 8),
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final p = posts[index];
                  return PostItemWidget(
                    username: p['username'],
                    location: p['location'],
                    profileImage: p['profileImage'],
                    images: List<String>.from(p['images']),
                    caption: p['caption'],
                    date: p['date'],
                    verified: p['verified'],
                    likedBy: p['likedBy'],
                    fakeTotal: p['fakeTotal'],
                  );
                },
              ),
            ),

            const BottomNavBarWidget(),
          ],
        ),
      ),
    );
  }
}
