abstract class AppStates{}

class AppInitialState extends AppStates{}


/////////////////HomeScreen////////////////////
class AppChangeCurrentDayState extends AppStates{}
class AppChangeCurrentMonthState extends AppStates{}
class AppChangeCurrentYearState extends AppStates{}

//////////////PhoneNumberScreen//////////////
class AppChangeErrorState extends AppStates{}
class AppChangeIsPressedState extends AppStates{}
class AppChangeButtonColor extends AppStates{}

class AppChangeGetTextState extends AppStates{}
class AppChangeTextAnimationState extends AppStates{}

////////////////DataBase//////////////////
class AppChangeUserValue extends AppStates{}
class AppCreateDatabaseState extends AppStates{}
class AppInsertToDatabaseState extends AppStates{}
class AppGetFromDatabaseState extends AppStates{}
class AppGetFromDatabaseLoadingState extends AppStates{}
class AppUpdateDatabaseState extends AppStates{}
class AppDeleteDatabaseState extends AppStates{}


class AppChangeEmailValue extends AppStates{}
class AppChangeUsernameValue extends AppStates{}
class AppChangeNumberValue extends AppStates{}
class AppChangePasswordValue extends AppStates{}

