import 'package:flutter/material.dart';
import 'package:test_test/ui/common/app_colors.dart';
import 'package:test_test/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'iasmin_dialog_model.dart';

const double _graphicSize = 60;

class IasminDialog extends StackedView<IasminDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const IasminDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    IasminDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Text('meu novo dialogo IASMIN')],
        ),
      ),
    );
  }

  @override
  IasminDialogModel viewModelBuilder(BuildContext context) =>
      IasminDialogModel();
}
