import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboar/blocs/appcubit/app_state.dart';
import 'package:laboar/blocs/constants/constants.dart';
import 'package:laboar/main.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);
  Map<String, dynamic>? data;
  getCopmanyData() async {
    emit(DataLoding());
    await firebaseFirestore
        .collection('company')
        .doc('YFccnCa5QjQmL5LYW10H')
        .get()
        .then((value) {
      data = value.data();
      emit(DataLoaded());
    }).catchError((error) {
      emit(DataError());
    });
  }

  setLocale(String value) {
    if (value == 'Arabic') {
      localebox!.add('ar');
    } else {
      localebox!.add('en');
    }
  }
}
