import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hookahorder_owner_app/ui/screens/initial_screen/initial_screen_cubit.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = BlocProvider.of<InitialScreenCubit>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage("assets/img/initial_with_text.png"),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0),
              child: LinearProgressIndicator(),
            ),
            BlocBuilder<InitialScreenCubit, InitialScreenState>(
              builder: (context, state) {
                if (state is InitialScreenInitial) {
                  provider.checkUserCredentials(context);
                  return Text(provider.state.text);
                }
                return Text("ERROR: Unknown state: $state");
              },
            ),
          ],
        ),
      ),
    );
  }
}
