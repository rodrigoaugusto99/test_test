import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:test_test/ui/common/app_colors.dart';
import 'package:test_test/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                verticalSpaceLarge,
                Column(
                  children: [
                    TextField(
                      controller: viewModel.controller,
                    ),
                    ElevatedButton(
                      onPressed: viewModel.getNameByCpf,
                      child: const Text('pesquisar'),
                    ),
                    ElevatedButton(
                      onPressed: viewModel.showBottomSheet2,
                      child: const Text('bottom sheet'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
