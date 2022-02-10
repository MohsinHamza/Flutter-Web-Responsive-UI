class MessageModel {
  //final String senderID;
  final String message;
  final String image;
  //final DateTime sentAT;
  final String sentAT;
  bool isSent;

  MessageModel(
      {required this.image,  required this.message, required this.sentAT,required this.isSent});

}
