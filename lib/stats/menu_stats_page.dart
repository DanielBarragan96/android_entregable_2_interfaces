import 'package:entregable_2/colors.dart';
import 'package:entregable_2/home/bloc/home_bloc.dart';
import 'package:entregable_2/home/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuStatsPage extends StatefulWidget {
  final HomeBloc bloc;
  MenuStatsPage({Key key, @required this.bloc}) : super(key: key);

  @override
  _MenuStatsPageState createState() => _MenuStatsPageState();
}

class _MenuStatsPageState extends State<MenuStatsPage> {
  HomeBloc _blocMenuStats;

  @override
  void dispose() {
    _blocMenuStats.close();
    super.dispose();
  }

  @override
  void initState() {
    _blocMenuStats = widget.bloc;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text("Stats"),
      ),
      body: BlocProvider(
        create: (context) {
          return _blocMenuStats;
        },
        child: BlocBuilder<HomeBloc, HomeState>(
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
                  onPressed: () {},
                  iconSize: 25.0,
                  color: kWhite,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: IconButton(
                  icon: FaIcon(FontAwesomeIcons.mapMarkedAlt),
                  onPressed: () {
                    _blocMenuStats.add(MenuMapEvent());
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
                    _blocMenuStats.add(MenuChatEvent());
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
