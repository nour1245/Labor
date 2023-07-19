import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboar/blocs/appcubit/app_state.dart';
import 'package:laboar/blocs/constants/constants.dart';
import 'package:laboar/model/usermodel.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  UserModel? usermodel;

  getData(phone) async {
    await firebaseFirestore
        .collection('users')
        .doc("user$phone")
        .get()
        .then((value) {
      usermodel = UserModel.fromJson(value.data()!);
    });
  }
}