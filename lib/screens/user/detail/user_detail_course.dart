import 'package:flutter/material.dart';
import 'package:online_learning_app/export.dart';
import 'package:online_learning_app/screens/user/detail/user_about.dart';
import 'package:online_learning_app/screens/user/detail/user_videos.dart';

class DetailCourseScreen extends StatelessWidget {
  const DetailCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: kGreyColor),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_rounded),
                  ),
                  Text(
                    'Detail Kursus',
                    style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semibold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
                top: 30,
                bottom: 30,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                    ),
                    child: const Center(child: Text('image here')),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Fikri Ilhamsyah',
                        style: greyTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Fundamental PHP Untuk\nMenuju Framework\nLaravel 10 Untuk Pemula',
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 522,
              child: DefaultTabController(
                length: 2,
                child: Scaffold(
                  backgroundColor: const Color(0xffF4F6F8),
                  appBar: AppBar(
                    toolbarHeight: 50,
                    backgroundColor: kPrimaryColor.withAlpha(1500),
                    elevation: 0,
                    flexibleSpace: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TabBar(
                          labelStyle: orangeTextStyle.copyWith(fontSize: 14, fontWeight: bold),
                          unselectedLabelStyle: greyTextStyle.copyWith(fontSize: 12, fontWeight: regular),
                          tabs: const [
                            Tab(text: "Tentang"),
                            Tab(text: "Semua Video"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  body: const TabBarView(
                    children: [
                      About(),
                      Videos(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
