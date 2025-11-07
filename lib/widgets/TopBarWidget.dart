import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 15, 12, 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            'assets/icons/camera_icon.svg',
            width: 20.5,
            height: 19,
          ),
          SizedBox(
            height: 28,
            child: Center(
              child: Image.asset(
                'assets/icons/insta_text_logo.png',
                height: 20,
                errorBuilder: (_, __, ___) => const SizedBox(width: 120),
              ),
            ),
          ),
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/live_icon.svg',
                width: 24,
                height: 24.57,
              ),
              const SizedBox(width: 12),
              SvgPicture.asset(
                'assets/icons/messanger_icon.svg',
                width: 22.73,
                height: 19.75,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
