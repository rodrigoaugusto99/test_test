import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:test_test/ui/views/home/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(title: const Text('Home View')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: model.controller,
                  decoration: const InputDecoration(
                    labelText: 'Digite o CPF',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: model
                      .getNameByCpf, // Chama a função apenas quando o botão for pressionado
                  child: const Text('Buscar Usuário'),
                ),
                // Outros widgets ou funcionalidades...
              ],
            ),
          ),
        );
      },
    );
  }
}
