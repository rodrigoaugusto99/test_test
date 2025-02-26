import 'package:stacked/stacked.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CadastroViewModel extends BaseViewModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String cpf = '';
  String nome = '';
  int idade = 0;

  // Função para salvar o usuário no Firestore
  Future<void> cadastrarUsuario() async {
    if (cpf.isNotEmpty && nome.isNotEmpty && idade > 0) {
      try {
        await _firestore.collection('users').doc(cpf).set({
          'nome': nome,
          'idade': idade,
        });
      } catch (e) {
        // Handle error
        print('Erro ao salvar no Firestore: $e');
      }
    } else {
      print('Por favor, preencha todos os campos.');
    }
  }
}
