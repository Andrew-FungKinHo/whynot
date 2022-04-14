import 'package:flutter/material.dart';
import 'package:whynot/widgets/story_details.dart';
import 'package:whynot/widgets/story_sidebar.dart';

class MyStory3 extends StatelessWidget {
  const MyStory3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            image: DecorationImage(
              image: NetworkImage('https://picsum.photos/id/1061/800/1080'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.3),
                        Colors.transparent
                      ],
                      begin: Alignment(0, -0.75),
                      end: Alignment(0, 0.1),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.3),
                        Colors.transparent
                      ],
                      end: Alignment(0, -0.75),
                      begin: Alignment(0, 0.1),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  flex: 14,
                  child: StoryDetails(),
                ),
                Flexible(
                  flex: 2,
                  child: StorySideBar(),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
