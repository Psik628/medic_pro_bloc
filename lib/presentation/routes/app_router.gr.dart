// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SplashPage());
    },
    SignInPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SignInPage());
    },
    SignUpPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SignUpPage());
    },
    HomePageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomePage());
    },
    ProfilePageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ProfilePage());
    },
    SettingsPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SettingsPage());
    },
    CategoryPageRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryPageRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: CategoryPage(
              key: args.key, currentCategory: args.currentCategory));
    },
    SubcategoryPageRoute.name: (routeData) {
      final args = routeData.argsAs<SubcategoryPageRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: SubcategoryPage(
              key: args.key, currentSubcategory: args.currentSubcategory));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(SplashPageRoute.name, path: '/'),
        RouteConfig(SignInPageRoute.name, path: '/sign-in-page'),
        RouteConfig(SignUpPageRoute.name, path: '/sign-up-page'),
        RouteConfig(HomePageRoute.name, path: '/home-page'),
        RouteConfig(ProfilePageRoute.name, path: '/profile-page'),
        RouteConfig(SettingsPageRoute.name, path: '/settings-page'),
        RouteConfig(CategoryPageRoute.name, path: '/category-page'),
        RouteConfig(SubcategoryPageRoute.name, path: '/subcategory-page')
      ];
}

/// generated route for
/// [SplashPage]
class SplashPageRoute extends PageRouteInfo<void> {
  const SplashPageRoute() : super(SplashPageRoute.name, path: '/');

  static const String name = 'SplashPageRoute';
}

/// generated route for
/// [SignInPage]
class SignInPageRoute extends PageRouteInfo<void> {
  const SignInPageRoute() : super(SignInPageRoute.name, path: '/sign-in-page');

  static const String name = 'SignInPageRoute';
}

/// generated route for
/// [SignUpPage]
class SignUpPageRoute extends PageRouteInfo<void> {
  const SignUpPageRoute() : super(SignUpPageRoute.name, path: '/sign-up-page');

  static const String name = 'SignUpPageRoute';
}

/// generated route for
/// [HomePage]
class HomePageRoute extends PageRouteInfo<void> {
  const HomePageRoute() : super(HomePageRoute.name, path: '/home-page');

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [ProfilePage]
class ProfilePageRoute extends PageRouteInfo<void> {
  const ProfilePageRoute()
      : super(ProfilePageRoute.name, path: '/profile-page');

  static const String name = 'ProfilePageRoute';
}

/// generated route for
/// [SettingsPage]
class SettingsPageRoute extends PageRouteInfo<void> {
  const SettingsPageRoute()
      : super(SettingsPageRoute.name, path: '/settings-page');

  static const String name = 'SettingsPageRoute';
}

/// generated route for
/// [CategoryPage]
class CategoryPageRoute extends PageRouteInfo<CategoryPageRouteArgs> {
  CategoryPageRoute({Key? key, required Category currentCategory})
      : super(CategoryPageRoute.name,
            path: '/category-page',
            args: CategoryPageRouteArgs(
                key: key, currentCategory: currentCategory));

  static const String name = 'CategoryPageRoute';
}

class CategoryPageRouteArgs {
  const CategoryPageRouteArgs({this.key, required this.currentCategory});

  final Key? key;

  final Category currentCategory;

  @override
  String toString() {
    return 'CategoryPageRouteArgs{key: $key, currentCategory: $currentCategory}';
  }
}

/// generated route for
/// [SubcategoryPage]
class SubcategoryPageRoute extends PageRouteInfo<SubcategoryPageRouteArgs> {
  SubcategoryPageRoute({Key? key, required Subcategory currentSubcategory})
      : super(SubcategoryPageRoute.name,
            path: '/subcategory-page',
            args: SubcategoryPageRouteArgs(
                key: key, currentSubcategory: currentSubcategory));

  static const String name = 'SubcategoryPageRoute';
}

class SubcategoryPageRouteArgs {
  const SubcategoryPageRouteArgs({this.key, required this.currentSubcategory});

  final Key? key;

  final Subcategory currentSubcategory;

  @override
  String toString() {
    return 'SubcategoryPageRouteArgs{key: $key, currentSubcategory: $currentSubcategory}';
  }
}
