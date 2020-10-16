import 'package:entregable_2/colors.dart';
import 'package:entregable_2/home/bloc/home_bloc.dart';
import 'package:entregable_2/home/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget menuMapPage(HomeBloc _bloc, BuildContext context) {
  return Scaffold(
    backgroundColor: kBlack,
    drawer: DrawerWidget(),
    appBar: AppBar(
      title: Text("Map"),
    ),
    body: BlocProvider(
      create: (context) {
        return _bloc;
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        cubit: _bloc,
        builder: (context, state) {
          if (state is MenuStatsState) {
            return Column(
              children: [
                SizedBox(height: 20),
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
                  _bloc.add(MenuStatsEvent());
                },
                iconSize: 25.0,
                color: kLightGray,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: IconButton(
                icon: FaIcon(FontAwesomeIcons.mapMarkedAlt),
                onPressed: () {},
                iconSize: 25.0,
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
                iconSize: 25.0,
                color: kLightGray,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
