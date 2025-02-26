import 'package:stacked/stacked.dart';
import 'package:test_test/app/app.locator.dart';
import 'package:test_test/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:test_test/models/user_model.dart'; // Importe o UserModel
import 'package:cloud_firestore/cloud_firestore.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  // Variável para armazenar o usuário encontrado
  UserModel? _usuario;

  // Getter para acessar o usuário de forma simples
  UserModel? get usuario => _usuario;

  // Função para consultar o usuário pelo CPF
  Future<void> consultarUsuario(String cpf) async {
    try {
      var snapshot =
          await FirebaseFirestore.instance.collection('users').doc(cpf).get();

      if (snapshot.exists) {
        // Criar um UserModel a partir dos dados do Firestore
        _usuario = UserModel.fromMap(snapshot.data()!, snapshot.id);
        notifyListeners(); // Notifica a UI para atualizar
      } else {
        print('Usuário não encontrado');
      }
    } catch (e) {
      print('Erro ao consultar o usuário: $e');
    }
  }

  // Função para navegar para a tela inicial
  void navToHome() {
    _navigationService.navigateToHome2View();
  }
}
