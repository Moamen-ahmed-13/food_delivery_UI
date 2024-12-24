import 'package:flutter/material.dart';
import 'package:flutter_awesome_animations_kit/flutter_awesome_animations_kit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categories = ['Pizza', 'Burger', 'Kebab', 'Dessert', 'Salad'];
  List<String> items = [
    'assets/images/one.jpg',
    'assets/images/two.jpg',
    'assets/images/three.jpg',
  ];
  bool isFavourite = false;
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        leading: const Icon(null),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_bag_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: FlutterAnimatedView(
          animationType: AnimationType.slideUp,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Food Delivery',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return categoryItem(index);
                    }),
              ),
              const SizedBox(height: 20),
              Text(
                'Free Delivery',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade700),
              ),
              const SizedBox(height: 20),
              AspectRatio(
                aspectRatio: 1 / 1,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: items.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return itemMethod(image: items[index]);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget itemMethod({image}) {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            stops: const [0.2, 0.9],
            colors: [
              Colors.black.withOpacity(0.7),
              Colors.black.withOpacity(0.3),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavourite = !isFavourite;
                    });
                  },
                  child: Icon(
                    Icons.favorite,
                    color: isFavourite ? Colors.red : Colors.white,
                  ),
                ),
              ),
              const Spacer(),
              const Text(
                '\$ 13.00',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                'Vegetarian Pizza',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget categoryItem(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        width: 120,
        decoration: BoxDecoration(
          color: currentIndex == index ? Colors.amber : Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        alignment: Alignment.center,
        child: Text(categories[index],
            style: TextStyle(
                color:
                    currentIndex == index ? Colors.white : Colors.grey.shade400,
                fontWeight:
                    currentIndex == index ? FontWeight.bold : FontWeight.w500,
                fontSize: 20)),
      ),
    );
  }
}
