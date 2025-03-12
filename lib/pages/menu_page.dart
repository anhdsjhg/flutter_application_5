import 'package:flutter/material.dart';
import 'package:flutter_application_5/components/button.dart';
import 'package:flutter_application_5/components/food_tile.dart';
import 'package:flutter_application_5/models/shop.dart';
import 'package:flutter_application_5/pages/food_details_page.dart';
import 'package:flutter_application_5/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  void navigateToFoodDetails(int index) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailsPage(food: foodMenu[index]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[800],
        elevation: 0,
        leading: Icon(Icons.menu),
        title: Text('Tokyo', style: TextStyle()),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cartpage');
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.symmetric(horizontal: 25),
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Get 32% Promo',
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(height: 15),

                    MyButton(text: 'Redeem', onTap: () {}),
                  ],
                ),

                Image.asset('lib/images/many_sushi.png', height: 100),
              ],
            ),
          ),

          SizedBox(height: 15),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: 'Search here..',
              ),
            ),
          ),

          SizedBox(height: 15),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Food Menu',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
                fontSize: 18,
              ),
            ),
          ),

          SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodMenu.length,
              itemBuilder:
                  (context, index) => FoodTile(
                    food: foodMenu[index],
                    onTap: () => navigateToFoodDetails(index),
                  ),
            ),
          ),

          SizedBox(height: 15),

          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset('lib/images/salmon_eggs.png', height: 50),

                    SizedBox(width: 15),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Salmon eggs',
                          style: GoogleFonts.dmSerifDisplay(fontSize: 16),
                        ),

                        SizedBox(height: 10),

                        Text(
                          '\$21.00',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ],
                ),

                Icon(Icons.favorite_outline, color: Colors.grey, size: 28),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
