import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo_dashboard/current_item_details.dart';
import 'package:demo_dashboard/database_handler.dart';
import 'package:demo_dashboard/screen_configs.dart';
import 'package:flutter/material.dart';

import 'helper_widgets.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int carouselIndex = 0;
  List<IconData> itemsInShop = [
    Icons.bike_scooter,
    Icons.car_rental,
    Icons.motorcycle,
    Icons.train,
    Icons.mobile_friendly,
    Icons.card_membership
  ];
  List<String> itemsInShopNames = [
    "Icons.bike_scooter",
    "Icons.car_rental",
    "Icons.motorcycle",
    "Icons.train",
    "Icons.mobile_friendly",
    "Icons.card_membership"
  ];

  @override
  Widget build(BuildContext context) {
    _carouselItem(IconData item, Color color) {
      return Container(
        width: ScreenConfig.screenSizeWidth * 0.9,
        child: Icon(item),
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
      );
    }

    gridItem(IconData item, String itemInShopName, Color color) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CurrentItemDetail(
                      icon: item,
                      iconName: itemInShopName,
                      description: "Icon Desc",
                    )),
          );
        },
        child: Container(
          width: ScreenConfig.screenSizeWidth * 0.4,
          child: Icon(item),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(8)),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(Storage.getValue("CurrentLoggedInEmail")),
      ),
      body: SizedBox(
          width: ScreenConfig.screenSizeWidth,
          child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                heightGap(0.1),
                CarouselSlider(
                  items: [
                    _carouselItem(Icons.ac_unit_outlined, Colors.yellow),
                    _carouselItem(Icons.track_changes, Colors.green),
                    _carouselItem(Icons.traffic_rounded, Colors.purple),
                  ],
                  options: CarouselOptions(
                      autoPlay: true,
                      height: ScreenConfig.screenSizeHeight * 0.51,
                      viewportFraction: 1,
                      onPageChanged: (val, reason) {
                        setState(() {
                          carouselIndex = val;
                        });
                      }),
                ),
                heightGap(0.1),
                SizedBox(
                  width: ScreenConfig.screenSizeWidth * 0.9,
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                      ),
                      itemCount: itemsInShop.length,
                      itemBuilder: (BuildContext context, int index) {
                        return gridItem(itemsInShop[index],
                            itemsInShopNames[index], Colors.pink);
                      }),
                ),
                heightGap(0.1),
              ]))),
      bottomNavigationBar:
          BottomNavigationBar(selectedItemColor: Colors.amber, items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.dashboard), label: "Dashboard"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
      ]),
    );
  }
}
