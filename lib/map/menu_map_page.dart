import 'package:entregable_2/colors.dart';
import 'package:entregable_2/home/bloc/home_bloc.dart';
import 'package:entregable_2/home/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuMapPage extends StatefulWidget {
  final HomeBloc bloc;
  MenuMapPage({Key key, @required this.bloc}) : super(key: key);

  @override
  _MenuMapPageState createState() => _MenuMapPageState();
}

class _MenuMapPageState extends State<MenuMapPage> {

  HomeBloc _blocMenuMap;

  @override
  void dispose() {
    _blocMenuMap.close();
    super.dispose();
  }

  @override
  void initState() {
    _blocMenuMap = widget.bloc;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text("Map"),
      ),
      body: BlocProvider(
        create: (context) {
          return _blocMenuMap;
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is MenuMapState) {
              return Column();
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
                    _blocMenuMap.add(MenuStatsEvent());
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
                    _blocMenuMap.add(MenuMapEvent());
                  },
                  iconSize: 25.0,
                  color: kWhite,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: IconButton(
                  icon: FaIcon(FontAwesomeIcons.users),
                  onPressed: () {
                    _blocMenuMap.add(MenuChatEvent());
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
}
