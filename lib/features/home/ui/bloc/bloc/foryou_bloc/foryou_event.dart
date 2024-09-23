part of 'foryou_bloc.dart';

class ForyouEvent extends Equatable {
  const ForyouEvent();

  @override
  List<Object> get props => [];
}

class FetchDataEvent extends ForyouEvent {
  const FetchDataEvent();
  @override
  List<Object> get props => [];
}

class GetByIdEvent extends ForyouEvent {
  final int id;
  const GetByIdEvent({required this.id});
  @override
  List<Object> get props => [id];
}
