import 'package:flutter/material.dart';
import 'package:bookwalay/wiget/slider_carousel.dart';
import 'package:bookwalay/model/card_model.dart';
import 'package:bookwalay/wiget/custom_circular_progess.dart';
import 'package:bookwalay/service/card_service.dart';
import 'package:bookwalay/wiget/book_by_exam_category.dart';
import 'package:bookwalay/wiget/navigation_bar_bottom.dart';


class HomeActivity extends StatelessWidget {
  const HomeActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bookwalay'),
        ),
        body: FutureBuilder(
        future: getData(),
        builder:
            (BuildContext context, AsyncSnapshot<List<CardModel>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CustomCircularProgressWidget(),
            );
          } else {
            return ListView(
              shrinkWrap: true,
              children: const [
                SliderCarousel(),
                BookExamCategory()
              ],
            );
          }
        },
      ),
      bottomNavigationBar: const NavigationBarButtom(),
      ),
    );
  }
}