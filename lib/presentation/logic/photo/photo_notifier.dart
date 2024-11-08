import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:suppose_test_task/data/models/user_model.dart';
import 'package:suppose_test_task/injector.dart';
import 'package:suppose_test_task/presentation/event_bus/event_bus.dart';
import 'package:suppose_test_task/presentation/event_bus/events/app_progress_event_for_toast.dart';
import 'package:suppose_test_task/presentation/logic/photo/photo_state.dart';
import 'package:suppose_test_task/presentation/router/app_router.dart';
import 'package:suppose_test_task/presentation/router/route_path.dart';

final photoProvider = StateNotifierProvider<PhotoNotifier, PhotoState>(
  (ref) {
    final userBox = Hive.box<User>('users');
    final eventBus = getIt<EventBus>();
    return PhotoNotifier(userBox, eventBus);
  },
);

class PhotoNotifier extends StateNotifier<PhotoState> {
  PhotoNotifier(this.userBox, this.eventBus) : super(const PhotoState());

  final Box<User> userBox;
  final EventBus eventBus;

  Future<void> pickPhoto(BuildContext context) async {
    var status = await Permission.camera.status;
    if (status.isGranted) {
      status = await Permission.camera.request();

      if (!status.isGranted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Camera permission is required to take photos.')),
        );
        return;
      }
    }

    try {
      state = state.copyWith(isLoading: true);
      eventBus.fire(AppProgressEventForToast());

      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.camera);

      if (image != null) {
        state = state.copyWith(photoPath: image.path, isSelected: true);
        final user = userBox.get('currentUser');
        if (user != null) {
          final updatedUser = user.copyWith(photoPath: image.path);
          await userBox.put('currentUser', updatedUser);
        } else {
          final newUser = User(
            name: '',
            birthday: '',
            gender: 'Unspecified',
            photoPath: image.path,
          );
          await userBox.put('currentUser', newUser);
        }

        AppRouter.router.go(RoutePath.photoPreview);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No photo selected.')),
        );
        debugPrint('No photo selected.');
      }

      state = state.copyWith(isLoading: false);
      eventBus.fire(AppProgressEventForToast(status: false));
    } catch (e) {
      state = state.copyWith(isLoading: false);
      eventBus.fire(AppProgressEventForToast(status: false));
      debugPrint('Error picking photo: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An error occurred while picking the photo.')),
      );
    }
  }

  Future<void> permissionDenied(BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Camera access is necessary to take photos.')),
    );
  }
}
