import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ip_address_tracker/src/features/home/logic/blocs/blocs.dart';
import 'package:ip_address_tracker/src/features/home/presentation/components/app_textfield.dart';
import 'package:ip_address_tracker/src/shared/shared.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textFieldController = useTextEditingController();
    final Completer<GoogleMapController> mapController =
        Completer<GoogleMapController>();

    const CameraPosition initialPosition = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746,
    );

    final showAdditionalDetails = useState<bool>(false);

    void trackIpAddress() {
      final ipAddress = textFieldController.text.trim();
      if (ipAddress.isNotEmpty) {
        FocusScope.of(context).unfocus();
        showAdditionalDetails.value = true;
        context
            .read<IpTrackerBloc>()
            .add(GetAddressDetails(ipAddress: ipAddress));
      }
    }

    void showError(String errorMessage) {
      AppSnackbar(context).showErrorSnackbar(errorMessage);
    }

    return BlocConsumer<IpTrackerBloc, IpTrackerState>(
      listener: (_, state) async {
        if (state is IpTrackerLoaded) {
          final GoogleMapController controller = await mapController.future;
          controller
              .animateCamera(CameraUpdate.newLatLng(state.ipResponse.latlng));
          await controller.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: state.ipResponse.latlng,
                zoom: 11,
              ),
            ),
          );
        }
        if (state is IpTrackerError) {
          showError(state.message);
        }
      },
      builder: (_, state) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (_, __) {
            showAdditionalDetails.value = false;
          },
          child: Scaffold(
            body: Stack(
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 300,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF5F86F2),
                                Color(0xFF443D97),
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 2),
                                blurRadius: 20,
                                spreadRadius: 0,
                                color: Colors.black.withOpacity(.01),
                              ),
                            ],
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/icons/lines.svg',
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    Expanded(
                      child: GoogleMap(
                        initialCameraPosition: initialPosition,
                        onMapCreated: (GoogleMapController controller) {
                          mapController.complete(controller);
                        },
                        zoomControlsEnabled: false,
                        zoomGesturesEnabled: true,
                        gestureRecognizers: {
                          Factory<OneSequenceGestureRecognizer>(
                              () => EagerGestureRecognizer())
                        },
                        markers: {
                          if (state is IpTrackerLoaded)
                            Marker(
                              markerId: const MarkerId('source'),
                              position: state.ipResponse.latlng,
                              icon: BitmapDescriptor.defaultMarkerWithHue(
                                BitmapDescriptor.hueBlue,
                              ),
                              infoWindow: InfoWindow(
                                title:
                                    '${state.ipResponse.location.city}, ${state.ipResponse.location.country}',
                              ),
                            ),
                        },
                      ),
                    ),
                  ],
                ),
                //* --------------------------------------------------------
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16)
                        .copyWith(top: 10),
                    child: Column(
                      children: [
                        AppText(
                          'IP Address Tracker',
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                        YBox(10),
                        AppTextfield(
                          controller: textFieldController,
                          onSubmit: trackIpAddress,
                          onSubmitted: (_) => trackIpAddress(),
                        ),
                        YBox(10),
                        if (state is IpTrackerLoaded &&
                            showAdditionalDetails.value)
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 50),
                                  blurRadius: 50,
                                  spreadRadius: -25,
                                  color: Colors.black.withOpacity(.09),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                _buildKeyValue(
                                    'IP Address', state.ipResponse.ip),
                                _buildKeyValue(
                                  'Location',
                                  '${state.ipResponse.location.city}, ${state.ipResponse.location.country}, ${state.ipResponse.location.geonameId}',
                                ),
                                _buildKeyValue(
                                  'Timezone',
                                  'UTC ${state.ipResponse.location.timezone}',
                                ),
                                _buildKeyValue(
                                  'ISP',
                                  state.ipResponse.isp,
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                if (state is IpTrackerLoading)
                  Container(
                    color: Colors.black.withOpacity(.2),
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 8,
                        color: const Color.fromARGB(255, 30, 44, 56),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildKeyValue(String key, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 13, horizontal: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppText(
            key.toUpperCase(),
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: Colors.grey.shade600,
            letterSpacing: 2,
          ),
          // YBox(5),
          AppText(
            value,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
