class Fixture {
  final String homeTeam;
  final String awayTeam;
  final String homeTeamLogo;
  final String awayTeamLogo;
  final String date;
  final String leagueName;
  final String leagueLogo;
  final String homeScore;
  final String awayScore;
  final String statusShort;
  final String fixtureTime; // Added status field

  Fixture({
    required this.homeTeam,
    required this.awayTeam,
    required this.homeTeamLogo,
    required this.awayTeamLogo,
    required this.date,
    required this.leagueName,
    required this.leagueLogo,
    required this.homeScore,
    required this.awayScore,
    required this.statusShort, // Added status
    required this.fixtureTime,
  });

  factory Fixture.fromJson(Map<String, dynamic> json) {
    try {
      return Fixture(
        homeTeam: json['teams']['home']['name'],
        awayTeam: json['teams']['away']['name'],
        homeTeamLogo: json['teams']['home']['logo'],
        awayTeamLogo: json['teams']['away']['logo'],
        date: json['fixture']['date'],
        leagueName: json['league']['name'],
        leagueLogo: json['league']['logo'],
        homeScore: (json['goals']['home'] ?? 0).toString(),
        awayScore: (json['goals']['away'] ?? 0).toString(),
        statusShort: json['fixture']['status']['short'], // Added status mapping
        fixtureTime: (json['fixture']['status']['elapsed']).toString(),
      );
    } catch (e) {
      print('Fixture Error ********************** : $e');
      return Fixture(
        homeTeam: '',
        awayTeam: '',
        homeTeamLogo: '',
        awayTeamLogo: '',
        date: '',
        leagueName: '',
        leagueLogo: '',
        homeScore: '',
        awayScore: '',
        statusShort: '',
        fixtureTime: '',
      );
    }
  }

  static List<Fixture> fixtureFromSnapshot(List snapshot) {
    try {
      return snapshot.map((data) => Fixture.fromJson(data)).toList();
    } catch (e) {
      print('fixtureFromSnapshot Error ********************** : $e');
      return [];
    }
  }

  @override
  String toString() {
    return 'Fixture{homeTeam: $homeTeam, awayTeam: $awayTeam, homeTeamLogo: $homeTeamLogo, awayTeamLogo: $awayTeamLogo, date: $date, leagueName: $leagueName, leagueLogo: $leagueLogo, homeScore: $homeScore, awayScore: $awayScore, statusShort: $statusShort , fixtureTime: $fixtureTime}';
  }
}
