import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:whynot/constants.dart';
import 'package:whynot/pages/homepage.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({Key? key}) : super(key: key);

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  late DateTime selectedDay = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day + 2);
  late List<CleanCalendarEvent> selectedEvent;
  late bool isExpanded = false;

  final Map<DateTime, List<CleanCalendarEvent>> events = {
    DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day - 13): [
      CleanCalendarEvent('Growths of the Day',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          // description: 'A special event',
          color: AppColors.kAccentColor,
          isDone: false),
    ],
    DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day - 12): [
      CleanCalendarEvent('Growths of the Day',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          // description: 'A special event',
          color: AppColors.kAccentColor,
          isDone: false),
    ],
    DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day - 11): [
      CleanCalendarEvent('Growths of the Day',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          // description: 'A special event',
          color: AppColors.kAccentColor,
          isDone: false),
    ],
    DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day - 10): [
      CleanCalendarEvent('Growths of the Day',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          // description: 'A special event',
          color: AppColors.kAccentColor,
          isDone: true),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 9):
        [
      CleanCalendarEvent('Growths of the Day',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          // description: 'A special event',
          color: AppColors.kAccentColor,
          isDone: false),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 8):
        [
      CleanCalendarEvent('Growths of the Day',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          // description: 'A special event',
          color: AppColors.kAccentColor,
          isDone: true),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 7):
        [
      CleanCalendarEvent('Growths of the Day',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          // description: 'A special event',
          color: AppColors.kAccentColor,
          isDone: true),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 6):
        [
      CleanCalendarEvent('Growths of the Day',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          // description: 'A special event',
          color: AppColors.kAccentColor,
          isDone: true),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 5):
        [
      CleanCalendarEvent('Growths of the Day',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          // description: 'A special event',
          color: AppColors.kAccentColor,
          isDone: false),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 4):
        [
      CleanCalendarEvent('Growths of the Day',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          // description: 'A special event',
          color: AppColors.kAccentColor,
          isDone: true),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 3):
        [
      CleanCalendarEvent('Growths of the Day',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          // description: 'A special event',
          color: AppColors.kAccentColor,
          isDone: false),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 2):
        [
      CleanCalendarEvent('Growths of the Day',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          // description: 'A special event',
          color: AppColors.kAccentColor,
          isDone: true),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 1):
        [
      CleanCalendarEvent('Growths of the Day',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          // description: 'A special event',
          color: AppColors.kAccentColor,
          isDone: false),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day): [
      CleanCalendarEvent('Growths of the Day',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          // description: 'A special event',
          color: AppColors.kAccentColor),
      CleanCalendarEvent('Invigorate',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 14, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 15, 0),
          description:
              'Kickstart your day with a refreshing exercise / stretch!',
          color: Colors.white),
      CleanCalendarEvent('Spread Joy',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 15, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 16, 0),
          description:
              'Share your reasons of happieness to family, friends or even strangers!',
          color: Colors.white),
      CleanCalendarEvent('Gratitudes',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 16, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 17, 0),
          description: 'Send your thanksgiving to ones who support you!',
          color: Colors.white),
    ],
    DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day + 14): [
      CleanCalendarEvent('Event B',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 12, 0),
          color: Colors.orange),
      CleanCalendarEvent('Event C',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 17, 0),
          color: Colors.pink,
          isDone: true),
    ],
    DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day + 15): [
      CleanCalendarEvent('Event B',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 12, 0),
          color: Colors.orange),
      CleanCalendarEvent('Event C',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 17, 0),
          color: Colors.pink,
          isDone: true),
    ],
    DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day + 16): [
      CleanCalendarEvent('Event B',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 12, 0),
          color: Colors.orange),
      CleanCalendarEvent('Event C',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 17, 0),
          color: Colors.pink),
      CleanCalendarEvent('Event D',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 17, 0),
          color: Colors.amber),
      CleanCalendarEvent('Event E',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 17, 0),
          color: Colors.deepOrange),
      CleanCalendarEvent('Event F',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 17, 0),
          color: Colors.white),
      CleanCalendarEvent('Event G',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 17, 0),
          color: Colors.indigo),
      CleanCalendarEvent('Event H',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 17, 0),
          color: Colors.brown),
    ],
    DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day + 13): [
      CleanCalendarEvent('Growths of the Day',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          // description: 'A special event',
          color: AppColors.kAccentColor,
          isDone: false),
    ],
    DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day + 12): [
      CleanCalendarEvent('Growths of the Day',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          // description: 'A special event',
          color: AppColors.kAccentColor,
          isDone: false),
    ],
    DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day + 11): [
      CleanCalendarEvent('Growths of the Day',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          // description: 'A special event',
          color: AppColors.kAccentColor,
          isDone: false),
    ],
    DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day + 10): [
      CleanCalendarEvent('Growths of the Day',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          // description: 'A special event',
          color: AppColors.kAccentColor,
          isDone: true),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 9):
        [
      CleanCalendarEvent('Growths of the Day',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          // description: 'A special event',
          color: AppColors.kAccentColor,
          isDone: false),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 8):
        [
      CleanCalendarEvent('Growths of the Day',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          // description: 'A special event',
          color: AppColors.kAccentColor,
          isDone: true),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 7):
        [
      CleanCalendarEvent('Growths of the Day',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          // description: 'A special event',
          color: AppColors.kAccentColor,
          isDone: true),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 6):
        [
      CleanCalendarEvent('Growths of the Day',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          // description: 'A special event',
          color: AppColors.kAccentColor,
          isDone: true),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 5):
        [
      CleanCalendarEvent('Growths of the Day',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          // description: 'A special event',
          color: AppColors.kAccentColor,
          isDone: false),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 4):
        [
      CleanCalendarEvent('Growths of the Day',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          // description: 'A special event',
          color: AppColors.kAccentColor,
          isDone: true),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 3):
        [
      CleanCalendarEvent('Growths of the Day',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          // description: 'A special event',
          color: AppColors.kAccentColor,
          isDone: false),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2):
        [
      CleanCalendarEvent('Growths of the Day',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          // description: 'A special event',
          color: AppColors.kAccentColor,
          isDone: true),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 1):
        [
      CleanCalendarEvent('Growths of the Day',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          // description: 'A special event',
          color: AppColors.kAccentColor,
          isDone: false),
    ],
  };
  void _handleData(date) {
    setState(() {
      selectedDay = date;
      selectedEvent = events[selectedDay] ?? [];
    });
    print(selectedDay);
  }

  @override
  void initState() {
    // TODO: implement initState
    selectedEvent = events[selectedDay] ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Journey'),
        centerTitle: true,
        backgroundColor: AppColors.kPrimaryColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            // color: Colors.amber,
            child: Calendar(
              startOnMonday: true,
              selectedColor: AppColors.kAccentColor,
              todayColor: AppColors.kAccentColor,
              eventColor: Colors.green,
              eventDoneColor: Colors.amber,
              bottomBarColor: AppColors.kAccentColor,
              onRangeSelected: (range) {
                print('selected Day ${range.from},${range.to}');
              },
              onDateSelected: (date) {
                return _handleData(date);
              },
              events: events,
              onEventSelected: (CleanCalendarEvent) {
                print("event is selected");
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              expandableDateFormat: 'EEEE, dd. MMMM yyyy',
              isExpanded: true,
              dayOfWeekStyle: TextStyle(
                fontSize: 15,
                color: AppColors.bluewhitegrey,
                fontWeight: FontWeight.w100,
              ),
              bottomBarTextStyle: TextStyle(
                color: Colors.white,
              ),
              hideBottomBar: false,
              hideArrows: false,
              weekDays: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.chevron_right,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        },
        backgroundColor: AppColors.kAccentColor,
      ),
    );
  }
}
