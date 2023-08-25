import 'package:flutter/material.dart';
import 'package:listicle/types/category.dart';
import 'package:listicle/types/product.dart';
import 'package:listicle/utils/style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> products = [
    Product("item-1.png", "Black Simple Lamp", 12.00),
    Product("item-2.png", "Minimal Stand", 25.00),
    Product("item-3.png", "Coffee Chair", 20.00),
    Product("item-4.png", "Simple Desk", 50.00),
  ];

  List<Category> categories = [
    Category("star", "Popular"),
    Category("chair", "Chair"),
    Category("table", "Table"),
    Category("armchair", "Armchair"),
    Category("bed", "Bed"),
  ];
  String categorySelected = "star";

  List<Widget> generateListCategory() {
    List<Widget> categoryList = [];
    for (Category c in categories) {
      String icon = c.icon;
      Color color = icon == categorySelected ? darkColor : secondaryColor;
      TextStyle style = icon == categorySelected
          ? categorySelectedStyle
          : categoryNormalStyle;
      categoryList.add(
        Column(
          children: [
            SizedBox(
              width: 44,
              height: 44,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    categorySelected = icon;
                  });
                },
                style: TextButton.styleFrom(
                    backgroundColor: color,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                child: Image.asset("assets/images/$icon.png"),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              c.label,
              style: style,
            )
          ],
        ),
      );
    }
    return categoryList;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // const Icon(
                      //   Icons.search,
                      //   size: 24,
                      //   color: blueColor,
                      // ),
                      SizedBox(
                          width: 24,
                          height: 24,
                          child: Image.asset("assets/images/search.png")),
                      Text(
                        "Find All You Need",
                        style: montserratHeader,
                      ),
                      const SizedBox(
                        width: 0,
                      )
                    ],
                  ),
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: generateListCategory()),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            bottomSheet: Padding(
              padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: SizedBox(
                          width: 24,
                          height: 24,
                          child:
                              Image.asset("assets/images/home_selected.png"))),
                  TextButton(
                      onPressed: () {},
                      child: SizedBox(
                          width: 24,
                          height: 24,
                          child: Image.asset("assets/images/marker.png"))),
                  TextButton(
                      onPressed: () {},
                      child: SizedBox(
                          width: 24,
                          height: 24,
                          child: Image.asset("assets/images/person.png"))),
                ],
              ),
            )));
  }
}
