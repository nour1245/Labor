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
