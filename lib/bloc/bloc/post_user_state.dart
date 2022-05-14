part of 'post_user_bloc.dart';

@immutable
class PostUserState {
  final List<XFile>? images;

  PostUserState({this.images});

  PostUserState copywith({List<XFile>? images}) =>
      PostUserState(images: images ?? this.images);
}
