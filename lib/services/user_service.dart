import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_test/models/user_model.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Método para adicionar um novo usuário ao Firestore
  Future<void> addUser(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.cpf).set(user.toMap());
      print("Usuário adicionado com sucesso!");
    } catch (e) {
      print("Erro ao adicionar usuário: $e");
    }
  }

  // Método para atualizar os dados de um usuário existente
  Future<void> updateUser(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.cpf).update(user.toMap());
      print("Usuário atualizado com sucesso!");
    } catch (e) {
      print("Erro ao atualizar usuário: $e");
    }
  }

  // Método para obter todos os usuários
  Future<List<UserModel>> getAllUsers() async {
    try {
      var querySnapshot = await _firestore.collection('users').get();
      return querySnapshot.docs.map((doc) {
        return UserModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      print("Erro ao buscar usuários: $e");
      return [];
    }
  }

  // Método para buscar usuário pelo CPF
  Future<UserModel?> getUserByCpf(String cpf) async {
    try {
      var docSnapshot = await _firestore.collection('users').doc(cpf).get();
      if (docSnapshot.exists) {
        return UserModel.fromMap(docSnapshot.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print("Erro ao buscar usuário: $e");
    }
    return null;
  }
}
