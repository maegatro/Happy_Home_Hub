import './location_fact.dart';

/// Represents a tourism location a user can visit.
class Location {
  final int id;
  final String name;
  final String imagePath;
  final List<LocationFact> facts;

  Location(this.id, this.name, this.imagePath, this.facts);

  static List<Location> fetchAll() {
    return [
      Location(1, 'Relax', 'assets/images/kiyomizu-dera.jpg', [
        LocationFact(
            'Netflix', 'Why not watch Netflix and have some popcorns to relax'),
        // LocationFact('Tips', 'Japanese Buddhist architecture.'),
      ]),
      Location(2, 'Learning', 'assets/images/fuji.jpg', [
        LocationFact(
            'Learn how to code', 'Follow a youtube tutorial about Javascript'),
        // LocationFact('Did You Know',
        //     'There are three cities that surround Mount Fuji: Gotemba, Fujiyoshida and Fujinomiya.'),
      ]),
      Location(3, 'Exercise', 'assets/images/arashiyama.jpg', [
        LocationFact('Plank', 'Plank for 1 minute'),
        // LocationFact('How to Get There',
        //     'Kyoto airport, with several terminals, is located 16 kilometres south of the city and is also known as Kyoto. Kyoto can also be reached by transport links from other regional airports.'),
      ]),
    ];
  }

  static Location fetchByID(int locationID) {
    // NOTE: this will replaced by a proper API call
    List<Location> locations = Location.fetchAll();
    for (var i = 0; i < locations.length; i++) {
      if (locations[i].id == locationID) {
        return locations[i];
      }
    }
    return null;
  }
}
