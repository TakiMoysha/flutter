import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttr_hi/city.dart';
import 'package:fluttr_hi/city_details.dart';

class CitiesListWidget extends StatefulWidget {
  @override
  _CitiesListWidgetState createState() => _CitiesListWidgetState();
}

class _CitiesListWidgetState extends State<CitiesListWidget> {
  List<City> cities = List();

  @override
  void initState() {
    parseCitiesList().then((value) => {
          setState(() {
            cities = value;
          })
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Moyses App"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CityDetailsWidget(
                      cities[index].name,
                      cities[index].imageUrl,
                      cities[index].description,
                      index)));
            },
            child: CustomItemWidget(
                cities[index].name, index, cities[index].imageUrl),
          );
        },
        itemCount: cities != null ? cities.length : 0,
      ),
    );
  }

  Future<List<City>> parseCitiesList() async {
    String data =
        await DefaultAssetBundle.of(context).loadString('res/json/cities.json');
    Map<String, dynamic> decodeJson = jsonDecode(data);
    CityList cityList = CityList.fromMappedJson(decodeJson);
    return cityList.cities;
  }
}

class CustomItemWidget extends StatelessWidget {
  final int index;
  final String name;
  final String imageUrl;

  CustomItemWidget(this.name, this.index, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              height: 120,
              width: 120,
              child: Hero(
                tag: 'photo{$index}',
                child: Image.network(imageUrl),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(name),
            ),
          ),
        ],
      ),
    );
  }
}
