import 'package:flutter/material.dart';
import 'package:spincircle_bottom_bar/modals.dart';
import 'package:spincircle_bottom_bar/spincircle_bottom_bar.dart';
import 'package:video_player/video_player.dart';
import 'package:whynot/constants.dart';
import 'package:whynot/data/story_data.dart';
import 'package:whynot/pages/create_story_option.dart';
import 'package:whynot/pages/create_video_story.dart';
import 'package:whynot/widgets/advice_tiles.dart';
import 'package:whynot/widgets/audioplaybutton.dart';
import 'package:whynot/widgets/calendar.dart';
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
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

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
        title: Image.asset(
          'assets/images/doge.png',
          color: AppColors.kPrimaryColor,
          height: 50,
          width: 50,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        // leading: Padding(
        //   padding: const EdgeInsets.only(left: 10.0),
        //   child: Image.asset(
        //     'assets/images/doge.png',
        //     color: AppColors.kPrimaryColor,
        //   ),
        // ),
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
            iconTheme: IconThemeData(color: AppColors.bluewhitegrey),
            activeIconTheme: IconThemeData(color: AppColors.kPrimaryColor),
            backgroundColor: Colors.white,
            titleStyle: TextStyle(color: AppColors.bluewhitegrey, fontSize: 12),
            activeTitleStyle: TextStyle(
              color: AppColors.kPrimaryColor,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            actionButtonDetails: SCActionButtonDetails(
                color: AppColors.kPrimaryColor,
                icon: Icon(
                  Icons.add_rounded,
                  color: Colors.white,
                  size: 45,
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
                onPressed: () {
                  print('Chat is chosen');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CalendarView(),
                    ),
                  );
                },
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
                  icon: Icon(
                    Icons.multitrack_audio_rounded,
                    color: AppColors.strongBlue,
                  ),
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
                icon: Icon(
                  Icons.video_camera_front_rounded,
                  color: AppColors.bluewhitegrey,
                ),
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
                  icon: Icon(
                    Icons.whatshot,
                    color: AppColors.kAccentColor,
                  ),
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
                    'Bursts 🔥',
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
                    child: ListView.builder(
                      itemCount: stories.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: GestureDetector(
                            onTap: _openStory,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 20, bottom: 10),
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
                                        image: AssetImage(
                                          stories[index]['img'],
                                        ),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),

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
                // CalendarView(),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: Container(
                    width: double.infinity,
                    height: 332.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 3.0),
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                leading: Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black45,
                                        offset: Offset(0, 2),
                                        blurRadius: 6.0,
                                      ),
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    child: ClipOval(
                                      child: Image(
                                        height: 40.0,
                                        width: 40.0,
                                        image: NetworkImage(
                                            'https://picsum.photos/200'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                title: Text(
                                  'IFCbird',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text('8 mins ago'),
                                trailing: IconButton(
                                  icon: Icon(Icons.more_horiz),
                                  color: Colors.black,
                                  onPressed: () => print('More'),
                                ),
                              ),
                              InkWell(
                                onDoubleTap: () => print('Like post'),
                                onTap: () {},
                                child: Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  width: double.infinity,
                                  height: 185.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black45,
                                        offset: Offset(0, 5),
                                        blurRadius: 8.0,
                                      ),
                                    ],
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          'https://picsum.photos/id/1/200/300'),
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Text('#Finance'),
                                            IconButton(
                                              icon: Icon(Icons.favorite_border),
                                              iconSize: 30.0,
                                              onPressed: () =>
                                                  print('Like post'),
                                            ),
                                            Text(
                                              '2,515',
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 20.0),
                                        Row(
                                          children: <Widget>[
                                            IconButton(
                                              icon: Icon(Icons.chat),
                                              iconSize: 30.0,
                                              onPressed: () {},
                                            ),
                                            Text(
                                              '350',
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.bookmark_border),
                                      iconSize: 30.0,
                                      onPressed: () => print('Save post'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
