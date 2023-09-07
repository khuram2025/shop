import 'package:flutter/material.dart';

class BannerCard extends StatefulWidget {
  const BannerCard({Key? key}) : super(key: key);

  @override
  _BannerCardState createState() => _BannerCardState();
}

class _BannerCardState extends State<BannerCard> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> images = [
    'https://via.placeholder.com/400x200?text=Image+1',
    'https://via.placeholder.com/400x200?text=Image+2',
    'https://via.placeholder.com/400x200?text=Image+3',
    'https://via.placeholder.com/400x200?text=Image+4',
    'https://via.placeholder.com/400x200?text=Image+5',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (value) {
              setState(() {
                _currentPage = value;
              });
            },
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Image.network(
                images[index],
                fit: BoxFit.cover,
                width: double.infinity,
              );
            },
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(images.length, (index) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 150),
                margin: EdgeInsets.symmetric(horizontal: 5),
                width: _currentPage == index ? 12 : 8,
                height: _currentPage == index ? 12 : 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index
                      ? Colors.blueAccent
                      : Colors.blueAccent.withOpacity(0.4),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
