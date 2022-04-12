import 'package:flutter/material.dart';
import 'package:spincircle_bottom_bar/modals.dart';
import 'package:spincircle_bottom_bar/spincircle_bottom_bar.dart';
import 'package:video_player/video_player.dart';
import 'package:whynot/constants.dart';
import 'package:whynot/pages/create_story_option.dart';
import 'package:whynot/pages/create_video_story.dart';
import 'package:whynot/widgets/advice_tiles.dart';
import 'package:whynot/widgets/process_timeline.dart';
import 'package:whynot/widgets/story_circles.dart';
import 'package:whynot/widgets/video_player.dart';
import 'storypage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _openStory() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StoryPage(),
      ),
    );
  }

  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chihuahua"),
        backgroundColor: AppColors.kPrimaryColor,
        leading: Icon(Icons.youtube_searched_for),
        // actions: [
        //   Icon(Icons.favorite),
        //   Padding(
        //     padding: EdgeInsets.symmetric(horizontal: 16),
        //     child: Icon(Icons.search),
        //   ),
        //   Icon(Icons.more_vert),
        // ],
      ),
      //Adding SpinCircleBottomBarHolder to body of Scaffold
      body: SpinCircleBottomBarHolder(
        bottomNavigationBar: SCBottomBarDetails(
            circleColors: [
              Colors.white,
              AppColors.kAccentColor,
              AppColors.kPrimaryColor
            ],
            iconTheme: IconThemeData(color: Colors.black45),
            activeIconTheme: IconThemeData(color: AppColors.kPrimaryColor),
            backgroundColor: Colors.white,
            titleStyle: TextStyle(color: Colors.black45, fontSize: 12),
            activeTitleStyle: TextStyle(
                color: AppColors.kPrimaryColor,
                fontSize: 12,
                fontWeight: FontWeight.bold),
            actionButtonDetails: SCActionButtonDetails(
                color: AppColors.kAccentColor,
                icon: Icon(
                  Icons.add_rounded,
                  color: Colors.white,
                ),
                elevation: 0),
            elevation: 2.0,
            items: [
              // Suggested count : 4
              SCBottomBarItem(
                icon: Icons.home,
                title: "Home",
                onPressed: () {},
              ),
              SCBottomBarItem(
                icon: Icons.chat_rounded,
                title: "Chat",
                onPressed: () {},
              ),
              SCBottomBarItem(
                icon: Icons.notifications_rounded,
                title: "Notifications",
                onPressed: () {
                  print('Notification is choen');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyStatefulWidget(),
                    ),
                  );
                },
              ),
              SCBottomBarItem(
                icon: Icons.person_rounded,
                title: "Account",
                onPressed: () {
                  print('Account is pressed');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProcessTimelinePage(),
                    ),
                  );
                },
              ),
            ],
            circleItems: [
              SCItem(
                  icon: Icon(Icons.multitrack_audio_rounded),
                  onPressed: () {
                    print('Audio is chosen');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateStoryOption(),
                      ),
                    );
                  }),
              SCItem(
                icon: Icon(Icons.video_camera_front_rounded),
                onPressed: () {
                  print('Video is chosen');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateStoryOption(),
                    ),
                  );
                },
              ),
              SCItem(
                  icon: Icon(Icons.whatshot),
                  onPressed: () {
                    print('Burst is chosen');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateStoryOption(),
                      ),
                    );
                  }),
            ],
            bnbHeight: 80 // Suggested Height 80
            ),
        child: Container(
          // color: Colors.orangeAccent.withAlpha(55),
          child: Scaffold(
            backgroundColor: Color(0XFFF2F6FE),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Burst 🔥',
                    style: TextStyle(
                        color: AppColors.kAccentColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: SizedBox(
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.all(8),
                        children: <Widget>[
                          StoryCircle(
                            function: _openStory,
                          ),
                          StoryCircle(
                            function: _openStory,
                          ),
                          StoryCircle(
                            function: _openStory,
                          ),
                          StoryCircle(
                            function: _openStory,
                          ),
                        ],
                      )

                      // ListView.builder(
                      //   itemCount: 3,
                      //   scrollDirection: Axis.horizontal,
                      //   itemBuilder: (context, index) {
                      //     return StoryCircle(
                      //       function: _openStory,
                      //     );
                      //   },
                      // ),
                      ),
                ),
                Center(
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getFooter() {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(color: Colors.blue),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
          top: 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(
              Icons.home,
              color: Colors.white,
              size: 40.0,
              // semanticLabel: 'Text to announce in accessibility modes',
            ),
            Icon(
              Icons.chat,
              color: Colors.white,
              size: 40.0,
              // semanticLabel: 'Text to announce in accessibility modes',
            ),
            Icon(
              Icons.add_circle_rounded,
              color: Colors.white,
              size: 50.0,
              // semanticLabel: 'Text to announce in accessibility modes',
            ),
            Icon(
              Icons.cloud_circle,
              color: Colors.white,
              size: 40.0,
              // semanticLabel: 'Text to announce in accessibility modes',
            ),
            Icon(
              Icons.person,
              color: Colors.white,
              size: 40.0,
              // semanticLabel: 'Text to announce in accessibility modes',
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
