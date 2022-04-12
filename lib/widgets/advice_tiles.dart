import 'package:flutter/material.dart';
import 'package:whynot/constants.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
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
            collapsedBackgroundColor: AppColors.kPrimaryColor,
            title: Text(
              'Research Your Rights',
              style: TextStyle(color: Colors.white),
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
            textColor: AppColors.kPrimaryColor,
            iconColor: Colors.white,
            collapsedIconColor: Colors.white,
          ),
        ),
        ExpansionTile(
          title: Text('Look For Support Groups'),
        ),
      ],
    );
  }
}
