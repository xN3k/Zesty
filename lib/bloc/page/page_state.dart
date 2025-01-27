part of 'page_bloc.dart';

class PageState extends Equatable {
  final int currentPage;

  const PageState({required this.currentPage});

  PageState copyWith({int? currentPage}) {
    return PageState(currentPage: currentPage ?? this.currentPage);
  }

  @override
  List<Object?> get props => [currentPage];
}
