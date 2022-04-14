import 'package:flutter/material.dart';
import 'package:whynot/constants.dart';
import 'package:whynot/widgets/audioplaybutton.dart';
import 'package:whynot/widgets/process_timeline.dart';

class CreateVideoStory extends StatelessWidget {
  const CreateVideoStory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Create With'),
            centerTitle: true,
            backgroundColor: AppColors.kPrimaryColor,
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: 'Burst'),
                Tab(text: 'Video'),
                Tab(text: 'Audio'),
              ],
            ),
            elevation: 0,
          ),
          backgroundColor: AppColors.kPrimaryColor,
          body: TabBarView(
            children: [
              Center(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          'Just Burst everything in a minute!',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      // Icon(
                      //   Icons.whatshot_rounded,
                      //   size: 80,
                      //   color: AppColors.kAccentColor,
                      // ),
                      // ElevatedButton(
                      //   child: Text(
                      //     'Tap to start recording',
                      //     style: TextStyle(
                      //       color: Colors.black,
                      //     ),
                      //   ),
                      //   onPressed: () {
                      //     print('Pressed');
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => ProcessTimelinePage(),
                      //       ),
                      //     );
                      //   },
                      //   style: ElevatedButton.styleFrom(
                      //     primary: Colors.white,
                      //     shape: new RoundedRectangleBorder(
                      //       borderRadius: new BorderRadius.circular(10.0),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 70,
                        width: 70,
                        child: PlayButton(
                          pauseIcon:
                              Icon(Icons.pause, color: Colors.black, size: 50),
                          playIcon: Icon(Icons.whatshot_rounded,
                              color: AppColors.kAccentColor, size: 50),
                          onPressed: () {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          'Tap to start recording',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              child: Text(
                                'Redo',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () {
                                print('Pressed');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProcessTimelinePage(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            ElevatedButton(
                              child: Text(
                                'Done',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () {
                                print('Pressed');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProcessTimelinePage(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ]),

                      // Text(
                      //   'Tap to record your voice',
                      //   style: TextStyle(fontSize: 15, color: Colors.white),
                      // ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Video',
                      style: TextStyle(fontSize: 15, color: Colors.white)),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Audio',
                      style: TextStyle(fontSize: 15, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      );
}
