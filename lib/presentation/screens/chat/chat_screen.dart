// shct -> importM 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

// shct -> stlesw
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://image-cdn.essentiallysports.com/wp-content/uploads/call-of-duty-modern-warfare-II-warzone-2-season-3-alejandro-valeria-96x96.jpg'),
          ),
        ),
        title: const Text('Valeria WZ ❤️'),
        // centerTitle: true, // centrar el title del appbar
      ),
      body: _ChatView(),
    );
  }
}

// <div> 
class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // ?como cuando hacemos busqueda de un tema, aqui buscamos la instancia de ChatProvider
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            // Expandir div al 100% de la pantalla
            // Expanded(child: Container(
            //   color: Colors.blue.shade900,
            // )),
            Expanded(child: ListView.builder(
              controller: chatProvider.chatScrollController,
              // si no se usa esta property el list sera infinito
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messageList[index];
                // final imageUrl = 
                return (message.fromWho == FromWho.hers )
                  ? HerMessageBubble(message: message)
                  : MyMessageBubble(message: message);


                // si es un numero par
                //   return (index % 2 == 0)
                //     ? const HerMessageBubble()
                //     : const MyMessageBubble();
                // },
              }
            )
          ),

            /// Caja de text de mensajes
            MessageFieldBox(
              onValue: (value) => chatProvider.sendMessage(value),
              //~ hacen lo mismo -> cuando tienen la misma cantidad de argumentos y en las mismas posiciones 
              // onValue: chatProvider.sendMessage,
            )
          ],
        ),
      ),
    );
  }
}
