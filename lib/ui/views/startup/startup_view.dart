import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:test_test/ui/views/startup/startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(title: const Text('Startup View')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Campo para digitar o CPF
            TextField(
              decoration: const InputDecoration(labelText: 'Digite o CPF'),
              onChanged: (value) {
                // Guardar o valor digitado no campo de CPF
                // Esse valor pode ser passado diretamente para a função de consulta
              },
            ),
            const SizedBox(height: 10),

            // Botão para consultar o usuário
            ElevatedButton(
              onPressed: () async {
                // Substitua '12345678900' pelo CPF digitado no campo de texto
                await viewModel
                    .consultarUsuario('12345678900'); // Exemplo de CPF
              },
              child: const Text('Consultar Usuário'),
            ),
            const SizedBox(height: 20),

            // Exibir os dados do usuário
            if (viewModel.usuario != null)
              Column(
                children: [
                  Text('CPF: ${viewModel.usuario!.cpf}'),
                  Text('Nome: ${viewModel.usuario!.nome}'),
                  Text('Idade: ${viewModel.usuario!.idade}'),
                ],
              ),
            // Caso o usuário não tenha sido encontrado
            if (viewModel.usuario == null) const Text('Usuário não encontrado'),
          ],
        ),
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(BuildContext context) => StartupViewModel();
}
