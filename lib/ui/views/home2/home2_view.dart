import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home2_viewmodel.dart';

class Home2View extends StackedView<Home2ViewModel> {
  const Home2View({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    Home2ViewModel viewModel,
    Widget? child,
  ) {
   return Scaffold(
          appBar: AppBar(title: const Text('Home View')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: viewModel.controller,
                  decoration: const InputDecoration(
                    labelText: 'Digite o CPF',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: viewModel
                      .getNameByCpf, // Chama a função apenas quando o botão for pressionado
                  child: const Text('Buscar Usuário'),
                ),
                // Outros widgets ou funcionalidades...
              ],
            ),
          ),
        );
  }

  @override
  Home2ViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      Home2ViewModel();
}
