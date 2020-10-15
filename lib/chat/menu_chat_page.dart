import 'package:entregable_2/colors.dart';
import 'package:entregable_2/home/bloc/home_bloc.dart';
import 'package:entregable_2/home/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuChatPage extends StatefulWidget {
  final HomeBloc bloc;
  MenuChatPage({Key key, @required this.bloc}) : super(key: key);

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

  HomeBloc _blocMenuChat;

  @override
  void dispose() {
    _blocMenuChat.close();
    super.dispose();
  }

  @override
  void initState() {
    _blocMenuChat = widget.bloc;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text("Chat"),
      ),
      body: BlocProvider(
        create: (context) {
          return _blocMenuChat;
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is MenuChatState) {
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
                        );
                      },
                    ),
                  ),
                ],
              );
            } else
              return Center();
          },
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height / 10,
        child: Container(
          color: kMainPurple,
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: IconButton(
                  icon: FaIcon(FontAwesomeIcons.spotify),
                  onPressed: () {
                    _blocMenuChat.add(MenuStatsEvent());
                  },
                  iconSize: 25.0,
                  color: kLightGray,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: IconButton(
                  icon: FaIcon(FontAwesomeIcons.mapMarkedAlt),
                  onPressed: () {
                    _blocMenuChat.add(MenuMapEvent());
                  },
                  iconSize: 25.0,
                  color: kLightGray,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: IconButton(
                  icon: FaIcon(FontAwesomeIcons.users),
                  onPressed: () {
                    _blocMenuChat.add(MenuChatEvent());
                  },
                  iconSize: 25.0,
                  color: kWhite,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
