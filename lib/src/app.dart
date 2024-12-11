import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ip_address_tracker/src/features/home/logic/blocs/blocs.dart';
import 'package:ip_address_tracker/src/features/home/logic/services/services.dart';
import 'features/home/presentation/screens/home_screen.dart';
import 'features/navigation/nav.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => IpTrackerBloc(service: IpTrackerService())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'IP Address Tracker',
        theme: ThemeData(
          useMaterial3: true,
        ),
        routes: {
          AppRoutes.home: (context) => HomeScreen(),
        },
        initialRoute: AppRoutes.home,
      ),
    );
  }
}
