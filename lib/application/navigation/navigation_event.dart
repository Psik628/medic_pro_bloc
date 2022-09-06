part of 'navigation_bloc.dart';

enum Destination{
  home,
  profile,
  settings
}

@freezed
class NavigationEvent with _$NavigationEvent{
  const factory NavigationEvent.navigateTo({required Destination destination}) = NavigateTo;
}
