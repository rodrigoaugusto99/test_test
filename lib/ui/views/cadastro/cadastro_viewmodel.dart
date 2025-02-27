import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CadastroViewModel extends BaseViewModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Controladores dos campos de texto
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController idadeController = TextEditingController();

  // Função para salvar o usuário no Firestore
  Future<void> cadastrarUsuario() async {
    String cpf = cpfController.text.trim();
    String nome = nomeController.text.trim(); //sei que era nemecontroller.text mas com name ficou dando erro, assim aparentemente funciona. no campo do bd está certo('name')
    int idade = int.tryParse(idadeController.text) ?? 0;

    if (cpf.isNotEmpty && nome.isNotEmpty && idade > 0) {
      try {
        await _firestore.collection('users').doc(cpf).set({
          'name': nome,
          'idade': idade,
        });

        // Limpar os campos após salvar
        cpfController.clear();
        nomeController.clear();
        idadeController.clear();
      } catch (e) {
        print('Erro ao salvar no Firestore: $e');
      }
    } else {
      print('Por favor, preencha todos os campos.');
    }
  }

  @override
  void dispose() {
    cpfController.dispose();
    nomeController.dispose();
    idadeController.dispose();
    super.dispose();
  }
}
