abstract class AuthStates {}

class AuthInitial extends AuthStates {}

class PhoneVerificationSucces extends AuthStates {}

class PhoneVerificationError extends AuthStates {}

class PhoneVerificationLoading extends AuthStates {}

class OtpVerificationSucces extends AuthStates {}

class OtpVerificationError extends AuthStates {}

class OtpVerificationLoading extends AuthStates {}

class SignInWithGoogleSucess extends AuthStates {}

class SignInWithGoogleError extends AuthStates {}

class SignInWithGoogleLoading extends AuthStates {}

class SignInWithFacebookSucess extends AuthStates {}

class SignInWithFacebookError extends AuthStates {}

class SignInWithFacebookLoading extends AuthStates {}

class SignOut extends AuthStates {}

class CreateUserSuccessState extends AuthStates {}

class CreateUserErrorState extends AuthStates {}

class LoginLoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {}

class LoginErrorState extends AuthStates {
  LoginErrorState(String s);
}

class getUserDataLoad extends AuthStates {}

class getUserDataSuccess extends AuthStates {}

class getUserDataError extends AuthStates {}

class SaveNewDataSuccesState extends AuthStates {}

class SaveNewDataErrorState extends AuthStates {}

class SaveNewDataLoadingState extends AuthStates {}
