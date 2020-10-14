import 'package:entregable_2/chat/menu_chat_page.dart';
import 'package:entregable_2/colors.dart';
import 'package:entregable_2/stats/menu_stats_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  Widget _stats;
  Widget _map;
  Widget _chat;

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      body: BlocProvider(
        create: (context) {
          _bloc = HomeBloc();
          _stats = MenuStatsPage(
            bloc: _bloc,
          );
          // _map;//TODO map UI
          _chat = MenuChatPage(
            bloc: _bloc,
          );
          return _bloc;
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            //TODO add all menus
            if (state is MenuStatsState) {
              return _stats;
            }
            if (state is MenuChatState) {
              return _chat;
            } else
              return Center();
          },
        ),
      ),
    );
  }
}
