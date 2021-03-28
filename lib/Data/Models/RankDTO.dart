class RankDTO {
  String rank;
  String listName;
  String displayName;
  String publishedDate;
  String bestsellersDate;
  String weeksOnList;
  String asterisk;
  String dagger;

  RankDTO({
    this.rank,
    this.listName,
    this.displayName,
    this.publishedDate,
    this.bestsellersDate,
    this.weeksOnList,
    this.asterisk,
    this.dagger,
  });

  factory RankDTO.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    return RankDTO(
      rank: json['rank'].toString(),
      listName: json['list_name'],
      displayName: json['display_name'],
      publishedDate: json['published_date'],
      bestsellersDate: json['bestsellers_date'],
      weeksOnList: json['weeks_on_list'].toString(),
      asterisk: json['asterisk'].toString(),
      dagger: json['dagger'].toString(),
    );
  }
}
