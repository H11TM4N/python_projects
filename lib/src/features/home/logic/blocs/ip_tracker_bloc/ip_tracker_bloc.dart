import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ip_address_tracker/src/features/home/logic/blocs/ip_tracker_bloc/ip_tracker_event.dart';
import 'package:ip_address_tracker/src/features/home/logic/blocs/ip_tracker_bloc/ip_tracker_state.dart';
import 'package:ip_address_tracker/src/features/home/logic/services/services.dart';

class IpTrackerBloc extends Bloc<IpTrackerEvent, IpTrackerState> {
  final IpTrackerService service;
  IpTrackerBloc({
    required this.service,
  }) : super(IpTrackerInitial()) {
    on<GetAddressDetails>((event, emit) async {
      try {
        emit(IpTrackerLoading());
        final ipDetails = await service.fetchIpDetails(event.ipAddress);
        emit(IpTrackerLoaded(ipResponse: ipDetails));
      } catch (e, stack) {
        emit(IpTrackerError(message: '$e'));
        log(e.toString(), stackTrace: stack);
      }
    });
  }
}
