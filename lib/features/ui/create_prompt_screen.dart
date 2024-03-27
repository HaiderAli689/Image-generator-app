import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:midjourneya/features/prompt/bloc/prompt_bloc.dart';

class CreatePromptScreen extends StatefulWidget {
  const CreatePromptScreen({super.key});

  @override
  State<CreatePromptScreen> createState() => _CreatePromptScreenState();
}

class _CreatePromptScreenState extends State<CreatePromptScreen> {
  TextEditingController promptController = TextEditingController();
  final PromptBloc promptBloc = PromptBloc();


  @override
  void initState() {
    // TODO: implement initState
    promptBloc.add(PromptInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generate Images🚀'),
        centerTitle: true,
      ),
      body: BlocConsumer<PromptBloc, PromptState>(
        bloc: promptBloc,
        listener: (context, state){

        },
        builder: (context, state){
          switch(state.runtimeType){
            case PromptGeneratingImageLoadState:
              return Center(
                child: CircularProgressIndicator(),
              );
            case PromptGeneratingImageErrorState:
              return Center(child: Text("Something went Wrong!"),);
            case PromptGeneratingImageSuccessState:
              final success = state as PromptGeneratingImageSuccessState;
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                                image: MemoryImage(success.uint8list),
                            ),
                          ),
                        )),
                    Container(
                      height: 240,
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Enter your prompt',style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                          ),),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            cursorColor: Colors.deepPurple,
                            controller: promptController,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.deepPurple),
                                  borderRadius: BorderRadius.circular(12)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 48,
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(Colors.deepPurple)
                              ),
                              onPressed: (){
                                if(promptController.text.isNotEmpty){
                                  promptBloc.add(PromptEnteredEvent(prompt: promptController.text));

                                }
                              }, icon: Icon(Icons.generating_tokens),
                              label: Text('Generate'),),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
              break;
            default:
              return SizedBox();
          }

        },
      ),
    );
  }
}
