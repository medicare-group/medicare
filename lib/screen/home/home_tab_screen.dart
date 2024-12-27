import 'package:flutter/material.dart';
import 'package:medicare/commom/color_extension.dart';

import '../../commom_widget/category_button.dart';
import '../../commom_widget/section_raw.dart';
import 'category_filter_screen.dart';
import 'chat/chat_message_screen.dart';
import 'doctor_cell.dart';
import 'medical_shop/medical_shop_list_screen.dart';
import 'medical_shop/medical_shop_profile_screen.dart';
import 'shop_cell.dart';

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({super.key});

  @override
  State<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  List categoryArr = [
    {"title": "Heart Issue", "img": "assets/imgs/heart.png"},
    {"title": "Lung Issue", "img": "assets/imgs/lung.png"},
    {"title": "Cancer Issue", "img": "assets/imgs/cancer.png"},
    {"title": "Sugar Issue", "img": "assets/imgs/sugar.png"},
  ];

  List adsArr = [
    {
      "img": "assets/imgs/ad_1.png",
    },
    {
      "img": "assets/imgs/ad_2.png",
    },
  ];

  List nearDoctorArr = [
    {
      "name": "Dr. Mainsh",
      "degree": "BAMS, MBBS, MD, DDLT,Psychiatrist",
      "img": "assets/imgs/u1.png"
    },
    {
      "name": "Dr. Priyanka",
      "degree": "BAMS, MBBS, MD, DDLT,Psychiatrist",
      "img": "assets/imgs/u2.png"
    },
    {
      "name": "Dr. Kunal Vaidya",
      "degree": "BAMS, MBBS, MD, DDLT,Psychiatrist",
      "img": "assets/imgs/u3.png"
    },
  ];

  List nearShopArr = [
    {
      "name": "Jai Ambey Medical",
      "address": "Surat",
      "img": "assets/imgs/s1.png"
    },
    {
      "name": "All Relif Medical",
      "address": "Surat",
      "img": "assets/imgs/s2.png"
    },
    {
      "name": "Matru Chaya Medical",
      "address": "Surat",
      "img": "assets/imgs/s3.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                itemBuilder: (context, index) {
                  var obj = categoryArr[index];

                  return CategoryButton(
                      title: obj["title"],
                      icon: obj["img"],
                      onPressed: () {
                        context.push(const CategoryFilterScreen());
                      });
                },
                separatorBuilder: (context, index) => const SizedBox(
                  width: 25,
                ),
                itemCount: categoryArr.length,
              ),
            ),
            SizedBox(
              // color: Colors.red,
              height: context.width * 0.5,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  itemBuilder: (context, index) {
                    var obj = adsArr[index];
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(color: Colors.black12, blurRadius: 1)
                            ]),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          child: Image.asset(
                            obj["img"],
                            width: context.width * 0.85,
                            height: context.width * 0.425,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 15,
                      ),
                  itemCount: adsArr.length),
            ),
            SectionRow(title: "Doctors near by you", onPressed: () {}),
            SizedBox(
              height: 220,
              child: ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return DoctorCell(
                        obj: nearDoctorArr[index],
                        onPressed: () {
                          // context.push(const OnlyDoctorProfileScreen());
                          context.push(const ChatMessageScreen());
                        });
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 20,
                      ),
                  itemCount: nearDoctorArr.length),
            ),
            SectionRow(
                title: "Medical Shop near by you",
                onPressed: () {
                  context.push(const MedicalShopListScreen());
                }),
            SizedBox(
              height: 220,
              child: ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ShopCell(
                        obj: nearShopArr[index],
                        onPressed: () {
                          context.push(const MedicalShopProfileScreen());
                        });
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 20,
                      ),
                  itemCount: nearShopArr.length),
            ),
          ],
        ),
      ),
    );
  }
}