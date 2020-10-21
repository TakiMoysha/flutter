class City {
  final int id;
  final String name;
  final String imageUrl;
  final String description;

  City(this.id, this.name, this.imageUrl, this.description);

  City.fromMappedJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"] ?? "",
        imageUrl = json["imageUrl"] ?? "",
        description = json["description"] ?? "";

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'imageUrl': imageUrl,
        'description': description,
      };
}

class CityList {
  List<City> cities;

  CityList(this.cities);

  CityList.fromMappedJson(Map<String, dynamic> json) {
    var list = json['cities'] as List;
    cities = list.map((city) => City.fromMappedJson(city)).toList();
  }
}
