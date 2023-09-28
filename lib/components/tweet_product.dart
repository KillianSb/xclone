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
              leading: const CircleAvatar(
                radius: 30.0,
                backgroundImage:
                NetworkImage("https://fastly.picsum.photos/id/950/200/200.jpg?hmac=IMndM4w_a_8AXRuOtaCnz3dLpG7AaFpWKOPndcfLW0g"),
                backgroundColor: Colors.transparent,
              ),
              title: Text(listTweets[index].author),
              subtitle: Column(
                children: [
                  Text(listTweets[index].message,maxLines: 2),
                  const ButtonTweetBar(),
                ],
              ),
            ),
          ),
        )
    );
  }
}