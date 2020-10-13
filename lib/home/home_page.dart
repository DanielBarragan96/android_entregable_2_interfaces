import 'package:entregable_2/chat/menu_chat_page.dart';
import 'package:entregable_2/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc _bloc;

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      drawer: _showDrawer(),
      appBar: AppBar(
        // leading: IconButton(
        //   icon: FaIcon(FontAwesomeIcons.bars),
        //   onPressed: () {},
        //   iconSize: 20.0,
        // ),
        //TODO change appbar title with bloc
        title: _getAppBarTitle(),
      ),
      bottomNavigationBar: BlocProvider(
        create: (context) {
          return _bloc;
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return SizedBox(
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
                          _bloc.add(MenuStatsEvent());
                        },
                        iconSize: 20.0,
                        color: kWhite,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: IconButton(
                        icon: FaIcon(FontAwesomeIcons.mapMarkedAlt),
                        onPressed: () {
                          _bloc.add(MenuMapEvent());
                        },
                        iconSize: 20.0,
                        color: kWhite,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: IconButton(
                        icon: FaIcon(FontAwesomeIcons.users),
                        onPressed: () {
                          _bloc.add(MenuChatEvent());
                        },
                        iconSize: 20.0,
                        color: kWhite,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      body: BlocProvider(
        create: (context) {
          _bloc = HomeBloc();
          return _bloc;
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            // if (state is Results) {
            //   return Center(child: Text("Seleccione accion del menu superior"));
            // }
            if (state is MenuChatState) {
              return MenuChatPage();
            } else
              return Center();
          },
        ),
      ),
    );
  }

  Widget _showDrawer() {
    return Drawer();
  }

  Widget _getAppBarTitle() {
    if (_bloc != null) {
      if (_bloc.state is MenuStatsState) {
        return Text("Stats");
      }
      if (_bloc.state is MenuMapState) {
        return Text("Map");
      }
      if (_bloc.state is MenuChatState) {
        return Text("Chats");
      }
    }
    return Container();
  }
}
