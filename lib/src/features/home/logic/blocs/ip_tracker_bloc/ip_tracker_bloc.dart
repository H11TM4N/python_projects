
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ip_address_tracker/src/features/home/logic/blocs/ip_tracker_bloc/ip_tracker_event.dart';
import 'package:ip_address_tracker/src/features/home/logic/blocs/ip_tracker_bloc/ip_tracker_state.dart';

class IpTrackerBloc extends Bloc<IpTrackerEvent, IpTrackerState> {
  IpTrackerBloc() : super(IpTrackerState()) {
    on<IpTrackerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
