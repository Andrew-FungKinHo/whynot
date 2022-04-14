import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:marquee/marquee.dart';
import "dart:math";

var list = [
  "andrewIsDepressed · Follow",
  "theoJames · Follow",
  "rogerMatthias · Follow",
  "Lilly Reynolds · Follow",
  "Rogerphillips · Follow"
];

var nameList = [
  "Theo",
  "Sam",
  "Kyle",
  "Jaman",
  "Nelson",
];

var titleList = [
  "I mean, what is this kind of customer service?",
  "I can't believe it. I had the most terrible day at work",
  "I can't be the only one who has a problem with this",
  "What on earth is this?",
];

var websiteString = [
  "https://picsum.photos/199",
  "https://picsum.photos/200",
  "https://picsum.photos/201",
];
// generates a new Random object
final _random = new Random();

class StoryDetails extends StatelessWidget {
  const StoryDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      child: Column(
        children: [
          ListTile(
            dense: true,
            minLeadingWidth: 0,
            horizontalTitleGap: 12,
            title: Text(
              list[_random.nextInt(list.length)],
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
            leading: CircleAvatar(
              radius: 14,
              backgroundImage: NetworkImage(
                  websiteString[_random.nextInt(websiteString.length)]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: ExpandableText(
              "# Hot # Work This company has the worst working culture. Here's what I have to say about it. 1. Understaffed yet has aggressive timeline under poor project management2. High developer turnover rate (20%+), some even left the firm after working for less than a year3. Management values performance and results way more than employee health during outbreak of novel coronavirus, lies 'most government offices will return to work as normal starting Feb 3' and hence expecting people to be back to office starting Feb 3. The fact is that government extended the work from home arrangement multiple times (extended to Mar 1 as of writing)4. Company claims it's 'finalizing' medical benefits for employee in Hong Kong office in early 2019, yet it is still 'finalizing' with end of Feb 2020 as target date as of writing5. Stingy management doesn't even give red packets to all employee in Hong Kong office for work resumption after Lunar New Year6.Poor office environment with small desks",
              style: TextStyle(
                  fontSize: 12.5,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
              expandText: 'more',
              collapseText: 'less',
              expandOnTextTap: true,
              collapseOnTextTap: true,
              maxLines: 1,
              linkColor: Colors.grey,
            ),
          ),
          ListTile(
            dense: true,
            minLeadingWidth: 0,
            horizontalTitleGap: 5,
            title: Row(
              children: [
                Container(
                  height: 20,
                  width: 125,
                  child: Marquee(
                    text: titleList[_random.nextInt(titleList.length)],
                    scrollAxis: Axis.horizontal,
                    velocity: 15,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Icon(
                    Icons.person_outline_outlined,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
                Expanded(
                  child: Text(
                    "narration by ${nameList[_random.nextInt(nameList.length)]}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
            // Text(
            //   "music title - original music",
            //   style:
            //       TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            // ),
            leading: Icon(
              Icons.graphic_eq_outlined,
              size: 16,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
