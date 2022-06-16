import 'dart:convert';
import 'package:firebase_signin/news/NewsView.dart';
import 'package:firebase_signin/news/model.dart';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart';

class newsScreen extends StatefulWidget {
  const newsScreen({Key? key}) : super(key: key);

  @override
  _newsScreenState createState() => _newsScreenState();
}

class _newsScreenState extends State<newsScreen> {
  List<NewsQueryModel> newsModelList = <NewsQueryModel>[];
  List<NewsQueryModel> newsModelListCarousel = <NewsQueryModel>[];

  bool isLoading = true;
  getNewsByQuery(String query) async {
    Map element;
    int i = 0;
    String url =
        "https://newsapi.org/v2/everything?q=$query&from=2021-06-28&sortBy=publishedAt&apiKey=9bb7bf6152d147ad8ba14cd0e7452f2f";
    Response response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    setState(() {
      for (element in data["articles"]) {
        try {
          i++;

          NewsQueryModel newsQueryModel = new NewsQueryModel();
          newsQueryModel = NewsQueryModel.fromMap(element);
          newsModelList.add(newsQueryModel);
          setState(() {
            isLoading = false;
          });

          if (i == 5) {
            break;
          }
        } catch (e) {
          print(e);
        }
        ;
      }
    });
  }

  getNewsofIndia() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=9bb7bf6152d147ad8ba14cd0e7452f2f";
    Response response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    setState(() {
      data["articles"].forEach((element) {
        NewsQueryModel newsQueryModel = new NewsQueryModel();
        newsQueryModel = NewsQueryModel.fromMap(element);
        newsModelListCarousel.add(newsQueryModel);
        setState(() {
          isLoading = false;
        });
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNewsByQuery("corona");
    getNewsofIndia();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Timely NEWS"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: isLoading
                  ? Container(
                  height: 200,
                  child: Center(child: CircularProgressIndicator()))
                  : CarouselSlider(
                options: CarouselOptions(
                    height: 200, autoPlay: true, enlargeCenterPage: true),
                items: newsModelListCarousel.map((instance) {
                  return Builder(builder: (BuildContext context) {
                    try {
                      return Container(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> NewsView(instance.newsUrl)));
                            },
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(10)),
                                child: Stack(children: [
                                  ClipRRect(
                                      borderRadius:
                                      BorderRadius.circular(10),
                                      child: Image.network(
                                        instance.newsImg,
                                        fit: BoxFit.fitHeight,
                                        width: double.infinity,
                                      )),
                                  Positioned(
                                      left: 0,
                                      right: 0,
                                      bottom: 0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            gradient: LinearGradient(
                                                colors: [
                                                  Colors.black12
                                                      .withOpacity(0),
                                                  Colors.black
                                                ],
                                                begin: Alignment.topCenter,
                                                end: Alignment
                                                    .bottomCenter)),
                                        child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5,
                                                vertical: 10),
                                            child: Container(
                                                margin:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                child: Text(
                                                  instance.newsHead,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ))),
                                      )),
                                ])),
                          ));
                    } catch (e) {
                      print(e);
                      return Container();
                    }
                  });
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
