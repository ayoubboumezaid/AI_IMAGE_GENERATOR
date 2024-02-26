// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, prefer_const_constructors
// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

import 'package:iaappp/widgets/app_text.dart';

class RespensiveBotton extends StatelessWidget {
  bool? isRespensive;
  double? width;

  RespensiveBotton({
    Key? key,
    this.isRespensive=false,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Flexible(
      child: Container(
        width: width,
        height: 60,
        
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.deepPurple,),
        
        child: Row(
          mainAxisAlignment: isRespensive==true?MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
          children: [isRespensive==true?Container(margin: EdgeInsets.only(left: 20), child: AppText(text: "",color: Colors.white,)):Container(),
    Image.asset("img/boutom_two.png",color: Colors.grey.shade400,width: 40,height: 50,)        ],
        ),
      ),
    );
  }
}
