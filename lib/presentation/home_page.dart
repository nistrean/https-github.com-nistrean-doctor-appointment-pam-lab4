import 'package:doctor_appointment/presentation/widgets/banners_carousel.dart';
import 'package:doctor_appointment/presentation/widgets/categories_grid.dart';
import 'package:doctor_appointment/presentation/widgets/doctor_list.dart';
import 'package:doctor_appointment/presentation/widgets/nearby_centers_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Location',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(28, 42, 59, 1),
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.location_on,
                        color: Color.fromRGBO(28, 42, 59, 1)),
                    SizedBox(width: 5),
                    Text(
                      'Seattle, USA',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(28, 42, 59, 1),
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down,
                        color: Color.fromRGBO(28, 42, 59, 1)),
                  ],
                ),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Color(0xFFF1F3F7),
                  child: Icon(Icons.notifications,
                      color: Color.fromRGBO(28, 42, 59, 1)),
                ),
              ],
            ),
          ],
        ),
      ),
      body: ListView(padding: const EdgeInsets.all(10.0), children: [
        // Search Bar
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(242, 243, 245, 1),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: const TextField(
            decoration: InputDecoration(
              hintText: 'Search doctor...',
              border: InputBorder.none,
              icon: Icon(Icons.search, color: Color.fromRGBO(157, 164, 176, 1)),
            ),
          ),
        ),
        const SizedBox(height: 20.0),

        BannersCarousel(),

        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Categories',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(28, 42, 59, 1),
              ),
            ),
            Text(
              'See All',
              style: TextStyle(
                fontSize: 16,
                color: Color.fromRGBO(157, 164, 176, 1),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),

         // Categories Grid
        SizedBox(
          height: 220,
          child: CategoriesGrid(),
        ),

        // nearby medical centers Title
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Nearby Medical Centers',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(28, 42, 59, 1),
              ),
            ),
            Text(
              'See All',
              style: TextStyle(
                fontSize: 16,
                color: Color.fromRGBO(157, 164, 176, 1),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        NearbyCentersList(),

        DoctorsList(),
      ]),
    );
  }
}