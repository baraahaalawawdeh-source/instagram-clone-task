import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StoryItemWidget extends StatelessWidget {
  final String name;
  final String imageUrl;
  final bool showLiveIcon;

  const StoryItemWidget({
    required this.name,
    required this.imageUrl,
    this.showLiveIcon = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: 68,
                height: 68,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: showLiveIcon
                      ? const LinearGradient(
                          colors: [Color(0xFF7F00FF), Color(0xFFFF007F)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : const LinearGradient(
                          colors: [Color(0xFFDE0046), Color(0xFFF7A34B)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                ),
                padding: const EdgeInsets.all(2),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(2),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage(imageUrl),
                  ),
                ),
              ),
              if (showLiveIcon)
                Positioned(
                  bottom: -2,
                  child: SvgPicture.asset(
                    'assets/icons/livestream_icon.svg',
                    width: 28,
                    height: 16,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: 70,
            child: Text(
              name,
              style: const TextStyle(fontSize: 11),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
