// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // قصص المستخدمين
  final List<Map<String, String>> stories = const [
    {"name": "Your Story", "image": "https://picsum.photos/id/1005/200/200"},
    {"name": "karennne", "image": "https://picsum.photos/id/1011/200/200"},
    {"name": "zackjohn", "image": "https://picsum.photos/id/1012/200/200"},
    {"name": "kieron_d", "image": "https://picsum.photos/id/1013/200/200"},
    {"name": "craig", "image": "https://picsum.photos/id/1016/200/200"},
  ];

  // المنشورات
  final List<Map<String, dynamic>> posts = const [
    {
      "username": "joshua_l",
      "location": "Tokyo, Japan",
      "profileImage": "https://picsum.photos/id/1045/800/600",
      "images": [
        "https://images.unsplash.com/photo-1506744038136-46273834b3fb",
        "https://picsum.photos/id/1035/800/600",
        "https://picsum.photos/id/1045/800/600",
      ],
      "caption":
          "The game in Japan was amazing and I want to share some photos",
      "date": "September 19",
      "verified": true,
    },
    {
      "username": "joshua_l",
      "location": "Tokyo, Japan",
      "profileImage": "https://picsum.photos/id/1045/800/600",
      "images": [
        "https://images.unsplash.com/photo-1487412720507-e7ab37603c6f",
        "https://picsum.photos/id/1065/800/600",
        "https://picsum.photos/id/1075/800/600",
      ],
      "caption": "London vibes only ☕🌧️",
      "date": "September 19",
      "verified": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const _TopBar(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  SizedBox(
                    height: 110,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      scrollDirection: Axis.horizontal,
                      itemCount: stories.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        final s = stories[index];
                        return StoryItem(
                          name: s['name']!,
                          imageUrl: s['image']!,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...posts.map(
                    (p) => Column(
                      children: [
                        PostItem(
                          username: p['username'] ?? '',
                          location: p['location'] ?? '',
                          profileImage: p['profileImage'] ?? '',
                          images: List<String>.from(p['images'] ?? []),
                          caption: p['caption'] ?? '',
                          date: p['date'] ?? '',
                          verified: p['verified'] ?? false,
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const _BottomNavBar(),
          ],
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.camera_alt_outlined),
          ),
          const Expanded(
            child: Center(
              child: Text(
                "Instagram",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.live_tv_outlined),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.send_outlined)),
        ],
      ),
    );
  }
}

class StoryItem extends StatelessWidget {
  final String name;
  final String imageUrl;

  const StoryItem({required this.name, required this.imageUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 72,
          height: 72,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Color(0xFFDE0046), Color(0xFFF7A34B)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.all(3),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(2),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(imageUrl),
            ),
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          width: 72,
          child: Text(
            name,
            style: const TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class PostItem extends StatefulWidget {
  final String username;
  final String location;
  final String profileImage;
  final List<String> images;
  final String caption;
  final String date;
  final bool verified;

  const PostItem({
    required this.username,
    required this.location,
    required this.profileImage,
    required this.images,
    required this.caption,
    required this.date,
    required this.verified,
    super.key,
  });

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  int _currentPage = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🔹 رأس البوست
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(widget.profileImage),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.username,
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                        if (widget.verified)
                          const Padding(
                            padding: EdgeInsets.only(left: 4),
                            child: Icon(
                              Icons.verified,
                              color: Colors.blue,
                              size: 16,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      widget.location,
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
            ],
          ),
        ),

        // 🔹 الصور (PageView)
        AspectRatio(
          aspectRatio: 4 / 3,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              PageView.builder(
                controller: _pageController,
                onPageChanged: (index) => setState(() => _currentPage = index),
                itemCount: widget.images.length,
                itemBuilder: (_, index) => Image.network(
                  widget.images[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              // 🔹 النقاط السفلية
              Positioned(
                bottom: 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    widget.images.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPage == index
                            ? Colors.white
                            : Colors.white54,
                      ),
                    ),
                  ),
                ),
              ),
              // 🔹 العداد العلوي (1/3)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '${_currentPage + 1}/${widget.images.length}',
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),

        // 🔹 أزرار التفاعل
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.mode_comment_outlined),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.send_outlined),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.bookmark_outline),
              ),
            ],
          ),
        ),

        // 🔹 نصوص البوست
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            "Liked by craig_love and 44,686 others",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.grey[900]),
              children: [
                TextSpan(
                  text: "${widget.username} ",
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                TextSpan(text: widget.caption),
              ],
            ),
          ),
        ),
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            widget.date,
            style: TextStyle(color: Colors.grey[500], fontSize: 12),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey[300]!)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.home_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 1.2, color: Colors.grey[400]!),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add, size: 20),
            ),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
            child: const CircleAvatar(
              radius: 14,
              backgroundImage: NetworkImage(
                'https://picsum.photos/id/1005/200/200',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
