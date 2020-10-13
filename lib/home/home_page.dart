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
  final List<String> _choices = [
    "Barcode",
    "Image labeling",
  ];

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
        title: _getAppBarLeading(),
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
                        onPressed: () {},
                        iconSize: 20.0,
                        color: kWhite,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: IconButton(
                        icon: FaIcon(FontAwesomeIcons.mapMarkedAlt),
                        onPressed: () {},
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

  void _onActionSelected(String action) {
    if (action == "Barcode") {
      _bloc.add(ScanPicture(barcodeScan: true));
    } else if (action == "Image labeling") {
      _bloc.add(ScanPicture(barcodeScan: false));
    }
  }

  Widget _showDrawer() {
    return Drawer();
  }

  Widget _getAppBarLeading() {
    if (_bloc != null) {
      if (_bloc.state is MenuChatState) {
        return Text("Chats");
      }
    }
    return Container();
  }
}
