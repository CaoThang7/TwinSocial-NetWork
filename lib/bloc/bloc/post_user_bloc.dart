import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'post_user_event.dart';
part 'post_user_state.dart';

class PostUserBloc extends Bloc<PostUserEvent, PostUserState> {
  PostUserBloc() : super(PostUserState()) {
    on<onSelectMultipleImageEvent>((_onSelectMultipleImages));
    on<onUnSelectMultipleImageEvent>((_onUnSelectMultipleImages));
  }

  Future<void> _onSelectMultipleImages(
      onSelectMultipleImageEvent event, Emitter<PostUserState> emit) async {
    emit(state.copywith(images: event.images));
  }

  Future<void> _onUnSelectMultipleImages(
      onUnSelectMultipleImageEvent event, Emitter<PostUserState> emit) async {
    emit(state.copywith(images: []));
  }
}
