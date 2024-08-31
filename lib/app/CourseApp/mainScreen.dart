import 'package:flutter/material.dart';
import 'package:riverpod_flutter/app/CourseApp/CategoryButtton.dart';
import 'package:riverpod_flutter/app/CourseApp/CustomCard.dart';

import 'filterCourses.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          elevation: 1,
          title: const Text(
            'Study',
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              )),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                color: Colors.white,
                height: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('COURSES IN'),
                    ),
                    DropdownButton<String>(
                      items: <String>[
                        'All Categories',
                        'UPSSSC AUDITOR',
                        'SSC CHSL',
                        'CLERK'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(color: Colors.blue),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? value) {},
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            CategoryButton(label: 'UPSSSC AUDITOR'),
                            SizedBox(
                              width: 5,
                            ),
                            CategoryButton(label: 'SSC CHSL'),
                            SizedBox(
                              width: 5,
                            ),
                            CategoryButton(label: 'CLERK'),
                            SizedBox(
                              width: 5,
                            ),
                            CategoryButton(label: 'CLERK'),
                            SizedBox(
                              width: 5,
                            ),
                            CategoryButton(label: 'CLERK')
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 430,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Popular Courses',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: TextButton.icon(
                                  label: const Text('See All'),
                                  iconAlignment: IconAlignment.start,
                                  icon: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.arrow_back,
                                        color: Colors.blue,
                                      )),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // const SizedBox(height: 10,),
                    SizedBox(height: 350,child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        CourseCard(),
                        CourseCard(),
                        CourseCard()
                      ],
                    ),)
                    ],
                  ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Filter Courses',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      children: [
                        FilterCourseButton(
                          color: Colors.red,
                          label: 'Live\nCourses',
                          icon: Icons.play_arrow,
                        ),
                        FilterCourseButton(
                          color: Colors.blue,
                          label: 'Test\nSeries',
                          icon: Icons.edit,
                        ),
                        FilterCourseButton(
                          color: Colors.green,
                          label: 'Recorded\nCourses',
                          icon: Icons.video_library,
                        ),
                        FilterCourseButton(
                          color: Colors.orange,
                          label: 'All\nCourses',
                          icon: Icons.list,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.layers), label: 'Batches'),
            BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Store'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
