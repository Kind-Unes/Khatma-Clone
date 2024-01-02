import 'package:flutter/material.dart';
import 'package:khatma_azkar/Screens/services/Providers/searchButtonClearn.dart';
import 'package:khatma_azkar/ViewModels/countries_view_model.dart';
import 'package:provider/provider.dart';

class NationSelection extends StatelessWidget {
  const NationSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "المنبه اليومي",
              style: TextStyle(
                fontSize: 22,
                fontFamily: "khatma",
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            ChangeNotifierProvider(
              create: (context) => TextFieldModel(),
              child: Consumer<TextFieldModel>(
                builder: (context, model, child) {
                  return TextField(
                    textDirection: TextDirection.rtl, // or TextDirection.ltr

                    controller: model.controller,
                    onChanged: model.updateText,
                    decoration: InputDecoration(
                      labelStyle: const TextStyle(
                          color: Colors.black), // Set the label text color

                      hintText: '',
                      suffixIcon: const Icon(Icons.search),
                      prefixIcon: model.showClearButton
                          ? GestureDetector(
                              onTap: model.clearText,
                              child: const Icon(Icons.clear),
                            )
                          : null,
                    ),
                  );
                },
              ),
            ),
            Consumer<CountryViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.countries.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    itemCount: viewModel.countries.length,
                    itemBuilder: (context, index) {
                      final country = viewModel.countries[index];
                      return ListTile(
                        title: Text(country.name),
                        leading: Image.network(
                          country.flag,
                          width: 30,
                          height: 30,
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
