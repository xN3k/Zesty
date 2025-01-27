import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(const PageState(currentPage: 0)) {
    on<PageChanged>(_onPageChanged);
  }

  void _onPageChanged(PageChanged event, Emitter<PageState> emit) {
    emit(state.copyWith(currentPage: event.pageIndex));
  }
}
