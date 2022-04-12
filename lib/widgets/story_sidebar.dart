import 'package:flutter/material.dart';

class StorySideBar extends StatelessWidget {
  const StorySideBar({Key? key}) : super(key: key);
  final double _iconSize = 32;

  void showCustomDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext cxt) {
        return Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Material(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.cancel_rounded),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.sentiment_very_dissatisfied_outlined,
                          color: Colors.red.shade200,
                        ),
                        Icon(
                          Icons.sentiment_very_dissatisfied_outlined,
                          color: Colors.red.shade300,
                        ),
                        Icon(
                          Icons.sentiment_very_dissatisfied_outlined,
                          color: Colors.red.shade400,
                        ),
                        Icon(
                          Icons.sentiment_very_dissatisfied_outlined,
                          color: Colors.red.shade500,
                        ),
                        Icon(
                          Icons.sentiment_very_dissatisfied_outlined,
                          color: Colors.red.shade600,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            '80% Says 爆了',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            'Nei Leh?',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                                Icons.sentiment_very_dissatisfied_outlined)),
                        Icon(
                          Icons.sentiment_very_dissatisfied_outlined,
                        ),
                        Icon(
                          Icons.sentiment_very_dissatisfied_outlined,
                        ),
                        Icon(
                          Icons.sentiment_very_dissatisfied_outlined,
                        ),
                        Icon(
                          Icons.sentiment_very_dissatisfied_outlined,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            '係我就唔忍！',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // IconButton(
          //   onPressed: () => {},
          //   icon: Icon(Icons.favorite),
          //   iconSize: _iconSize,
          //   color: Colors.red,
          // ),
          // Text(
          //   '1.34k',
          //   style: TextStyle(
          //       fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          // IconButton(
          //   onPressed: () => {},
          //   icon: Icon(Icons.chat_bubble_outline),
          //   iconSize: _iconSize,
          //   color: Colors.white,
          // ),
          // Text(
          //   '22',
          //   style: TextStyle(
          //       fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          // IconButton(
          //   onPressed: () => {},
          //   icon: Icon(Icons.send_outlined),
          //   iconSize: _iconSize,
          //   color: Colors.white,
          // ),
          // IconButton(
          //   onPressed: () => {},
          //   icon: Icon(Icons.more_horiz),
          //   iconSize: _iconSize,
          //   color: Colors.white,
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          IconButton(
            onPressed: () {},
            iconSize: _iconSize,
            icon: Icon(
              Icons.sentiment_very_dissatisfied_rounded,
              color: Colors.red.shade100,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          IconButton(
            onPressed: () {},
            iconSize: _iconSize,
            icon: Icon(
              Icons.sentiment_very_dissatisfied_rounded,
              color: Colors.red.shade200,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          IconButton(
            onPressed: () {
              showCustomDialog(context);
            },
            iconSize: _iconSize,
            icon: Icon(
              Icons.sentiment_very_dissatisfied_rounded,
              color: Colors.red.shade300,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          IconButton(
            onPressed: () {},
            iconSize: _iconSize,
            icon: Icon(
              Icons.sentiment_very_dissatisfied_rounded,
              color: Colors.red.shade400,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          IconButton(
            onPressed: () {},
            iconSize: _iconSize,
            icon: Icon(
              Icons.sentiment_very_dissatisfied_rounded,
              color: Colors.red.shade500,
            ),
          ),

          SizedBox(
            height: 150,
          ),
        ],
      ),
    );
  }
}
