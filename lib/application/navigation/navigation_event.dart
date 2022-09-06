part of 'navigation_bloc.dart';

enum NavigationDestination{
  home,
  profile,
  settings
}

@freezed
class NavigationEvent with _$NavigationEvent{
  const factory NavigationEvent.navigateTo({required NavigationDestination destination}) = NavigateTo;
}
