# Project General Description:
Refactor Tourist Guide App & User Profile Management in 1 app with bloc.

## Task 1:

1-User Authentication
1- Bloc: Create AuthBloc with the following states: AuthInitial, AuthLoading, AuthAuthenticated, AuthUnauthenticated, AuthError.
2- Events: LoginRequested, LogoutRequested.

2- Profile Management
1- Bloc:Create ProfileBloc with states: ProfileInitial, ProfileLoading, ProfileLoaded, ProfileUpdated, ProfileError
2- Events:LoadProfile, UpdateProfile, UpdateAvatar
## Task 2:

1- Settings
1- Bloc: Create ThemeBloc with states: ThemeLight, ThemeDark.
2- Events:ToggleTheme.

2- Home screen & places
1- Bloc: Create PlacesBloc with states:
PlacesInitial, PlacesLoading, PlacesLoaded, PlacesError
2- Events: LoadPlaces, LoadMorePlaces.
