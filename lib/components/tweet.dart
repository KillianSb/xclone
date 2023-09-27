
class Tweet{
  final int id;
  final String author;
  final String message;

  const Tweet({
    required this.id,
    required this.author,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'author': author,
      'message': message,
    };
  }

  factory Tweet.fromMap(Map<String, dynamic> map) {
    return Tweet(
      id: map['id'] as int,
      author: map['author'] as String,
      message: map['message'] as String,
    );
  }
}