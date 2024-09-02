import 'package:flutter/material.dart';


class PopularCoursesMainScreen extends StatefulWidget {
  const PopularCoursesMainScreen({super.key});

  @override
  State<PopularCoursesMainScreen> createState() =>
      _PopularCoursesMainScreenState();
}

class _PopularCoursesMainScreenState extends State<PopularCoursesMainScreen> {
  @override
  Widget build(
    BuildContext context,
  ) {
    final cWidth = MediaQuery.sizeOf(context).width;
    final cHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: const Text(
          'Popular Courses',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 100,
              width: cWidth,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Center(
                    child: SearchBar(
                  hintText: 'Search for courses',
                  elevation: const WidgetStatePropertyAll(0),
                  // controller: controller,
                  backgroundColor: const WidgetStatePropertyAll(Colors.white),
                  shape: const WidgetStatePropertyAll<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                  padding: const WidgetStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 16.0)),
                  onTap: () {},
                  leading: const Icon(Icons.search),
                )),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

