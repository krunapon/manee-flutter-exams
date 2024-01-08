import 'package:flutter/material.dart';
import 'package:finalexam_part1/states/eligibility_vote_provider.dart';
import 'package:provider/provider.dart';

class EligiblityVoteScreen extends StatelessWidget {
  final ageController = TextEditingController();

  EligiblityVoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EligibilityVoteProvider>(
        create: (context) => EligibilityVoteProvider(),
        child: Builder(
            builder: (context) {
              return Scaffold(
                body: Container(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                      child: Consumer<EligibilityVoteProvider>(
                        builder: (context, provider, child){
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    //if isEligible is null then set orange color else if it is true then set green else red
                                    color: (provider.isEligible == null) ?
                                    Colors.orangeAccent : provider.isEligible ? Colors.green : Colors.redAccent
                                ),
                                height: 50,
                                width: 50,
                              ),
                              const SizedBox(height: 16,),
                              TextFormField(
                                controller: ageController,
                                decoration: const InputDecoration(
                                  hintText: "Give your age",
                                ),
                              ),
                              const SizedBox(height: 16,),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  child: const Text("Check"),
                                  style: ElevatedButton.styleFrom(
                                    primary:Colors.blue,
                                    onPrimary: Colors.white),
                                  onPressed: (){
                                    //getting the text from TextField and converting it into int
                                    final int age = int.parse(ageController.text.trim());
                                    //Calling the method from provider.
                                    provider.checkEligibility(age);
                                  },
                                ),
                              ),
                              const SizedBox(height: 16,),
                              Text(provider.eligibilityMessage)
                            ],
                          );
                        },
                      )
                  ),
                ),
              );
            }
        )
    );
  }
}