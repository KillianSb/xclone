import 'package:flutter/material.dart';

import 'button_tweet_bar.dart';
import 'tweet.dart';

class TweetProducts extends StatelessWidget {

  final List<Tweet> listTweets;

  const TweetProducts(this.listTweets,{super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listTweets.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(listTweets[index].author),
              subtitle: Column(
                children: [
                  Text(listTweets[index].message,maxLines: 2),
                  const ButtonTweetBar()
                ],
              ),
            ),
          ),
        )
    );
  }
}