import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../screens/profile_screen.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey[300]!)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset('assets/icons/home.svg', width: 22),
          SvgPicture.asset('assets/icons/search.svg', width: 23.36),
          SvgPicture.asset('assets/icons/add.svg', width: 23.5),
          SvgPicture.asset('assets/icons/favorite.svg', width: 23.66),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProfileScreen()),
              );
            },
            child: const CircleAvatar(
              radius: 14,
              backgroundImage: AssetImage(
                'assets/images/profiles/my_profile.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
