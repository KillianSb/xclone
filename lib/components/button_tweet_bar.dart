
import 'package:flutter/material.dart';

class ButtonTweetBar extends StatefulWidget {
  const ButtonTweetBar({
    super.key,
  });

  @override
  State<ButtonTweetBar> createState() => _ButtonTweetBarState();
}

class _ButtonTweetBarState extends State<ButtonTweetBar> {
  var isLiked = false;
  var isRetweet = false;
  var isResponse = false;
  void _likeTweet() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  void _isRetweet() {
    setState(() {
      isRetweet = !isRetweet;
    });
  }

  void _isResponse() {
    setState(() {
      isResponse = !isResponse;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: isResponse
              ? const Icon(Icons.done_all, color: Colors.blue)
              : const Icon(Icons.question_answer, color: Colors.black),
          onPressed: () {
            setState(() {
              isResponse = true;
            });

            Future.delayed(const Duration(seconds: 1), () {
              setState(() {
                isResponse = false;
              });
            });
          },
        ),
        IconButton(
          icon: isRetweet ? const Icon(Icons.loop, color: Colors.green) : const Icon(Icons.loop_outlined, color: Colors.black),
          onPressed: (){
            setState(() {
              _isRetweet ();
            });
          },
        ),
        IconButton(
          icon: isLiked ? const Icon(Icons.favorite, color: Colors.red) : const Icon(Icons.heart_broken_outlined, color: Colors.black),
          onPressed: (){
            setState(() {
              _likeTweet ();
            });
          },
        ),
      ],
    );
  }
}
