import 'package:equatable/equatable.dart';

abstract class IpTrackerEvent extends Equatable {
  const IpTrackerEvent();

  @override
  List<Object> get props => [];
}

class GetAddressDetails extends IpTrackerEvent {
  final String ipAddress;
  const GetAddressDetails({
    required this.ipAddress,
  });

  @override
  List<Object> get props => [ipAddress];
}
