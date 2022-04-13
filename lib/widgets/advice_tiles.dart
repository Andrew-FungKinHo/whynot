import 'package:flutter/material.dart';
import 'package:whynot/constants.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  late bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      child: Column(
        children: <Widget>[
          ExpansionTile(
            title: Text(
              'Seek Advice From Professionals',
            ),

            // children: <Widget>[
            //   ListTile(title: Text('This is tile number 1')),
            // ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: ExpansionTile(
              // collapsedBackgroundColor: AppColors.kPrimaryColor,
              title: Text(
                'Research Your Rights',
                style: TextStyle(
                    color: _customTileExpanded
                        ? Colors.white
                        : AppColors.kAccentColor),
              ),
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    bottomLeft: Radius.circular(32),
                  ),
                  child: ListTile(
                    title: Text(
                      'Obligations And Rights Of Employers And Employees Relating To The Coronovirus Disease 2019',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'HK Labour Department website',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
              backgroundColor: AppColors.kAccentColor,
              // textColor: AppColors.kPrimaryColor,
              iconColor: Colors.white,
              // collapsedTextColor: AppColors.kAccentColor,
              // collapsedIconColor: Colors.white,
              onExpansionChanged: (bool) {
                setState(() {
                  _customTileExpanded = !_customTileExpanded;
                });
              },
            ),
          ),
          ExpansionTile(
            title: Text('Look For Support Groups'),
          ),
        ],
      ),
    );
  }
}
