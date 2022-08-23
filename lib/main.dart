import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/dataname.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Dio dio = Dio();
  String url = 'https://fakestoreapi.com/products';
  List<dynamic> dataModel = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<List<dynamic>> getData() async {
    Response response = await dio.get(url);
    print(response.data);
    print(response.statusCode);
    dataModel = response.data.map((product) => DataModel.fromJson(product));
    return dataModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Products'),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: ((context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: dataModel.length,
                  itemBuilder: (context, index) {
                    return  SizedBox(
                      height: 120,
                      child: ListTile(
                        title: Text(dataModel[index].title),
                        subtitle: SizedBox(
                            child: Text('${dataModel[index].price}EGP')),
                        leading: SizedBox(
                          width: 80,
                          child: Image.network(dataModel[index].image),

                        ),

                      ),
                    );
                    },
                )
              : snapshot.hasError
                  ? Text('Sorry, Something wrong')
                  : Center(child: CupertinoActivityIndicator());
        }),
      ),
    );
  }
}
