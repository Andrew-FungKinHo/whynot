import 'package:flutter/material.dart';
import 'package:whynot/constants.dart';
import 'package:whynot/pages/create_video_story.dart';

class CreateStoryOption extends StatelessWidget {
  const CreateStoryOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kPrimaryColor,
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Create',
                      style: TextStyle(color: Colors.white, fontSize: 60),
                    ),
                  ],
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(color: Colors.yellow, width: 2.0),
                  ),
                  color: Colors.black,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreateVideoStory(),
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.75,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const ListTile(
                            title: Center(
                                child: Text('Instrumental Complaints',
                                    style: TextStyle(color: Colors.white))),
                            subtitle: Center(
                                child: Text('To Seek Closure',
                                    style: TextStyle(color: Colors.white))),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Icon(
                                  Icons.handshake,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),

                    // side: BorderSide(
                    //   // color: AppColors.kAccentColor,
                    //   width: 2.0,

                    // ),
                  ),
                  color: Color(0xFFF4F5F9),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreateVideoStory(),
                        ),
                      );
                    },
                    child: Container(
                      // decoration: BoxDecoration(
                      //   border: Border.all(width: 2.0, color: Colors.red),
                      // ),
                      width: MediaQuery.of(context).size.width / 1.75,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const ListTile(
                            title: Center(
                              child: Text(
                                'Expressive Complaints',
                                // style: TextStyle(color: Colors.white),
                              ),
                            ),
                            subtitle: Center(
                              child: Text(
                                'To Seek Comfort',
                                // style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Icon(
                                  Icons.hearing_outlined,
                                  color: AppColors.kAccentColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
