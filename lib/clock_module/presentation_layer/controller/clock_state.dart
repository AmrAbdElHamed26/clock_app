part of 'clock_bloc.dart';

class ClockState extends Equatable {
  const ClockState();

  @override
  List<Object?> get props => [];
}


class CurrentPageChangedState extends ClockState{
  final int pageNumber ;
  const CurrentPageChangedState(this.pageNumber);

  @override
  List<Object> get props =>[pageNumber];

}