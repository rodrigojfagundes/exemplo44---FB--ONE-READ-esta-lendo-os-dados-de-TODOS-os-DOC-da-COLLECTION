//
//para fazer essa classe eu peguei o q tava: https://firebase.flutter.dev/docs/firestore/usage/
//modifiquei o REAL-TIME CHANGES com o ONE TIME READ...
//e gracas a Deus deu certo
//assim faz uma UNICA LEITURA (NAO FICA ATUALIZANDO) e pega todos valores
//pretendidos q estao em TODOS DOC da COLLECTION
//
//
import 'package:flutter/material.dart';
// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'main.dart';

//criando a classe
class GetUserNameModificadoPorRODRIGO extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    //fazendo uma referencia a collection USERS
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    //o FutureBuilder é uma Construcao Futura, ou seja no futuro vamos construir
    //algo com base no q ta no QuerySnapshot
    //o QuerySnapshot é uma Requisição de uma FOTO/"estado atual"...no caso
    //sera feito uma foto"estado atual" do q ta na collection Users
    return FutureBuilder<QuerySnapshot>(
      //o future vai receber os dados/get da collection Users
      future: users.get(),
      //o builder ta dizendo q vamos construir algo com base
      //nos dados q recebemos do Users.Get acima
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        //se tiver erro exibe a mensagem
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
        //se a conexao estiver ok/aguardando
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        //apos isso vamos retornar um ListView
        return ListView(
          //"tirando uma foto"/pegando estado atual, e nela pegando
          //os valores q estao nos DOC desta collection
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            //Map vai receber um valor tipo String e outro Dynamic...
            //o STRING vai ser o da "CHAVE": do documento
            //e o DYNAMIC é o "VALOR" da chave... dos doc q estao armazenados
            //nessa collection
            Map<String, dynamic> data =
                //a variavel DATA acima, vai receber os DADOS dos DOCUMENTOS q estao
                //dentro da COLLECTION USERS... esses dados q a variavel DATA vai
                //receber são do tipo MAP sendo CHAVE:VALOR (string, dynamic)
                document.data()! as Map<String, dynamic>;
            //apos realizar os processos acima, vamos chamar o MATERIAL
            return Material(
              //exibindo as informacoes em uma LISTA (uma em baixo da outra)
              child: ListTile(
                //para o titulo vamos acessar o q ta na DATA e pegar de todos
                //os DOC da Collection USERS e exibir todos q tem algo escrito
                //associado a chave FULL_NAME... e exibir o valor
                title: Text(data['full_name']),
                //para o subtitulo vamos acessar o q ta na DATA e pegar de todos
                //os DOC da Collection USERS e exibir todos q tem algo escrito
                //associado a chave COMPANY... e exibir o valor
                subtitle: Text(data['company']),
                //
                //tambem podemos fazer com um CONTAINER no lugar de LISTTILE
                //return Container(
                //child: Text(data['full_name']),
                //);
                //
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
