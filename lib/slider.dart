import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> imagePaths = [
      'assets/image-10.png',
      'assets/image-11.png',
      'assets/image-12.png',
      'assets/image-13.png',
      'assets/image-14.png',
    ];

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 400.0,
              autoPlayInterval: Duration(seconds: 2),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: imagePaths.map((String imagePath) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(color: Colors.amber),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              );
            }).toList(),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imagePaths.map((String path) {
              int index = imagePaths.indexOf(path);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index ? Colors.white : Colors.grey,
                  border: Border.all(
                    color: Colors.white,
                    width: 1.0,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
