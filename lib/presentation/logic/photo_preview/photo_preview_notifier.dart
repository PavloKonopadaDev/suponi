import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suppose_test_task/data/data_sources/local_data_source/session_storage.dart';
import 'package:suppose_test_task/injector.dart';
import 'photo_preview_state.dart';

final photoPreviewProvider = StateNotifierProvider<PhotoPreviewNotifier, PhotoPreviewState>(
  (ref) => PhotoPreviewNotifier(),
);

class PhotoPreviewNotifier extends StateNotifier<PhotoPreviewState> {
  PhotoPreviewNotifier() : super(const PhotoPreviewState()) {
    _loadPhoto();
  }

  final LocalDataSource _localDataSource = getIt<LocalDataSource>();

  Future<void> _loadPhoto() async {
    state = state.copyWith(isLoading: true);
    final photoPath = _localDataSource.getCapturedPhotoPath();

    state = state.copyWith(photoPath: photoPath, isLoading: false);
  }

  Future<void> loadPhoto() async {
    await _loadPhoto();
  }
}
