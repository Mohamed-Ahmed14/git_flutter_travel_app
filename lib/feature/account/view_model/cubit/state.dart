abstract class AccountState{}
class AccountInitState extends AccountState{}

class AddAccountLoadingState extends AccountState{}
class AddAccountSuccessState extends AccountState{}
class AddAccountErrorState extends AccountState{}

class ShowProfLoadingState extends AccountState{}
class ShowProfSuccessState extends AccountState{}
class ShowProfErrorState extends AccountState{}

class ChangeFormState extends AccountState{}

class EditProfileLoadingState extends AccountState{}
class EditProfileSuccessState extends AccountState{}
class EditProfileErrorState extends AccountState{}


class ChangePassLoadingState extends AccountState{}
class ChangePassSuccessState extends AccountState{}
class ChangePassErrorState extends AccountState{}

class ChangeProfObscureSuccessState extends AccountState{}

class LogoutLoadingState extends AccountState{}
class LogoutSuccessState extends AccountState{}
class LogoutErrorState extends AccountState{}
