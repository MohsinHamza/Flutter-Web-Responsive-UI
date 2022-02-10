class NewsFeedWidgetModel {
  Person user;
  String postedAt;
  PostMediaType postMediaType;
  String? postTextContent; // if PostMediaType == textContent the we will use this variable
  String postDescription;
  // i am not sure about the type of reacts
  String? reacts;
  String postVisibility;
  List<Comment>? comments;
  int? shares;
  String? imageUrl;
  String? videoUrl;
  NewsFeedWidgetModel(
      {required this.postMediaType,
      required this.user,
        this.postTextContent,
      this.comments,
        this.videoUrl,
        this.imageUrl,
      required this.postDescription,
      required this.postedAt,
      required this.postVisibility,
      this.reacts,
      this.shares});
}

/// if PostMediaType == imageContent then imageUrl is must
/// if PostMediaType == videoContent then videoUrl is must


enum PostMediaType { textContent, imageContent, videoContent }

class Person {
  String name;
  bool isVerified;
  String? imageUrl;
  String address;
  Person(
      {required this.address,required this.imageUrl, required this.name, required this.isVerified});
}

class Comment{
  String comment;
  Person user;
  String postedAt;
  int? replies;
  Comment({required this.postedAt,required this.user,required this.comment,this.replies});
}
