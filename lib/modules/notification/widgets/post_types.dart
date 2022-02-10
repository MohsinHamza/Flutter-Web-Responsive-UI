class NotificationModel {
  List<String> users;
  String? post;
  String text;
  bool isAConnection;
  bool isSeen;
  String timeStamp;
  NotificationModel(
      {required this.text,
        required this.timeStamp,
      required this.isSeen,
      required this.isAConnection,
      this.post,
      required this.users});
}

List<NotificationModel> notifications = [
  NotificationModel(
    timeStamp: '2hr ago',
      isAConnection: false,
      post: 'Incredibly loud motor sound',
      users: ['Jess Lee', 'Reeta','Menal','sobot jain'],
      isSeen: false,
      text: 'commented on the post you reacted to:'),
  NotificationModel(
    timeStamp: '2 min ago',
      isAConnection: false,
      post: null,
      users: ['Jess Lee', 'Reeta','Menal','sobot jain'],
      isSeen: false,
      text: 'posted top stories in your digest'),
  NotificationModel(
    timeStamp: '2hr ago',
      isAConnection: false,
      post: 'Incredible Hills',
      users: ['Jess Lee', 'Reeta','Menal','sobot jain'],
      isSeen: false,
      text: 'commented on the post you reacted to:'),
  NotificationModel(
    timeStamp: '2 min ago',
      isAConnection: false,
      post: null,
      users: ['Jess Lee', 'Reeta','Menal','sobot jain'],
      isSeen: false,
      text: 'posted top stories in your digest'),


  NotificationModel(
    timeStamp: '2 min ago',
      isAConnection: true,
      post: ' is Now a connection',
      text: '',
      users: ['Kumar'],
      isSeen: true),
];
