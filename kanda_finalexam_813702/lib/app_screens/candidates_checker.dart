import 'package:flutter/material.dart';
import 'package:kanda_finalexam_part3/states/candidates_provider.dart';
import 'package:provider/provider.dart';

class CandidatesChecker extends StatefulWidget {
  const CandidatesChecker({Key? key}) : super(key: key);

  @override
  State<CandidatesChecker> createState() => _CandidatesCheckerState();
}

class _CandidatesCheckerState extends State<CandidatesChecker> {
  final nameController = TextEditingController();
  String name = "";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CandidateInfoProvider>(
        create: (context) => CandidateInfoProvider(),
        child: Builder(builder: (context) {
          return Scaffold(
            body: Container(
              padding: const EdgeInsets.all(16),
              child: Form(child: Consumer<CandidateInfoProvider>(
                builder: (context, provider, child) {
                  return Column(
                    children: <Widget>[
                      Container(
                          padding: const EdgeInsets.symmetric(vertical:16.0),
                          margin: const EdgeInsets.symmetric(vertical:16.0),
                          child: const Text(
                              "Bangkok Governor Candidates",
                              style: TextStyle(
                                  fontSize: 28, color: Colors.pink))),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          hintText: "Type candidate name",
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          child: const Text("Check their number"),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blue, onPrimary: Colors.white),
                          onPressed: () {
                            //getting the text from TextField and converting it into int
                            name = nameController.text.trim();
                            provider.reset();
                            //Calling the method from provider.
                            provider.checkNumber(name);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(provider.name ?? "Name is not found",
                          style: const TextStyle(fontSize:26, color: Colors.green, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      Text(provider.numberStr ?? "Number is not available",
                      style: const TextStyle(fontSize:26, color: Colors.green, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      Visibility(
                          child: Image.asset(provider.imgFile ?? "images/blank.jpeg",
                          width: 500, height: 300, fit: BoxFit.contain),
                          visible: provider.imgFile != null ? true: false)
                    ],
                  );
                },
              )),
            ),
          );
        }));
  }
}
