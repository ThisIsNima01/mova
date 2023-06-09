import 'image_routes.dart';

class AppStaticData {
  static const List profileOptionsData = [
    ['Edit Profile', AppImagesRoute.iconProfile],
    ['Notification', AppImagesRoute.iconBell],
    ['Download', AppImagesRoute.iconDownload],
    ['Security', AppImagesRoute.iconSecurity],
    ['Language', AppImagesRoute.iconLanguage],
    ['Dark Mode', AppImagesRoute.iconEye],
    ['Help Center', AppImagesRoute.iconHelp],
    ['Privacy policy', AppImagesRoute.iconPrivacy],
  ];

  static const List<String> downloadMoviesName = [
    'Lightyear',
    'Top Gun: Maverick',
    'Thor: Love & Thunder',
    'Stranger Things 4: Epi...',
    'Avatar: The Way of Wa...',
    'Doctor Strange in the ...',
  ];

  static const List<String> moviesFilter = [
    'Movie',
    'US',
    'Action',
    '2022',
    'Latest Release'
  ];

  static const List<String> exploreModalTitles = [
    'Categories',
    'Regions',
    'Genre',
    'Time/Periods',
    'Sort'
  ];

  static const List<String> subscriptionCardFeaturesTitle = [
    'Watch all you want. Ad-free.',
    'Allows streaming of 4K.',
    'Video & Audio Quality is Better.'
  ];
}
