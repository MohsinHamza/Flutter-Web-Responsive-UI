import 'package:next_door/models/news_feed_widget_model.dart';

List<NewsFeedWidgetModel> newsFeedPosts = [
  NewsFeedWidgetModel(
      postMediaType: PostMediaType.imageContent,
      user: Person(
          imageUrl: null,//'assets/images/lina.jfif',
          isVerified: true,
          name: 'Lina Johnson',
          address: 'Near Palace'),
      postedAt: '1 hr ago',
      postVisibility: 'General to Anyone',
      reacts: '2',
      postDescription:
          'Appointment still available for tomorrow - 21jan message to get booked in appointments! ❤',
      comments: [
        Comment(
          postedAt: '1 min ago',
          user: Person(
            name: 'Kr-bt',
            imageUrl: null,
            isVerified: true,
            address: 'Roast Woods',
          ),
          comment: 'Nice!!!',
          replies: 2,
        ),
        Comment(
          postedAt: '2 min ago',
          user: Person(
            name: 'Lina',
            imageUrl: 'assets/images/lina.jfif',
            isVerified: true,
            address: 'Roast Woods',
          ),
          comment: 'Cool!!!',
          replies: 3,
        ),
      ],
      imageUrl: 'assets/images/ruislip-city.jfif'),
  NewsFeedWidgetModel(
    postDescription: '',
    postTextContent: 'Hey There groups members',
    postMediaType: PostMediaType.textContent,
    user: Person(
        imageUrl: 'assets/images/stacy.jfif',
        isVerified: false,
        name: 'Stacy Cruz',
        address: 'London woods,'),
    postedAt: '2 hr ago',
    postVisibility: 'General to Anyone',
    reacts: '100',
    comments: [
      Comment(
        postedAt: '1 min ago',
        user: Person(
          name: 'Kr-bt',
          imageUrl: null,
          isVerified: true,
          address: 'Roast Woods',
        ),
        comment: 'Nice!!!',
        replies: 2,
      ),
      Comment(
        postedAt: '2 min ago',
        user: Person(
          name: 'Lina',
          imageUrl: 'assets/images/lina.jfif',
          isVerified: true,
          address: 'Roast Woods',
        ),
        comment: 'Cool!!!',
        replies: 3,
      ),
    ],
  ),
  NewsFeedWidgetModel(
    postDescription: '',
    postTextContent: 'I want someone for house cleaning. anyone interested?',
    postMediaType: PostMediaType.textContent,
    user: Person(
        imageUrl: 'assets/images/cacy.jfif',
        isVerified: false,
        name: 'Cacy Cruz',
        address: 'London woods,'),
    postedAt: '2 hr ago',
    postVisibility: 'General to Anyone',
    reacts: '7',
    comments: [
      Comment(
          postedAt: '1 min ago',
          user: Person(
            name: 'Kr-bt',
            imageUrl: null,
            isVerified: true,
            address: 'Roast Woods',
          ),
          comment: 'Nice!!!',
          replies: 2,
      ),
      Comment(
        postedAt: '2 min ago',
        user: Person(
          name: 'Lina',
          imageUrl: 'assets/images/lina.jfif',
          isVerified: true,
          address: 'Roast Woods',
        ),
        comment: 'Cool!!!',
        replies: 3,
      ),
    ],
  ),
  NewsFeedWidgetModel(
      postMediaType: PostMediaType.imageContent,
      user: Person(
          imageUrl: 'assets/images/lara.jfif',
          isVerified: true,
          name: 'Lara Craft',
          address: 'Near Palace'),
      postedAt: '2 min ago',
      postVisibility: 'General to Anyone',
      reacts: '150',
      postDescription: 'Wanna buy a cool sofa for just \$45',
      comments: [
        Comment(
          postedAt: '1 min ago',
          user: Person(
            name: 'Kr-bt',
            imageUrl: null,
            isVerified: true,
            address: 'Roast Woods',
          ),
          comment: 'Nice!!!',
          replies: 2,
        ),
        Comment(
          postedAt: '2 min ago',
          user: Person(
            name: 'Lina',
            imageUrl: 'assets/images/lina.jfif',
            isVerified: true,
            address: 'Roast Woods',
          ),
          comment: 'Cool!!!',
          replies: 3,
        ),
      ],
      imageUrl: 'assets/images/Zuo sofa.jfif'),
];
