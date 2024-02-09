

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_and_api_for_class/core/common/provider/is_dark_theme.dart';
import 'package:hive_and_api_for_class/core/common/snackbar/my_snackbar.dart';
// import 'package:hive_and_api_for_class/features/batch/presentation/viewmodel/batch_view_model.dart';
// import 'package:hive_and_api_for_class/features/course/presentation/viewmodel/course_viewmodel.dart';
import 'package:hive_and_api_for_class/features/home/presentation/viewmodel/home_viewmodel.dart';
// import 'package:hive_and_api_for_class/features/home/presentation/widget/batch_widget.dart';
// import '../../widget/course_widget.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  ConsumerState<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  late bool isDark;

  @override
  void initState() {
    isDark = ref.read(isDarkThemeProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var batchState = ref.watch(batchViewModelProvider);
    // var courseState = ref.watch(courseViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Online Bakery Shop'),
        actions: [
          IconButton(
            onPressed: () {
              showSnackBar(message: 'Refreshing...', context: context);
            },
            icon: const Icon(
              Icons.refresh,
              color: Colors.red,
            ),
          ),
          IconButton(
            onPressed: () {
              ref.read(homeViewModelProvider.notifier).logout(context);
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.purple,
            ),
          ),
          Switch(
            value: isDark,
            onChanged: (value) {
              setState(() {
                isDark = value;
                ref.read(isDarkThemeProvider.notifier).updateTheme(value);
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              // Banner Section
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/banner2.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'New Arrivals',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                // scrollDirection: Axis.horizontal,
                // padding: EdgeInsets.symmetric(horizontal: 5.0),
                children: [
                  _buildNewArrivalTile('Chocolate Cake', 'assets/images/chocolate_cake.jpg'),
                  _buildNewArrivalTile('Cream Cake', 'assets/images/cream_cake.jpg'),
                  _buildNewArrivalTile('Pastries', 'assets/images/de.jpg'),
                  _buildNewArrivalTile('Bread', 'assets/images/breade.jpg'),
                  
                  // Add more products as needed
                  // _buildNewArrivalTile('New Product 1', 'assets/images/new_product_1.jpg'),
                  // _buildNewArrivalTile('New Product 2', 'assets/images/new_product_2.jpg'),
                  // _buildNewArrivalTile('New Product 3', 'assets/images/new_product_3.jpg'),
                  // _buildNewArrivalTile('New Product 4', 'assets/images/new_product_4.jpg'),
                  // _buildNewArrivalTile('New Product 5', 'assets/images/new_product_5.jpg'),
                  // _buildNewArrivalTile('New Product 6', 'assets/images/new_product_6.jpg'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewArrivalTile(String title, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              imagePath,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
