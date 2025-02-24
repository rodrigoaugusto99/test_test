import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_test/app/app.bottomsheets.dart';
import 'package:test_test/app/app.dialogs.dart';
import 'package:test_test/app/app.locator.dart';
import 'package:test_test/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();

  TextEditingController controller = TextEditingController();

  //todo: fazer um fromMap no UserModel e usar aqui pra transformar o mapa em UserModel

  //todo: listar na tela todos os usuarios (APENAS O NOME)

  //todo: metodo para aidiconar um usuario no banco

  //todo: atualizar usuario no banco

  //todo: pedir cpf, nome e idade
  //salvar na collection "users"
  //recuperar os dados do usuario pelo cpf
  Future<void> getNameByCpf() async {
    try {
      var querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('cpf', isEqualTo: controller.text)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        //querySnapshot são os resultados da busca (pode vir mais de um documento)
        /*Por que o resultado é mais de um se eu estou buscando pelo cpf? */

//todo: pegar o primeiro documento encontrado
//todo: transformar os dados desse documento em um UserModel (CRIAR USERMODEL)
//todo: mostrar na tela os dados desse usuario encontrado (cpf, nome e idade)
      }
      return; // Retorna null se nenhum usuário for encontrado
    } catch (e) {
      print("Erro ao buscar usuário: $e");
      return;
    }
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.iasmin,
    );
  }

  void showBottomSheet2() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.lola,
      title: 'titulo',
      description: 'descricao',
    );
  }

  //todo: ao clicar em um usuario, voce vai mostrar os dados desse usuario em um dialogo(TODOS OS DADOS) (fazer comigo)
}
