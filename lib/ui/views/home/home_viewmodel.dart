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

  // Método para obter todos os usuários da coleção "users" e listar apenas o nome
  Future<void> getAllUsers() async {
    try {
      var querySnapshot =
          await FirebaseFirestore.instance.collection('users').get();

      if (querySnapshot.docs.isNotEmpty) {
        usersList = querySnapshot.docs.map((doc) {
          return UserModel.fromMap(
              doc.data(), doc.id); // Agora passando o doc.id (CPF) também
        }).toList();

        print(usersList.map((user) => user.nome).toList()); // Exibir no console

        notifyListeners();
      } else {
        print("Nenhum usuário encontrado.");
      }
    } catch (e) {
      print("Erro ao buscar usuários: $e");
    }
  }

  // Método para buscar um usuário pelo CPF
  Future<void> getNameByCpf() async {
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
