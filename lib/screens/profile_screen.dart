// lib/screens/profile_screen.dart
import 'package:flutter/material.dart';
import 'profile_menu_screen.dart';
import 'home_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  final List<String> sampleImages = const [
    'https://picsum.photos/id/1011/800/800',
    'https://picsum.photos/id/1012/800/800',
    'https://picsum.photos/id/1013/800/800',
    'https://picsum.photos/id/1015/800/800',
    'https://picsum.photos/id/1016/800/800',
    'https://picsum.photos/id/1020/800/800',
    'https://picsum.photos/id/1024/800/800',
    'https://picsum.photos/id/1025/800/800',
    'https://picsum.photos/id/1035/800/800',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'jacob_w',
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 6),
              Icon(Icons.keyboard_arrow_down, color: Colors.black54, size: 20),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.black87),
              onPressed: () => ProfileMenuScreen.openFromRight(context),
            ),
            const SizedBox(width: 6),
          ],
          leading: const SizedBox.shrink(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [_buildProfileHeader(context), _buildTabSection()],
          ),
        ),
        bottomNavigationBar: _buildBottomNavBar(context),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 86,
                height: 86,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade300, width: 3),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://picsum.photos/id/1005/800/800',
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStat('9', 'Posts'),
                    _buildStat('834', 'Followers'),
                    _buildStat('162', 'Following'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Jacob West',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 2),
                Text.rich(
                  TextSpan(
                    style: TextStyle(color: Colors.black87),
                    children: [
                      TextSpan(text: 'Digital goodies designer '),
                      TextSpan(
                        text: '@pixsellz',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Everything is designed.',
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                side: BorderSide(color: Colors.grey.shade300),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: const Text(
                'Edit Profile',
                style: TextStyle(color: Colors.black87),
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 96,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildStoryCircle('New', add: true),
                _buildStoryCircle('Friends', imageUrl: sampleImages[3]),
                _buildStoryCircle('Sport', imageUrl: sampleImages[2]),
                _buildStoryCircle('Design', imageUrl: sampleImages[0]),
                const SizedBox(width: 8),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildTabSection() {
    return Column(
      children: [
        const TabBar(
          indicatorColor: Colors.black87,
          tabs: [
            Tab(icon: Icon(Icons.grid_on, color: Colors.black87)),
            Tab(icon: Icon(Icons.person_pin_outlined, color: Colors.black87)),
          ],
        ),
        SizedBox(
          height: 520,
          child: TabBarView(children: [_buildGrid(), _buildTagged()]),
        ),
      ],
    );
  }

  Widget _buildGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 6),
      child: GridView.builder(
        itemCount: sampleImages.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
        ),
        itemBuilder: (context, index) {
          return Image.network(sampleImages[index], fit: BoxFit.cover);
        },
      ),
    );
  }

  Widget _buildTagged() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 6),
      child: GridView.builder(
        itemCount: sampleImages.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
        ),
        itemBuilder: (context, index) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                sampleImages[(index + 3) % sampleImages.length],
                fit: BoxFit.cover,
              ),
              if (index % 4 == 0)
                const Positioned(
                  right: 4,
                  top: 4,
                  child: Icon(Icons.videocam, size: 18, color: Colors.white),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildStat(String number, String label) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.black54, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildStoryCircle(String label, {String? imageUrl, bool add = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Column(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade300, width: 2),
              image: imageUrl != null
                  ? DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: imageUrl == null && add
                ? const Icon(Icons.add, size: 28, color: Colors.black54)
                : null,
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: 72,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 4,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (index) {
        if (index == 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        }
      },
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: '',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.search_outlined),
          label: '',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.add_box_outlined),
          label: '',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade300, width: 1.5),
              image: const DecorationImage(
                image: NetworkImage('https://picsum.photos/id/1005/800/800'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          label: '',
        ),
      ],
    );
  }
}
