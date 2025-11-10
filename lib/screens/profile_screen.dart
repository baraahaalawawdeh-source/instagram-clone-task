import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/BottomNavBarWidget.dart';
import 'profile_menu_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const basePath = 'assets/images/';
    const iconsPath = 'assets/icons/';
    const double tabWidth = 186.0;
    const double tabHeight = 44.0;
    const double iconSize = 22.5;
    const double underlineWidth = 186.0;
    const double underlineHeight = 1.0;
    const double gapBetweenTabAndUnderline = 3.0;

    final double screenWidth = MediaQuery.of(context).size.width;
    final double totalTabsWidth = tabWidth * 2;
    final double leftOffset = (screenWidth - totalTabsWidth) / 2;
    final double underlineLeft = leftOffset + (tabWidth - underlineWidth) / 2;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          '${iconsPath}private_icon.svg',
                          width: 14,
                        ),
                        const SizedBox(width: 6),
                        const Text(
                          'jacob_w',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.5,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 22,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () => ProfileMenuScreen.openFromRight(context),
                        child: SvgPicture.asset(
                          '${iconsPath}menu_icon.svg',
                          width: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Container(
                      width: 88,
                      height: 88,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1.5,
                        ),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          '${basePath}profiles/my_profile.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 26),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          _InfoItem(label: 'Posts', value: '54'),
                          _InfoItem(label: 'Followers', value: '834'),
                          _InfoItem(label: 'Following', value: '162'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jacob West',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Text(
                            'Digital goodies designer ',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            '@pixsellz',
                            style: TextStyle(fontSize: 14, color: Colors.blue),
                          ),
                        ],
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Everything is designed.',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: double.infinity,
                  height: 32,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey.shade300, width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.zero,
                    ),
                    child: const Text(
                      'Edit Profile',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(left: 16),
                  children: [
                    _buildHighlightItem('New', isAdd: true),
                    _buildHighlightItem(
                      'Friends',
                      image: '${basePath}highlight/Friends.png',
                    ),
                    _buildHighlightItem(
                      'Sport',
                      image: '${basePath}highlight/Sport.png',
                    ),
                    _buildHighlightItem(
                      'Design',
                      image: '${basePath}highlight/Design.png',
                    ),
                  ],
                ),
              ),

              const Divider(height: 1, thickness: 1, color: Color(0xFFDBDBDB)),
              SizedBox(
                height: tabHeight,
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: tabWidth,
                        height: tabHeight,
                        child: GestureDetector(
                          onTap: () {},
                          child: Center(
                            child: SvgPicture.asset(
                              '${iconsPath}Grid_Tab.svg',
                              width: iconSize,
                              height: iconSize,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        width: tabWidth,
                        height: tabHeight,
                        child: GestureDetector(
                          onTap: () {},
                          child: Center(
                            child: SvgPicture.asset(
                              '${iconsPath}tags_icon.svg',
                              width: iconSize,
                              height: iconSize,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: gapBetweenTabAndUnderline),
              SizedBox(
                height: underlineHeight,
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned(
                      left: underlineLeft,
                      child: Container(
                        width: underlineWidth,
                        height: underlineHeight,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final imagePath =
                      '${basePath}profile_posts/profile_post${index + 1}.png';
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(imagePath, fit: BoxFit.cover),
                      if (index == 4)
                        Positioned(
                          right: 6,
                          top: 6,
                          child: SvgPicture.asset(
                            '${iconsPath}Video_Icon.svg',
                            width: 18,
                          ),
                        ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBarWidget(),
    );
  }

  static Widget _buildHighlightItem(
    String label, {
    String? image,
    bool isAdd = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade300, width: 1.2),
            ),
            child: Center(
              child: isAdd
                  ? const Icon(Icons.add, size: 28, color: Colors.black)
                  : ClipOval(child: Image.asset(image!, fit: BoxFit.cover)),
            ),
          ),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final String label;
  final String value;
  const _InfoItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 2),
        Text(label, style: TextStyle(fontSize: 13.5, color: Colors.grey[800])),
      ],
    );
  }
}
