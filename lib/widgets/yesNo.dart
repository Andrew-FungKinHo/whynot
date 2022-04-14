import 'package:flutter/material.dart';
import 'package:whynot/constants.dart';
import 'package:whynot/pages/create_video_story.dart';

class AnonymousOption extends StatefulWidget {
  const AnonymousOption({Key? key}) : super(key: key);

  @override
  State<AnonymousOption> createState() => _AnonymousOptionState();
}

class _AnonymousOptionState extends State<AnonymousOption> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: AppColors.kPrimaryColor,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ), //BoxDecoration

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      'Do You Wish To Stay Anonymous?',
                      style:
                          TextStyle(color: AppColors.strongBlue, fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: CheckboxListTile(
                      title: const Text('Yes, please'),
                      autofocus: false,
                      activeColor: Colors.green,
                      checkColor: Colors.white,
                      selected: _value,
                      value: _value,
                      onChanged: (bool? value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateVideoStory(),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: CheckboxListTile(
                      title: const Text('No, its fine'),
                      autofocus: false,
                      activeColor: Colors.green,
                      checkColor: Colors.white,
                      selected: _value,
                      value: _value,
                      onChanged: (bool? value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateVideoStory(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ), //CheckboxListTile
            ), //Container
          ), //Padding
        ), //SizedBox
      ),
    );
  }
}
