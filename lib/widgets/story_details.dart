import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:marquee/marquee.dart';

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
              "nelsonIsDepressed · Follow",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
            leading: CircleAvatar(
              radius: 14,
              backgroundImage: NetworkImage(
                  "https://avatars.githubusercontent.com/u/58603176?s=400&u=d619d48544afb3ad4c379cd3b092c0cb6f02910b&v=4"),
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
                    text:
                        "I can't believe it. I had the most terrible day at work",
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
                    "narration by Nelson",
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
