import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'components/bottom_nav.dart';
import 'components/top_nav.dart';
import 'components/tweet.dart';
import 'components/tweet_product.dart';
class TwitterPage extends StatelessWidget {
  final String email;
  const TwitterPage(this.email,{super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
        title: const Text("X Clone",style: TextStyle(color: Colors.white)),
        backgroundColor:Colors.lightBlue,
      ),
      body:  Column(
        children: [
          const TopNavigationTwitter(),
          Text(email),
          FutureBuilder<Response>(
              future: get(Uri.parse('https://raw.githubusercontent.com/Chocolaterie/EniWebService/main/api/tweets.json')),

              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  final listMapJSON = jsonDecode(snapshot.data!.body) as List<dynamic>;
                  final listTweets = listMapJSON.map((mapJSON) => Tweet.fromMap(mapJSON)).toList();
                  return Expanded(child: TweetProducts(listTweets));
                }else{
                  return const CircularProgressIndicator();
                }
              },
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigationTwitter(),
    );
  }
}