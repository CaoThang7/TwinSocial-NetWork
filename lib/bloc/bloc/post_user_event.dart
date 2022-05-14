part of 'post_user_bloc.dart';

@immutable
abstract class PostUserEvent {}

class onSelectMultipleImageEvent extends PostUserEvent {
  final List<XFile> images;

  onSelectMultipleImageEvent(this.images);
}

class onUnSelectMultipleImageEvent extends PostUserEvent {}
