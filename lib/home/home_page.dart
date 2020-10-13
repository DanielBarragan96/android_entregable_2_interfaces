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
      drawer: _showDrawer(),
      appBar: AppBar(
          // leading: IconButton(
          //   icon: FaIcon(FontAwesomeIcons.bars),
          //   onPressed: () {},
          //   iconSize: 20.0,
          // ),
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
            return Center(child: Text("Seleccione accion del menu superior"));
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
}
