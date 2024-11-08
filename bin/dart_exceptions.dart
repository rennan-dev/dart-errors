import 'dart:math';

import 'controllers/bank_controller.dart';
import 'exceptions/bank_controller_exceptions.dart';
import 'models/account.dart';

void testingNullSafety() {

    // Account? myAccount;

    // //simulando uma comunicação externa
    // Random rng = Random();
    // int randomNumber = rng.nextInt(10);
    // if(randomNumber <= 5) {
    //     myAccount = Account(name: "Rennan", balance: 123, isAuthenticated: true);
    // }

    // print(myAccount.runtimeType);
    // //print(myAccount.balance);
    // //print(myAccount!.balance);
    
    // //primeira opção com sucesso
    // // if(myAccount!=null) {
    // //     print(myAccount.balance);
    // // }else {
    // //     print("Conta nula");
    // // }

    // //segunda opção com sucesso
    // //print(myAccount!=null? myAccount.balance : "Conta nula.");

    // //terceira opção com sucesso
    // print(myAccount?.balance);

    Account myAccount = Account(name: "Rennan", balance: 123, isAuthenticated: true);

    //simulando uma comunicação externa
    Random rng = Random();
    int randomNumber = rng.nextInt(10);
    if(randomNumber <= 5) {
        myAccount.createdAt = DateTime.now();   
    }

    print(myAccount.createdAt);
    //print(myAccount.createdAt.day);
    print(myAccount.createdAt!.day);

    if(myAccount!=null) {
        print(myAccount.balance);
        if(myAccount.createdAt!=null) {
            print(myAccount.createdAt!.day);
        }
    }else {
        print("Conta nula");
    }
}

void main() {
    testingNullSafety();
    // print("My String".runtimeType);
    // print(null.runtimeType);
    // Null;

    // String naoPodeSerNula = "MyString";
    // //naoPodeSerNula = null;
    // String? podeSerNula = "MyString";
    // print(podeSerNula.runtimeType);
    // podeSerNula = null;
    // print(podeSerNula.runtimeType);










  // Criando o banco
  BankController bankController = BankController();

  //Account accountTeste = Account(name: "", balance: -1, isAuthenticated: true);

  // Adicionando contas
  bankController.addAccount(
      id: "Ricarth",
      account:
          Account(name: "Ricarth Lima", balance: 400, isAuthenticated: true));

  bankController.addAccount(
      id: "Kako",
      account:
          Account(name: "Caio Couto", balance: 600, isAuthenticated: true));

  // Fazendo transferência
  try {
    bool result = bankController.makeTransfer(
      idSender: "Kako", idReceiver: "Ricarth", amount: 10);
    
    if(result) {
        //print("Transação concluída com sucesso.");
    }
     
  } on SenderIdInvalidException catch(e) {
    print(e);
    print("O ID ${e.idSender} não é um remetente válido");
  } on ReceiverIdInvalidException catch(e) {
    print(e);
    print("O ID ${e.idReceiver} não é um destinatário válido");
  } on SenderNotAuthenticatedException catch(e) {
    print(e);
    print("O usuário remetente com o ID ${e.idSender} não está autenticado.");
  } on SenderBalanceLowerThanAmountException catch(e) {
    print(e);
    print("O usuário de ID ${e.idSender} tentou enviar ${e.amount} sendo que na sua conta possui apenas ${e.senderBalance}");
  } on Exception {
    print("Algo deu errado.");
  }
}

// void main() {
//     try {
//         testFunc();
//     } catch(e) {
//         print(e.runtimeType);
//     }
// }

// void testFunc() {
//     throw Account(name: "Rennan", balance: 2000, isAuthenticated: true);
// }