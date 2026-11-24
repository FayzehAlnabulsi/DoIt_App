import 'package:flutter/cupertino.dart';
import 'package:do_it/constants/app_colors.dart';
import 'package:do_it/CustomWidgets/app_text.dart';
import 'package:toastification/toastification.dart';

class CustomToaster extends StatelessWidget {
  const CustomToaster({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }

  static show({
    required BuildContext context,
    required String message,
    required bool isSuccess,
  }) {
    toastification.show(
      context: context,
      type: isSuccess ? ToastificationType.success : ToastificationType.error,
      closeButton: ToastCloseButton(
        buttonBuilder: (context, function) => SizedBox(),
      ),
      alignment: Alignment.bottomCenter,
      title: AppText(text: message),
      backgroundColor: isSuccess ? AppColor.success : AppColor.failure,
      autoCloseDuration: const Duration(seconds: 5),
    );
  }
}
