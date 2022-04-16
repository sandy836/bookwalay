import 'package:bookwalay/const.dart';
import 'package:bookwalay/wiget/image_container.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SliderCarousel extends StatelessWidget {
  const SliderCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        ImageContainer(
          imagesName: 'carousel_slider_1.jpg',
          baseImageDir: baseImageDir,
        ),
        ImageContainer(
          imagesName: 'carousel_slider_2.jpg',
          baseImageDir: baseImageDir,
        ),
        ImageContainer(
          imagesName: 'carousel_slider_3.jpg',
          baseImageDir: baseImageDir,
        ),
        ImageContainer(
          imagesName: 'carousel_slider_4.jpg',
          baseImageDir: baseImageDir,
        ),
        ImageContainer(
          imagesName: 'carousel_slider_5.jpg',
          baseImageDir: baseImageDir,
        ),
      ],
      options: CarouselOptions(
          height: 200,
          autoPlay: true,
          autoPlayCurve: Curves.easeIn,
          reverse: true,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
          viewportFraction: 0.85),
    );
  }
}