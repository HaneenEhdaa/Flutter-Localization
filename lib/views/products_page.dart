import 'package:easy_localization/easy_localization.dart';
import 'package:shopping_app/views/grid_card.dart';
import 'package:shopping_app/views/horizontalCards.dart';
import 'package:flutter/material.dart';

class MyProductCard extends StatefulWidget {
  const MyProductCard({super.key});

  @override
  State<MyProductCard> createState() => _MyProductCardState();
}

class _MyProductCardState extends State<MyProductCard> {
  List<Map<String, String>> gridItems = [
    {"image": "assets/images/Bag1.jpg", "name": "Product 1"},
    {"image": "assets/images/Bag3.jpg", "name": "Product 2"},
    {"image": "assets/images/Bag7.jpg", "name": "Product 3"},
    {"image": "assets/images/Bag2.jpg", "name": "Product 4"},
    {"image": "assets/images/img4.jpg", "name": "Product 5"},
    {"image": "assets/images/img2.jpg", "name": "Product 6"},
    {"image": "assets/images/Bag6.jpg", "name": "Product 7"},
  ];

  List<Map<String, String>> hotOffers = [
    {"image": "assets/images/Bag4.jpg", "name": "Product 1"},
    {"image": "assets/images/Bag5.jpg", "name": "Product 2"},
    {"image": "assets/images/img1.jpg", "name": "Product 3"},
    {"image": "assets/images/img3.jpg", "name": "Product 4"},
    {"image": "assets/images/Bag8.jpg", "name": "Product 5"},
    {"image": "assets/images/img5.jpg", "name": "Product 6"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            tr("app bar"),
            style: TextStyle(
                color: Color(0xFF954535),
                fontSize: 25,
                fontWeight: FontWeight.w200),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          actions: [
            ElevatedButton(
                onPressed: () {
                  changeLang(context);
                },
                child: Text(tr("translation button")))
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                tr("section1 title"),
                style: TextStyle(
                    color: Color(0xFF954535),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              _listProduct(context),
              Text(
                tr("section1 title2"),
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 42, 0),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              _listOffers(context),
            ],
          ),
        ));
  }

  Widget _listProduct(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: gridItems.length,
          itemBuilder: (BuildContext context, int index) {
            return ProductCard(
              productImage: gridItems[index]["image"]!,
              productName: tr(gridItems[index]["name"]!),
            );
          },
        ),
      ),
    );
  }


  Widget _listOffers(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.5,
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 10.0, right: 10, bottom: 50),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: hotOffers.length,
          itemBuilder: (context, index) {
            return hotOffersCard(
              productImage: hotOffers[index]["image"]!,
              productName: tr(hotOffers[index]["name"]!),
            );
          },
        ),
      ),
    );
  }


  
  void changeLang(BuildContext context) {
  final locale = EasyLocalization.of(context)?.locale;
  if (locale == const Locale('en', 'US')) {
    context.setLocale(const Locale('ar', 'EG')).then((_) {
      setState(() {}); // Force UI rebuild
    });
  } else {
    context.setLocale(const Locale('en', 'US')).then((_) {
      setState(() {}); // Force UI rebuild
    });
  }
}

}
