import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_test/app/app.bottomsheets.dart';
import 'package:test_test/app/app.dialogs.dart';
import 'package:test_test/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:test_test/models/user_model.dart'; // Importando o UserModel

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();

  TextEditingController controller = TextEditingController();

  // Lista para armazenar todos os usuários (apenas nomes)
  List<UserModel> usersList = [];

  // Variável para o contador
  int counter = 0;

  // Método para incrementar o contador
  void incrementCounter() {
    counter++;
    notifyListeners(); // Notifica que o contador foi alterado e a UI deve ser atualizada
  }

  // Método para buscar um usuário pelo CPF
  Future<void> getNameByCpf() async {
    // Verifica se o CPF foi preenchido
    if (controller.text.isEmpty) {
      print("Por favor, insira um CPF.");
      return; // Não faz a busca se o CPF estiver vazio
    }

    try {
      var querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('cpf', isEqualTo: controller.text)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var userDoc = querySnapshot.docs.first;
        // Passando os dois parâmetros para o método fromMap
        UserModel user = UserModel.fromMap(userDoc.data(), userDoc.id);

        print('Usuário encontrado: ${user.nome}, ${user.cpf}, ${user.idade}');
      } else {
        print("Usuário não encontrado.");
      }
    } catch (e) {
      print("Erro ao buscar usuário: $e");
    }
  }

  // Método para exibir um BottomSheet com a lista de usuários
  void showBottomSheet2() {
    _bottomSheetService.showBottomSheet(
      title: 'Usuários',
      description: usersList.isNotEmpty
          ? usersList.map((user) => user.nome).join(', ')
          : 'Nenhum usuário encontrado.',
    );
  }
}
