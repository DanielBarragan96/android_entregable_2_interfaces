import 'package:entregable_2/colors.dart';
import 'package:flutter/material.dart';

class MenuChatPage extends StatefulWidget {
  MenuChatPage({
    Key key,
  }) : super(key: key);

  @override
  _MenuChatPageState createState() => _MenuChatPageState();
}

class _MenuChatPageState extends State<MenuChatPage> {
  List<Map<String, dynamic>> _data = [
    {
      "picture": "https://randomuser.me/api/portraits/men/0.jpg",
      "name": "Juan Perez",
    },
    {
      "picture": "https://randomuser.me/api/portraits/men/1.jpg",
      "name": "Juan Perez 2",
    },
    {
      "picture": "https://randomuser.me/api/portraits/men/2.jpg",
      "name": "Juan Perez 3",
    },
    {
      "picture": "https://randomuser.me/api/portraits/men/3.jpg",
      "name": "Juan Perez 4",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: kLightPurple,
            ),
            itemCount: _data.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Image.network(_data[index]["picture"]),
                title: Text(
                  "${_data[index]["name"]}",
                  style: TextStyle(color: kWhite),
                ),
                // trailing: Icon(
                //   FontAwesomeIcons.angleDown,
                //   color: kWhite,
                // ),
              );
            },
          ),
        ),
      ],
    );
  }
}
