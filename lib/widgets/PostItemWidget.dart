import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostItemWidget extends StatefulWidget {
  final String username;
  final String location;
  final String profileImage;
  final List<String> images;
  final String caption;
  final String date;
  final bool verified;
  final String likedBy;
  final int? fakeTotal;

  const PostItemWidget({
    required this.username,
    required this.location,
    required this.profileImage,
    required this.images,
    required this.caption,
    required this.date,
    required this.verified,
    required this.likedBy,
    this.fakeTotal,
    super.key,
  });

  @override
  State<PostItemWidget> createState() => _PostItemWidgetState();
}

class _PostItemWidgetState extends State<PostItemWidget> {
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

  int get totalCount => widget.fakeTotal ?? widget.images.length;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // HEADER
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage(widget.profileImage),
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
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
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
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/more_icon.svg',
                  width: 14,
                  height: 3,
                ),
              ),
            ],
          ),
        ),

        // IMAGE AREA
        AspectRatio(
          aspectRatio: 1,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemCount: widget.images.length,
            itemBuilder: (_, index) => Image.asset(
              widget.images[index],
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ),

        // ACTION ICONS + DOTS
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // LEFT ICONS
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/favorite.svg',
                    width: 23.66,
                    height: 20.58,
                  ),
                  const SizedBox(width: 14),
                  SvgPicture.asset(
                    'assets/icons/comment_icon.svg',
                    width: 22,
                    height: 22.08,
                  ),
                  const SizedBox(width: 14),
                  SvgPicture.asset(
                    'assets/icons/messanger_icon.svg',
                    width: 22.73,
                    height: 19.75,
                  ),
                ],
              ),

              // DOTS
              Expanded(
                child: Transform.translate(
                  offset: const Offset(-24, 0), // -10 لتحريك يسار، +10 يمين
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      totalCount,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPage == index
                              ? const Color(0xFF2E8BFF)
                              : Colors.grey[350],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // SAVE ICON
              SvgPicture.asset(
                'assets/icons/save_icon.svg',
                width: 20.5,
                height: 23.15,
              ),
            ],
          ),
        ),

        // LIKES
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            children: [
              CircleAvatar(
                radius: 8.5,
                backgroundImage: AssetImage(widget.likedBy),
              ),
              const SizedBox(width: 8),
              RichText(
                text: const TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 12),
                  children: [
                    TextSpan(text: "Liked by "),
                    TextSpan(
                      text: "craig_love",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: " and"),
                    TextSpan(
                      text: " 44,686 others",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 6),

        // CAPTION
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black, fontSize: 12),
              children: [
                TextSpan(
                  text: '${widget.username} ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: widget.caption),
              ],
            ),
          ),
        ),

        const SizedBox(height: 6),

        // DATE
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            widget.date,
            style: TextStyle(color: Colors.grey[500], fontSize: 11),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
