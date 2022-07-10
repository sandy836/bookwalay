import 'package:animations/animations.dart';
import 'package:bookwalay/model/card_model.dart';
import 'package:bookwalay/model/fake_data_model.dart';
import 'package:bookwalay/wiget/custom_circular_progess.dart';
import 'package:bookwalay/service/card_service.dart';
import 'package:bookwalay/wiget/navigation_bar_bottom.dart';
import 'package:bookwalay/wiget/generic_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bookwalay/wiget/product/product_detail.dart';

// ignore: must_be_immutable
class GenericGridView extends StatefulWidget {
  const GenericGridView({Key? key}) : super(key: key);

  @override
  _GenericGridViewState createState() => _GenericGridViewState();
}

class _GenericGridViewState extends State<GenericGridView> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    ContainerTransitionType _transitionType = ContainerTransitionType.fade;
    var size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          title: const Text(
            "BookList",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: FutureBuilder(
        future: getData(),
        builder:
            (BuildContext context, AsyncSnapshot<List<CardModel>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CustomCircularProgressWidget());
          } else {
            return GridView.builder(
              padding: const EdgeInsets.only(top: 5.0),
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
                childAspectRatio: (itemWidth / itemHeight),
                crossAxisCount: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                var fakeDate = Fake().fakeData();
                return OpenContainer(
                  tappable: false,
                  transitionType: _transitionType,
                  closedBuilder: (context, openContainer) {
                    return CardWidget(
                      httpResponseData: snapshot.data,
                      index: index,
                      openContainer: openContainer,
                      price: fakeDate[1],
                      productName: fakeDate[2],
                      rating: fakeDate[0],
                    );
                  },
                  openBuilder: (context, openContainer) => ProductDetail(
                    productName: fakeDate[2],
                    productPrice: fakeDate[1],
                    productRating: fakeDate[0],
                    productOffpercent: fakeDate[3],
                    index: index,
                    productUrl: snapshot.data![index].url,
                  ),
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar: const NavigationBarButtom(),
    );
  }
}