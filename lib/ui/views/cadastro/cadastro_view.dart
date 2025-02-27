import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'cadastro_viewmodel.dart';

class CadastroView extends StackedView<CadastroViewModel> {
  const CadastroView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CadastroViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de Usuário')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: viewModel.cpfController, // Usa o controller
              decoration: const InputDecoration(labelText: 'CPF'),
            ),
            TextField(
              controller: viewModel.nomeController, // Usa o controller
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: viewModel.idadeController, // Usa o controller
              decoration: const InputDecoration(labelText: 'Idade'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: viewModel.cadastrarUsuario,
              child: const Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  CadastroViewModel viewModelBuilder(BuildContext context) =>
      CadastroViewModel();
}
