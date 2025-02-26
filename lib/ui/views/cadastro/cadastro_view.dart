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
              decoration: const InputDecoration(labelText: 'CPF'),
              onChanged: (value) {
                viewModel.cpf = value;
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Nome'),
              onChanged: (value) {
                viewModel.nome = value;
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Idade'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                viewModel.idade = int.tryParse(value) ?? 0;
              },
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
