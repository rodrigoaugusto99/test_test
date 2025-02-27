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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: viewModel.controller,
              decoration: const InputDecoration(
                labelText: 'Digite o CPF',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: viewModel.getUserByCpf,
                child: const Text('Buscar Usuário'),
              ),
            ),
            const SizedBox(height: 20),

            // 🔹 Exibir os dados do usuário encontrado
            if (viewModel.usuario != null) ...[
              Text(
                'Nome: ${viewModel.usuario!.nome}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                'CPF: ${viewModel.usuario!.cpf}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 5),
              Text(
                'Idade: ${viewModel.usuario!.idade}',
                style: const TextStyle(fontSize: 16),
              ),
            ] else if (viewModel.isBusy) ...[
              const Center(
                  child:
                      CircularProgressIndicator()), // Indicador de carregamento
            ] else ...[
              const Text('Nenhum usuário encontrado.',
                  style: TextStyle(color: Colors.red)),
            ],
          ],
        ),
      ),
    );
  }

  @override
  Home2ViewModel viewModelBuilder(BuildContext context) => Home2ViewModel();
}
