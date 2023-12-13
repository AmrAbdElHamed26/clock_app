part of 'clock_bloc.dart';

abstract class ClockEvent extends Equatable {
  const ClockEvent();

  @override
  List<Object> get props =>[];
}

class ChangePageEvent extends ClockEvent {
  final int pageNumber ;

  const ChangePageEvent({required this.pageNumber});

  @override
  List<Object> get props {
    return [pageNumber];
  }
}