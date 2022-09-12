import '../model/ad_slider_model.dart';
import '../model/cast_crew_model.dart';
import '../model/event_model.dart';
import '../model/menu_model.dart';
import '../model/movies_model.dart';
import '../model/offer_model.dart';
import '../model/seat_layout_model.dart';
import '../model/theatre_model.dart';
import 'constants.dart';
import 'mytheme.dart';

final seatLayout = SeatLayoutModel(
    rows: 10,
    cols: 11,
    seatTypes: [
      {
        'title': 'I-MAX',
        'price': 120.0,
        'status': 'Filling Fast',
      },
      {
        'title': 'Normal',
        'price': 100.0,
        'status': 'Available',
      },
      {
        'title': 'Small',
        'price': 80.0,
        'status': 'Available',
      },
    ],
    theatreId: 123,
    gap: 2,
    gapColIndex: 5,
    isLastFilled: true,
    rowBreaks: [9, 9, 6]);

final List<int> s = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

List<TheatreModel> theatres = [
  TheatreModel(id: '1', name: 'VOX Cinemas - City Centre Almaza'),
  TheatreModel(id: '2', name: 'Cinema Galaxy - Cairo Festival City Mall'),
  TheatreModel(id: '3', name: 'VOX Cinemas Mall of Egypt'),
  TheatreModel(id: '4', name: 'Americana Plaza Cinema'),
];

List<String> facilityAsset = [
  'assets/icons/cancel.svg',
  'assets/icons/parking.svg',
  'assets/icons/cutlery.svg',
  'assets/icons/rocking_horse.svg',
];

List<String> screens = [
  '3D',
  '2D',
];

List<OfferModel> offers = [
  OfferModel(
    title: 'Wait ! Grab FREE reward',
    description: 'Book your seats and tap on the reward box to claim it.',
    expiry: DateTime(2022, 4, 15, 12),
    startTime: DateTime(2022, 3, 15, 12),
    discount: 100,
    color: MyTheme.redTextColor,
    gradientColor: MyTheme.redGiftGradientColors,
  ),
  OfferModel(
    title: 'Wait ! Grab FREE reward',
    description: 'Book your seats and tap on the reward box to claim it.',
    expiry: DateTime(2022, 4, 15, 12),
    startTime: DateTime(2022, 3, 15, 12),
    discount: 100,
    color: MyTheme.greenTextColor,
    gradientColor: MyTheme.greenGiftGradientColors,
    icon: 'gift_green.svg',
  ),
];

List<CrewCastModel> crewCast = [
  CrewCastModel(
    movieId: '123',
    castId: '123',
    name: 'Chadwick',
    image: 'assets/actors/chadwick.png',
  ),
  CrewCastModel(
    movieId: '123',
    castId: '123',
    name: 'Letitia Wright',
    image: 'assets/actors/LetitiaWright.png',
  ),
  CrewCastModel(
    movieId: '123',
    castId: '123',
    name: 'B. Jordan',
    image: 'assets/actors/b_jordan.png',
  ),
  CrewCastModel(
    movieId: '123',
    castId: '123',
    name: 'Lupita Nyong',
    image: 'assets/actors/lupita_nyong.png',
  ),
];

List<AdSliderModel> sliderData = [
  AdSliderModel(
      url: 'assets/slider_banner.png', redirectUrl: Constants.baseApiUrl),
  AdSliderModel(
      url: 'assets/slider_banner.png', redirectUrl: Constants.baseApiUrl),
  AdSliderModel(
      url: 'assets/slider_banner.png', redirectUrl: Constants.baseApiUrl),
];

List<MenuModel> menus = [
  MenuModel(name: 'Movies', asset: 'assets/icons/film.svg'),
  MenuModel(name: 'Events', asset: 'assets/icons/spotlights.svg'),
  MenuModel(name: 'Plays', asset: 'assets/icons/theater_masks.svg'),
  MenuModel(name: 'Sports', asset: 'assets/icons/running.svg'),
  MenuModel(name: 'Activity', asset: 'assets/icons/flag.svg'),
  //MenuModel(name: 'Monum', asset: 'assets/icons/pyramid.svg'),
];

List<MovieModel> movies = [
  MovieModel(
    title: 'Black Panther: Wakanda Forever',
    description: 'description',
    actors: ['actor a', 'actor b'],
    like: 84,
    bannerUrl: 'assets/movies/blackpanther_banner.png',
    posterUrl: 'assets/movies/blackpanther_poster.png',
  ),
  MovieModel(
    title: 'Man on fire',
    description: 'description',
    actors: ['actor a', 'actor b'],
    like: 84,
    bannerUrl: 'assets/movies/manonfire_banner.png',
    posterUrl: 'assets/movies/manonfire_poster.png',
  ),
  MovieModel(
    title: 'The intern',
    description: 'description',
    actors: ['actor a', 'actor b'],
    like: 84,
    bannerUrl: 'assets/movies/theintern_banner.png',
    posterUrl: 'assets/movies/theintern_poster.png',
  ),
  MovieModel(
    title: 'The rock',
    description: 'description',
    actors: ['actor a', 'actor b'],
    like: 84,
    bannerUrl: 'assets/movies/therock_banner.png',
    posterUrl: 'assets/movies/therock_poster.png',
  ),
  MovieModel(
    title: 'Warrior',
    description: 'description',
    actors: ['actor a', 'actor b'],
    like: 84,
    bannerUrl: 'assets/movies/warrior_banner.png',
    posterUrl: 'assets/movies/warrior_poster.png',
  ),
];

List<EventModel> events = [
  EventModel(
    title: 'Happy Halloween 2K19',
    description: 'Music show',
    date: 'date',
    posterUrl: 'assets/events/event1.png',
  ),
  EventModel(
    title: 'Music DJ king monger Sert...',
    description: 'Music show',
    date: 'date',
    posterUrl: 'assets/events/event2.png',
  ),
  EventModel(
    title: 'Summer sounds festiva..',
    description: 'Comedy show',
    date: 'date',
    posterUrl: 'assets/events/event3.png',
  ),
  EventModel(
    title: 'Happy Halloween 2K19',
    description: 'Music show',
    posterUrl: 'assets/events/event4.png',
    date: 'date',
  ),
];

List<EventModel> plays = [
  EventModel(
    title: 'Alex in wonderland',
    description: 'Comedy Show',
    date: 'date',
    posterUrl: 'assets/plays/play1.png',
  ),
  EventModel(
    title: 'Marry poppins puffet show',
    description: 'Music Show',
    date: 'date',
    posterUrl: 'assets/plays/play2.png',
  ),
  EventModel(
    title: 'Patrimandram special dewali',
    description: 'Dibet Show',
    date: 'date',
    posterUrl: 'assets/plays/play3.png',
  ),
  EventModel(
    title: 'Happy Halloween 2K19',
    description: 'Music Show',
    posterUrl: 'assets/plays/play4.png',
    date: 'date',
  ),
];

List<String> cities = [
  'Cairo',
  'Torino',
  'Houston',
  'Texas',
  'Dallas',
];
