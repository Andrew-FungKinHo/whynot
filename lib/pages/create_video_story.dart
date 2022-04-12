import 'package:flutter/material.dart';
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
            backgroundColor: Colors.black,
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: 'Burst'),
                Tab(text: 'Video'),
                Tab(text: 'Audio'),
              ],
            ),
          ),
          backgroundColor: Colors.black,
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
                      Icon(
                        Icons.whatshot_rounded,
                        size: 80,
                        color: Colors.white,
                      ),
                      ElevatedButton(
                        child: Text(
                          'Tap to start recording',
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
                      // Text(
                      //   'Tap to record your voice',
                      //   style: TextStyle(fontSize: 15, color: Colors.white),
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          'Choose your Voice-Changer',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
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
