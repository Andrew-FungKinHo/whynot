import 'package:flutter/material.dart';
import 'package:whynot/constants.dart';
import 'package:whynot/data/story_data.dart';

class StoryCircle extends StatelessWidget {
  final function;

  StoryCircle({this.function});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: GestureDetector(
        onTap: function,
        child: Padding(
          padding: const EdgeInsets.only(right: 20, bottom: 10),
          child: Container(
            width: 68,
            height: 68,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  // Color(0xFF9B2282),
                  // Color(0xFFEEA863),
                  AppColors.kAccentColor,
                  Colors.white
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                  // border: Border.all(
                  //   color: Colors.black,
                  //   width: 2,
                  // ),
                  shape: BoxShape.circle,
                  // color: Colors.blue,
                  image: DecorationImage(
                    image: AssetImage('yeet.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
