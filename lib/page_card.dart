import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'countries_model.dart';
import 'covid_data_source.dart';

class PageCard extends StatefulWidget {
  const PageCard({Key? key}) : super(key: key);

  @override
  State<PageCard> createState() => _PageCardState();
}

class _PageCardState extends State<PageCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Countries Card"),
      ),
      body: _pageCard(),
    );
  }

  Widget _pageCard() {
    return Container(
      child: FutureBuilder(
        future: CovidDataSource.instance.loadCountries(),
        builder: (
          BuildContext context,
          AsyncSnapshot<dynamic> snapshot,
        ) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            CountriesModel countriesModel =
                CountriesModel.fromJson(snapshot.data);
            return _buildSuccessSection(countriesModel);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildEmptySection() {
    return Text("Empty");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(CountriesModel data) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: data.countries?.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildItemCountries(
            "${data.countries?[index].name}", "${data.countries?[index].iso3}");
        // _buildItemCountries("${data.countries?[index].name}");
      },
    );
  }

  Widget _buildItemCountries(String name, String iso3) {
    return Container(
      width: double.infinity,
      child: Card(
        elevation: 50,
        shadowColor: Colors.black,
        color: Colors.grey[300],
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                "${name}",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ), //Textstyle
              ), //Text
              const SizedBox(
                height: 10,
              ), //SizedBox
              Text(
                "(${iso3})",
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.red,
                    fontStyle: FontStyle.italic), //Textstyle
              ),
            ],
          ), //Column
        ), //Padding
      ),
    );
  }
}
