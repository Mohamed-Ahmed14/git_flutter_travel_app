abstract class AuthState{}

class AuthInitState extends AuthState{}

class ChangeObscureSuccessState extends AuthState{}
class ChangeConObscureSuccessState extends AuthState{}

class GoogleSignInLoadingState extends AuthState{}
class GoogleSignInSuccessState extends AuthState{}

class AddAccountLoadingState extends AuthState{}
class AddAccountSuccessState extends AuthState{}
class AddAccountErrorState extends AuthState{}
