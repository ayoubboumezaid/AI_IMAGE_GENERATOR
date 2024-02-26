// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, non_constant_identifier_names

import 'package:flutter/material.dart';

import 'package:iaappp/misc/colors.dart';
import 'package:iaappp/pages/home.dart';
import 'package:iaappp/widgets/app_large_text.dart';
import 'package:iaappp/widgets/app_text.dart';
import 'package:iaappp/widgets/respensive_botton.dart';

class WelcomePge extends StatefulWidget {
  const WelcomePge({super.key});

  @override
  State<WelcomePge> createState() => _WelcomePgeState();
}

class _WelcomePgeState extends State<WelcomePge> {
  List iamges = [
    "file8.jpg",
    "file11.jpg",
    "file12.jpg",
  ];
  List AppLargtext = [
    "Unlock Creativity",
    "Ignite Innovation",
    "Empower Ideas"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: iamges.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("img/" + iamges[index]),
                    fit: BoxFit.cover),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 150, right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargText(
                          text: AppLargtext[index],
                          color: Colors.blueGrey.shade400,
                          
                        ),
                        AppText(
                          text: "With IA",
                          color: Colors.white,
                          size: 30,
                          
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 250,
                          child: AppText(
                            text: "",
                            color: AppColors.textColor2,
                            size: 14,
                          ),
                        ),
                        SizedBox(
                          height: 527,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                              );
                            },
                            child: Container(
                                width: 180,
                                child: Row(
                                  children: [
                                    RespensiveBotton(width: 200),
                                  ],
                                )))
                      ],
                    ),
                    Column(
                      children: List.generate(3, (indexDots) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          width: 8,
                          height: index == indexDots ? 25 : 8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: index == indexDots
                                  ? Colors.deepPurple
                                  : Colors.deepPurple.withOpacity(0.3)),
                        );
                      }),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
