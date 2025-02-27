import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:test_test/app/app.locator.dart';
import 'package:test_test/models/user_model.dart';
import 'package:test_test/services/user_service.dart';

class Home2ViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _userService = locator<UserService>(); // Injeção do serviço

  TextEditingController controller = TextEditingController();
  List<UserModel> usersList = [];
  UserModel? usuario;

  // Método para buscar todos os usuários através do UserService
  Future<void> getAllUsers() async {
    usersList = await _userService.getAllUsers();
    notifyListeners(); // Atualiza a UI com os novos dados
  }

  // Método para buscar um usuário pelo CPF através do UserService
  Future<void> getUserByCpf() async {
    String cpf = controller.text.trim();
    try {
      usuario = await _userService.getUserByCpf(cpf);
    } on Exception catch (e) {
      log('Usuário não encontrado: $e');
    }
    notifyListeners(); // Atualiza a UI
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
