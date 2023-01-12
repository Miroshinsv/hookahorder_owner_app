import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hookahorder_owner_app/ui/models/place/place_model.dart';
import 'package:hookahorder_owner_app/ui/screens/main_screen/main_screen_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  Widget _placeCardWidget(PlaceModel placeModel) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(
                height: 100,
                child: placeModel.getLogoUrl == null
                    ? Image.asset("assets/img/initial_icon.png")
                    : Image.network(placeModel.getLogoUrl!),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      placeModel.getName,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Адрес: ${placeModel.getAddress.getAddress}"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loadCompleteStateWidget(List<PlaceModel> places) {
    return places.isEmpty
        ? const Center(
            child: Text("Заведений нет"),
          )
        : Column(
            children: places.map((e) => _placeCardWidget(e)).toList(),
          );
  }

  Widget _loadingStateWidget() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _errorStateWidget(String text) {
    return Center(
      child: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                const Text(
                  "Мои места",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                BlocProvider(
                  create: (context) => MainScreenCubit(),
                  child: BlocBuilder<MainScreenCubit, MainScreenState>(
                    builder: (BuildContext context, state) {
                      var provider = BlocProvider.of<MainScreenCubit>(context);
                      if (state is MainScreenInitial) {
                        provider.loadMyPlaces();
                        return const Center(
                          child: Text("Загрузка"),
                        );
                      } else if (state is MainScreenLoadingState) {
                        return _loadingStateWidget();
                      } else if (state is MainScreenLoadingComplete) {
                        return _loadCompleteStateWidget(state.places);
                      } else if (state is MainScreenErrorState) {
                        return _errorStateWidget(state.errorText);
                      }
                      return _errorStateWidget("Unknown state: $state");
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
