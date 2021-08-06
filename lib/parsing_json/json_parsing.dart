import 'package:flutter/material.dart';
import 'package:tut/network/network.dart';

class JsonParsingSimple extends StatefulWidget {
  const JsonParsingSimple({Key? key}) : super(key: key);

  @override
  _JsonParsingSimpleState createState() => _JsonParsingSimpleState();
}

class _JsonParsingSimpleState extends State<JsonParsingSimple> {
  Future? data;
  @override
  void initState() {
    super.initState();
    data = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parsing Json"),
      ),
      body: Center(
        child: Container(
          child: FutureBuilder(
            future: getData(),
            builder: (context, AsyncSnapshot<dynamic> snapShot) {
              if (snapShot.hasData) {
                return createListView(snapShot.data);
                //return Text("${snapShot.data[0]['userId']}");
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }

  Future getData() async {
    var data;
    String url = "https://jsonplaceholder.typicode.com/posts";
    Network network = Network(url);
    data = network.fetchData();
    // data.then((value) {
    //   print(value[0]['title']);
    // });
    return data;
  }

  Widget createListView(data) {
    return Container(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, int index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Divider(
                height: 5.0,
                thickness: 3,
              ),
              ListTile(
                title: Text("${data[index]['title']}"),
                subtitle: Text("${data[index]['body']}"),
                leading: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.black45,
                      radius: 23,
                      child: Text("${data[index]['id']}"),
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
