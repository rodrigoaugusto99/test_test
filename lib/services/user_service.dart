import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stacked/stacked.dart';

class UserService with ListenableServiceMixin {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Adicionar usuário no Firestore
  Future<void> addUser(
      {required String cpf, required String nome, required int idade}) async {
    try {
      await _firestore.collection("users").doc(cpf).set({
        "cpf": cpf,
        "nome": nome,
        "idade": idade,
      });
    } catch (e) {
      throw Exception("Erro ao adicionar usuário: $e");
    }
  }

  // Atualizar usuário no Firestore
  Future<void> updateUser(
      {required String cpf, String? nome, int? idade}) async {
    try {
      await _firestore.collection("users").doc(cpf).update({
        if (nome != null) "nome": nome,
        if (idade != null) "idade": idade,
      });
    } catch (e) {
      throw Exception("Erro ao atualizar usuário: $e");
    }
  }

  // Recuperar usuário pelo CPF
  Future<Map<String, dynamic>?> getUserByCpf(String cpf) async {
    try {
      DocumentSnapshot userDoc =
          await _firestore.collection("users").doc(cpf).get();
      return userDoc.exists ? userDoc.data() as Map<String, dynamic> : null;
    } catch (e) {
      throw Exception("Erro ao buscar usuário: $e");
    }
  }
}
