import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:timelines/timelines.dart';
import 'package:whynot/constants.dart';
import 'package:whynot/pages/homepage.dart';
import 'package:whynot/widgets/advice_tiles.dart';
import 'package:whynot/widgets/calendar.dart';
import 'package:whynot/widgets/glassmorphism.dart';

const kTileHeight = 50.0;

const completeColor = AppColors.kPrimaryColor;
const inProgressColor = AppColors.kAccentColor;
const todoColor = Colors.grey;

class ProcessTimelinePage extends StatefulWidget {
  @override
  _ProcessTimelinePageState createState() => _ProcessTimelinePageState();
}

class _ProcessTimelinePageState extends State<ProcessTimelinePage> {
  int _processIndex = 1;

  Color getColor(int index) {
    if (index == _processIndex) {
      return inProgressColor;
    } else if (index < _processIndex) {
      return completeColor;
    } else {
      return todoColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F6FE),
      appBar: AppBar(
        title: Text('Your Progress'),
        backgroundColor: AppColors.kPrimaryColor,
      ),
      body: Stack(
        children: [
          Timeline.tileBuilder(
            theme: TimelineThemeData(
              direction: Axis.horizontal,
              connectorTheme: ConnectorThemeData(
                space: 30.0,
                thickness: 5.0,
              ),
            ),
            padding: EdgeInsets.only(bottom: 600),
            builder: TimelineTileBuilder.connected(
              connectionDirection: ConnectionDirection.before,
              itemExtentBuilder: (_, __) =>
                  MediaQuery.of(context).size.width / _processes.length,
              oppositeContentsBuilder: (context, index) {
                if (index % 2 == 0) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      _processes[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: getColor(index),
                      ),
                    ),
                  );
                }
              },
              contentsBuilder: (context, index) {
                if (index % 2 == 1) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text(
                      _processes[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: getColor(index),
                      ),
                    ),
                  );
                }
              },
              indicatorBuilder: (_, index) {
                var color;
                var child;
                if (index == _processIndex) {
                  color = inProgressColor;
                  child = Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(
                      strokeWidth: 3.0,
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    ),
                  );
                } else if (index < _processIndex) {
                  color = completeColor;
                  child = Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 15.0,
                  );
                } else {
                  color = todoColor;
                }

                if (index <= _processIndex) {
                  return Stack(
                    children: [
                      CustomPaint(
                        size: Size(30.0, 30.0),
                        painter: _BezierPainter(
                          color: color,
                          drawStart: index > 0,
                          drawEnd: index < _processIndex,
                        ),
                      ),
                      DotIndicator(
                        size: 30.0,
                        color: color,
                        child: child,
                      ),
                    ],
                  );
                } else {
                  return Stack(
                    children: [
                      CustomPaint(
                        size: Size(15.0, 15.0),
                        painter: _BezierPainter(
                          color: color,
                          drawEnd: index < _processes.length - 1,
                        ),
                      ),
                      OutlinedDotIndicator(
                        borderWidth: 4.0,
                        color: color,
                      ),
                    ],
                  );
                }
              },
              connectorBuilder: (_, index, type) {
                if (index > 0) {
                  if (index == _processIndex) {
                    final prevColor = getColor(index - 1);
                    final color = getColor(index);
                    List<Color> gradientColors;
                    if (type == ConnectorType.start) {
                      gradientColors = [
                        Color.lerp(prevColor, color, 0.5)!,
                        color
                      ];
                    } else {
                      gradientColors = [
                        prevColor,
                        Color.lerp(prevColor, color, 0.5)!
                      ];
                    }
                    return DecoratedLineConnector(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: gradientColors,
                        ),
                      ),
                    );
                  } else {
                    return SolidLineConnector(
                      color: getColor(index),
                    );
                  }
                } else {
                  return null;
                }
              },
              itemCount: _processes.length,
            ),
          ),
          // Card(
          //   elevation: 5,
          //   child: ListTile(
          //     leading: Icon(Icons.icecream),
          //     title: Text('I like icecream'),
          //     subtitle: Text('Icream is good for health'),
          //     trailing: Icon(Icons.food_bank),
          //   ),
          // ),
          _processIndex == 1
              ? Padding(
                  padding: const EdgeInsets.only(top: 150.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text('On Instrumental Complaint')],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("'I Got Fired Becaused Of Covid'")],
                      ),
                      SizedBox(
                        height: 75,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "The Problem",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 40),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("defined based on your chihuahua")],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Where:'),
                          SizedBox(width: 10),
                          ElevatedButton(
                            child: Text(
                              'Workplace',
                              style: TextStyle(
                                color: AppColors.kAccentColor,
                              ),
                            ),
                            onPressed: () {
                              print('Pressed');
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('When:'),
                          SizedBox(width: 10),
                          ElevatedButton(
                            child: Text(
                              'Feb 2022',
                              style: TextStyle(
                                color: AppColors.kAccentColor,
                              ),
                            ),
                            onPressed: () {
                              print('Pressed');
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('What:'),
                          SizedBox(width: 10),
                          ElevatedButton(
                            child: Text(
                              'Job Dismissal',
                              style: TextStyle(
                                color: AppColors.kAccentColor,
                              ),
                            ),
                            onPressed: () {
                              print('Pressed');
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Why:'),
                          SizedBox(width: 10),
                          ElevatedButton(
                            child: Text(
                              'Covid-19',
                              style: TextStyle(color: AppColors.kAccentColor),
                            ),
                            onPressed: () {
                              print('Pressed');
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Your Emotions:'),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              '😡 Anger',
                              style: TextStyle(
                                  fontSize: 25, color: AppColors.kAccentColor),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : _processIndex == 2
                  ? Padding(
                      padding: const EdgeInsets.only(top: 150.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text('On Instrumental Complaint')],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text("'I Got Fired Becaused Of Covid'")],
                          ),
                          SizedBox(
                            height: 75,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "You Are Courageous",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: AppColors.kAccentColor),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text("And Follow-up is Key to Success")],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          MyStatefulWidget(),
                        ],
                      ),
                    )
                  : _processIndex == 3
                      ? Padding(
                          padding: const EdgeInsets.only(top: 150.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [Text('On Instrumental Complaint')],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("'I Got Fired Becaused Of Covid'")
                                ],
                              ),
                              SizedBox(
                                height: 75,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "We Are In This Together",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                        color: AppColors.kAccentColor),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.build_rounded,
                                  size: 30,
                                ),
                                title: Text('What solution did you try?'),
                                subtitle: Text('Type Here ...'),
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.query_builder_rounded,
                                  size: 30,
                                ),
                                title: Text('Any updates?'),
                                subtitle: Text('Type Here ...'),
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.medical_services_rounded,
                                  size: 30,
                                ),
                                title: Text('Is your problem solved?'),
                              ),

                              SizedBox(
                                height: 10,
                              ),

                              // MyStatefulWidget(),
                            ],
                          ))
                      : Padding(
                          padding: const EdgeInsets.only(top: 150.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [Text('On Instrumental Complaint')],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("'I Got Fired Becaused Of Covid'")
                                ],
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Congratulations!",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                        color: AppColors.kAccentColor),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "We Are So Proud Of You.",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                        color: AppColors.kAccentColor),
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 50,
                              ),

                              Container(
                                color: AppColors.kPrimaryColor,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "How Are You Feeling Now?",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Glassmorphism(
                                              blur: 20,
                                              opacity: 0.1,
                                              radius: 10,
                                              child: TextButton(
                                                onPressed: () {
                                                  // handle push to HomeScreen
                                                },
                                                child: Container(
                                                  child: const Text(
                                                    '☺️',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 25.0,
                                                    ),
                                                  ),
                                                ),
                                                style: ButtonStyle(
                                                  padding:
                                                      MaterialStateProperty.all(
                                                          EdgeInsets.all(5)),
                                                  shape:
                                                      MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Happiness',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          children: [
                                            Glassmorphism(
                                              blur: 20,
                                              opacity: 0.1,
                                              radius: 10,
                                              child: TextButton(
                                                onPressed: () {
                                                  // handle push to HomeScreen
                                                },
                                                child: Container(
                                                  child: const Text(
                                                    '🤮',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 25.0,
                                                    ),
                                                  ),
                                                ),
                                                style: ButtonStyle(
                                                  padding:
                                                      MaterialStateProperty.all(
                                                          EdgeInsets.all(5)),
                                                  shape:
                                                      MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Disgust',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Glassmorphism(
                                              blur: 20,
                                              opacity: 0.1,
                                              radius: 10,
                                              child: TextButton(
                                                onPressed: () {
                                                  // handle push to HomeScreen
                                                },
                                                child: Container(
                                                  child: const Text(
                                                    '😢',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 25.0,
                                                    ),
                                                  ),
                                                ),
                                                style: ButtonStyle(
                                                  padding:
                                                      MaterialStateProperty.all(
                                                          EdgeInsets.all(5)),
                                                  shape:
                                                      MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Sadness',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          children: [
                                            Glassmorphism(
                                              blur: 20,
                                              opacity: 0.1,
                                              radius: 10,
                                              child: TextButton(
                                                onPressed: () {
                                                  // handle push to HomeScreen
                                                },
                                                child: Container(
                                                  child: const Text(
                                                    '😡',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 25.0,
                                                    ),
                                                  ),
                                                ),
                                                style: ButtonStyle(
                                                  padding:
                                                      MaterialStateProperty.all(
                                                          EdgeInsets.all(5)),
                                                  shape:
                                                      MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Anger',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Glassmorphism(
                                              blur: 20,
                                              opacity: 0.1,
                                              radius: 10,
                                              child: TextButton(
                                                onPressed: () {
                                                  // handle push to HomeScreen
                                                },
                                                child: Container(
                                                  child: const Text(
                                                    '😣',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 25.0,
                                                    ),
                                                  ),
                                                ),
                                                style: ButtonStyle(
                                                  padding:
                                                      MaterialStateProperty.all(
                                                          EdgeInsets.all(5)),
                                                  shape:
                                                      MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Fear',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          children: [
                                            Glassmorphism(
                                              blur: 20,
                                              opacity: 0.1,
                                              radius: 10,
                                              child: TextButton(
                                                onPressed: () {
                                                  // handle push to HomeScreen
                                                },
                                                child: Container(
                                                  child: const Text(
                                                    '😱',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 25.0,
                                                    ),
                                                  ),
                                                ),
                                                style: ButtonStyle(
                                                  padding:
                                                      MaterialStateProperty.all(
                                                          EdgeInsets.all(5)),
                                                  shape:
                                                      MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Surprise',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              // MyStatefulWidget(),
                            ],
                          ),
                        )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.chevron_right),
        onPressed: () {
          if (_processIndex != 4) {
            setState(() {
              _processIndex = (_processIndex + 1);
            });
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CalendarView(),
              ),
            );
          }
        },
        backgroundColor: inProgressColor,
      ),
    );
  }
}

/// hardcoded bezier painter
/// TODO: Bezier curve into package component
class _BezierPainter extends CustomPainter {
  const _BezierPainter({
    required this.color,
    this.drawStart = true,
    this.drawEnd = true,
  });

  final Color color;
  final bool drawStart;
  final bool drawEnd;

  Offset _offset(double radius, double angle) {
    return Offset(
      radius * cos(angle) + radius,
      radius * sin(angle) + radius,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;

    final radius = size.width / 2;

    var angle;
    var offset1;
    var offset2;

    var path;

    if (drawStart) {
      angle = 3 * pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);
      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(0.0, size.height / 2, -radius,
            radius) // TODO connector start & gradient
        ..quadraticBezierTo(0.0, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
    if (drawEnd) {
      angle = -pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);

      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(size.width, size.height / 2, size.width + radius,
            radius) // TODO connector end & gradient
        ..quadraticBezierTo(size.width, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(_BezierPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.drawStart != drawStart ||
        oldDelegate.drawEnd != drawEnd;
  }
}

final _processes = [
  'Voice Out',
  'Define',
  'Solutions',
  'Action',
  'Review',
];
