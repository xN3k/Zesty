part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PageChanged extends PageEvent {
  final int pageIndex;

  PageChanged(this.pageIndex);
}
