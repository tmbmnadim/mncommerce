import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task1uidesign/profile_page.dart';
import 'package:task1uidesign/search_page.dart';

import 'cart_page.dart';
import 'order_page.dart';

void main() {
  runApp(const Homepage());
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController searchController = TextEditingController();
  int activeIndex = 0;
  List<String> catList = [
    "Tops",
    "Watch",
    "Girl's Clothing",
    "T-Shirts",
    "Handbags",
    "Cosmetics",
    "Casual Shoes",
    "Trending"
  ];
  Map<String, String> speacialOffer = {
    "Green Linen Top": "251.0\$-*--12%",
    "Rolex Watch": "2510.0\$-*--31%",
    "Premium Lather Skirt": "103.0\$-*--50%",
    "Cotton T-shirt": "99.9\$-*--21%",
    "Louis Vutton Lather Handbag": "3,499.0\$-*--15%",
    "Full Makeup set": "543.4\$-*--31%",
    "Jordan 403b": "343.4\$-*--60%",
    "Cotton Sleeve dress": "443.4\$-*--43%",
  };

  List<String> exclusiveList = [
    "Earbuds",
    "Watch",
    "Trousers",
    "T-Shirts",
  ];

  int _currentIndex = 0;
  List<String> navTitle = ["Home", "Search", "Cart", "Orders", "Profile"];

  List<BottomNavigationBarItem> bottomBar = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
    BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "Orders"),
    BottomNavigationBarItem(
        icon: Icon(Icons.account_circle_rounded), label: "Profile"),
  ];
  final PageController _pageController = PageController();

  Widget searchBar() {
    return SizedBox(
      height: 40,
      child: TextField(
        controller: searchController,
        onTap: () {
          Get.to(const SearchPage());
          setState(() {});
        },
        onChanged: (change) {},
        style: const TextStyle(fontSize: 16),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.2,
                color: Colors.orange,
              ),
              borderRadius: BorderRadius.all(Radius.circular(30))),
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 1.2, color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(30))),
          hintText: "Search",
        ),
      ),
    );
  }

  Widget siteIcon() {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      child: SizedBox(
        width: 35,
        child: Image.asset(
          "assets/images/2.0x/app.png",
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget topSlider() {
    return SizedBox(
      width: 400,
      height: 250,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
                viewportFraction: 0.99,
                onPageChanged: (count, reason) {
                  setState(() {
                    activeIndex = count;
                  });
                }),
            itemCount: 3,
            itemBuilder: (BuildContext context, int index, int realIndex) =>
                Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: SizedBox(
                width: 400,
                height: 250,
                child: Image.asset(
                  "assets/images/ms$index.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            child: AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: 3,
              effect: CustomizableEffect(
                  dotDecoration: DotDecoration(
                    width: 12,
                    height: 12,
                    color: Colors.transparent,
                    dotBorder: const DotBorder(width: 3, color: Colors.white70),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  activeDotDecoration: DotDecoration(
                    width: 20,
                    height: 20,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget shoppingBlocks(index) {
    if (index <= 6) {
      return SizedBox(
        height: 150,
        width: 150,
        child: Column(
          children: [
            Container(
              color: Colors.blue,
              height: 90,
              width: 90,
              child: Image.asset(
                "assets/images/cat$index.jpg",
                scale: 0.7,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              catList[index],
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      );
    } else {
      return Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 90,
                width: 90,
                child: Image.asset(
                  "assets/images/cat$index.jpg",
                  scale: 0.7,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: 90,
                height: 90,
                color: Colors.black.withOpacity(0.5),
                child: const Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          const Text(
            "View More",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      );
    }
  }

  Widget shoppingBlocksExc() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250,
      ),
      itemCount: 4,
      itemBuilder: (BuildContext context, index) => Padding(
        padding: const EdgeInsets.all(2.0),
        child: SizedBox(
          child: Stack(
            children: [
              Container(
                color: Colors.blue,
                height: 190,
                width: 190,
                child: Image.asset(
                  "assets/images/ex$index.jpg",
                  scale: 0.7,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 5,
                left: 5,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  color: Colors.white,
                  height: 25,
                  child: Text(
                    exclusiveList[index],
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget shoppingBlocksSpe() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: catList.length,
        itemBuilder: (BuildContext context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.black38,
                      width: 1.5,
                    )),
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    SizedBox(
                      width: 140,
                      height: 130,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            "assets/images/cat$index.jpg",
                            height: 130,
                            fit: BoxFit.cover,
                          )),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 130,
                      child: Text(
                        speacialOffer.keys.elementAt(index).length < 12
                            ? speacialOffer.keys.elementAt(index)
                            : speacialOffer.keys.elementAt(index).replaceRange(
                                12,
                                speacialOffer.keys.elementAt(index).length,
                                "..."),
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      alignment: Alignment.center,
                      width: 130,
                      child: Text(
                        speacialOffer.values.elementAt(index).split("-*-")[0],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }

  Widget shoppingBlocksTrend() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: catList.length,
      itemBuilder: (BuildContext context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.black38,
                width: 1.5,
              )),
          child: Column(
            children: [
              const SizedBox(height: 5),
              Stack(
                children: [
                  SizedBox(
                    width: 280,
                    height: 180,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          "assets/images/cat$index.jpg",
                          height: 130,
                          fit: BoxFit.cover,
                        )),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      alignment: Alignment.center,
                      width: 50,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        speacialOffer[speacialOffer.keys.elementAt(index)]!
                            .split("-*-")[1],
                        style: const TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 250,
                child: Text(
                  speacialOffer.keys.elementAt(index).length < 20
                      ? speacialOffer.keys.elementAt(index)
                      : speacialOffer.keys.elementAt(index).replaceRange(20,
                          speacialOffer.keys.elementAt(index).length, "..."),
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 250,
                child: Text(
                  speacialOffer[speacialOffer.keys.elementAt(index)]!
                      .split("-*-")[0],
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 270,
                child: RatingBar(
                  initialRating: 3,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemSize: 25,
                  itemCount: 5,
                  ratingWidget: RatingWidget(
                    full: const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    half: const Icon(
                      Icons.star_half,
                      color: Colors.amber,
                    ),
                    empty: const Icon(
                      Icons.star_border,
                      color: Colors.amber,
                    ),
                  ),
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customAppBar() {
    return Container(
      height: 80,
      color: Colors.red,
      child: Row(
        children: [
          siteIcon(),
          searchBar(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ecommerceHomepageUI",
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: searchBar(),
          toolbarHeight: 60,
          leading: siteIcon(),
          backgroundColor: Colors.white,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          onTap: (index) {
            _pageController.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
          iconSize: 30,
          items: bottomBar,
        ),
        body: PageView(
          controller: _pageController,
          children: [
            SizedBox(
              child: ListView(
                children: [
                  // SizedBox(
                  //   child: customAppBar(),
                  // ),
                  // Carousel Slider
                  topSlider(),
                  const SizedBox(height: 20.0),
                  // Categories title
                  Container(
                    alignment: Alignment.center,
                    height: 40,
                    child: const Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  // Categories
                  SizedBox(
                    width: 400,
                    height: 250,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        childAspectRatio: 1 / 1.2,
                        maxCrossAxisExtent: 130,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: 8,
                      itemBuilder: (BuildContext context, index) => Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: shoppingBlocks(index),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),

                  // Exclusive to you title
                  Container(
                    alignment: Alignment.center,
                    height: 40,
                    child: const Text(
                      "Exclusive for you",
                      style: TextStyle(fontSize: 21),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  // Exclusive for you
                  SizedBox(
                    width: 500,
                    height: 420,
                    child: shoppingBlocksExc(),
                  ),

                  // Special Offer title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 100),
                      Container(
                        alignment: Alignment.center,
                        height: 40,
                        child: const Text(
                          "Special Offer",
                          style: TextStyle(fontSize: 21),
                        ),
                      ),
                      Row(
                        children: const [
                          Text(
                            "Ends in: ",
                            style: TextStyle(fontSize: 13),
                          ),
                          SlideCountdownSeparated(
                            height: 20,
                            width: 20,
                            duration: Duration(hours: 13),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  // Special Offer
                  SizedBox(
                    width: 500,
                    height: 220,
                    child: shoppingBlocksSpe(),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 100),
                      Container(
                        alignment: Alignment.center,
                        height: 40,
                        child: const Text(
                          "Trending",
                          style: TextStyle(fontSize: 21),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "See More...",
                          style: TextStyle(
                            color: Colors.orange,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  // Special Offer
                  SizedBox(
                    width: 500,
                    height: 330,
                    child: shoppingBlocksTrend(),
                  ),
                ],
              ),
            ),
            const SearchPage(),
            const CartPage(),
            const OrderPage(),
            const ProfilePage(),
          ],
        ),
      ),
    );
  }
}
