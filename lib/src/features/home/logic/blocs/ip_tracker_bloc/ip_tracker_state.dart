import 'package:equatable/equatable.dart';
import 'package:ip_address_tracker/src/features/home/data/data.dart';

abstract class IpTrackerState extends Equatable {
  @override
  List<Object> get props => [];
}

class IpTrackerInitial extends IpTrackerState {}

class IpTrackerLoading extends IpTrackerState {}

class IpTrackerLoaded extends IpTrackerState {
  final IpResponse ipResponse;

  IpTrackerLoaded({required this.ipResponse});

  @override
  List<Object> get props => [ipResponse];
}

class IpTrackerError extends IpTrackerState {
  final String message;

  IpTrackerError({required this.message});

  @override
  List<Object> get props => [message];
}
