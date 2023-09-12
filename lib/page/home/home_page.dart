import 'package:cep/model/via_cep_model.dart';
import 'package:cep/page/endereco/endereco_page.dart';
import 'package:cep/page/home/widgets/cabecalho_via_cep.dart';
import 'package:cep/repository/via_cep_repository.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ViaCepRepository viaCepRepository = ViaCepRepository();

  final cidadeEC = TextEditingController();
  final ruaEC = TextEditingController();

  int currrentStep = 0;
  String _estado = "";
  List<ViaCepModel> enderecos = [];

  @override
  void dispose() {
    super.dispose();
    cidadeEC.dispose();
    ruaEC.dispose();
  }

  carregandoDadosViaCep() async {
    enderecos = await viaCepRepository.obterEnderecos(
      _estado,
      cidadeEC.text,
      ruaEC.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CabecalhoViaCep(),
              const Divider(),
              Center(
                child: Stepper(
                  currentStep: currrentStep,
                  onStepTapped: (index) {
                    setState(() => currrentStep = index);
                  },
                  onStepContinue: () {
                    if (currrentStep != 2) {
                      setState(() => currrentStep++);
                    }

                    if (currrentStep == 2 &&
                        _estado != "" &&
                        cidadeEC.text != "" &&
                        ruaEC.text != "") {
                      carregandoDadosViaCep();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => EnderecoPage(
                            enderecosEncontrados: enderecos,
                            cidade: cidadeEC.text,
                          ),
                        ),
                      );
                    }
                  },
                  onStepCancel: () {
                    if (currrentStep != 0) {
                      setState(() => currrentStep--);
                    }
                  },
                  steps: [
                    //! estado
                    Step(
                      isActive: currrentStep >= 0,
                      title: Text("Buscar em: $_estado"),
                      content: DropdownButton<String>(
                        hint: const Text('Selecione um estado'),
                        onChanged: (regiaoSelecionada) {
                          setState(() {
                            _estado = regiaoSelecionada.toString();
                          });
                        },
                        items: Estados.listaEstadosSigla.map((String estado) {
                          return DropdownMenuItem(
                            value: estado,
                            child: Text(estado),
                          );
                        }).toList(),
                      ),
                    ),
                    //! cidade
                    Step(
                      isActive: currrentStep >= 1,
                      title: Text("Cidade: ${cidadeEC.text}"),
                      content: TextFormField(
                        controller: cidadeEC,
                        decoration: const InputDecoration(
                          label: Text("Digiti o nome da cidade"),
                        ),
                      ),
                    ),
                    //! rua
                    Step(
                      isActive: currrentStep >= 2,
                      title: const Text("Rua:"),
                      content: TextFormField(
                        controller: ruaEC,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
