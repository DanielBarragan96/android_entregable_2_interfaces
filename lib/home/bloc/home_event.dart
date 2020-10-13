part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class ScanPicture extends HomeEvent {
  final bool barcodeScan;

  ScanPicture({@required this.barcodeScan});
  @override
  List<Object> get props => [barcodeScan];
}

class MenuChatEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}
