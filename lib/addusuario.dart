//importando as bibliotecas
import 'package:flutter/material.dart';
// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//criando a classe addUser
class AddUser extends StatelessWidget {
//criando 3 variaveis... FullName, Company e Age
  final String fullName;
  final String company;
  final int age;
//dizendo q quando chamarmos a classe AddUser nos devemos
  AddUser(this.fullName, this.company, this.age);

  @override
  Widget build(BuildContext context) {
    //criando a referencia a COLLECTION de nome USERS do firestore
    //desta forma ao digitarmos USERS vamos esta acessando a COLLECTION
    //users q ta no FB
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    //
    //criando o metodo/funcao addUser, q ao ser chamado vai atribuir um valor
    //as variaveis q criamos acima... e vai cadastrar elas na collection
    //do FB
    Future<void> addUser() {
      //chamando a collection references USERS feita acima
      return users
          //pegando os valores q estao nas variaveis fullname, company e age
          //q foram atribuidos no Main(), e cadastrando esses valores no FB
          .add({
            'full_name': fullName, // John Doe
            'company': company, // Stokes and Sons
            'age': age // 42
          })
          //se der certo exibe a mensagem
          .then((value) => print("User Added"))
          //se der errado exibe a mensagem
          .catchError((error) => print("Failed to add user: $error"));
    }

    //ao clicar no botao a baixo vamos executar o metodo/funcao addUser
    return TextButton(
      onPressed: addUser,
      child: Text(
        "Add User",
      ),
    );
  }
}
