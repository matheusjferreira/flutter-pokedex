import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/core/app_fonts.dart';
import '../../../shared/core/app_palette.dart';
import '../controllers/home_controller.dart';
import '../models/pokemons_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();
  PokemonsModel? pokedex;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final data = await controller.getPokemonsLIst();
    setState(() {
      pokedex = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              SizedBox(
                height: 150,
                child: Image.asset('assets/images/pokedex_logo.png'),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: pokedex != null
                    ? _buildGrid()
                    : const Center(child: CircularProgressIndicator()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildGrid() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1 / 0.75),
      itemCount: pokedex!.pokemon!.length,
      itemBuilder: (BuildContext context, int index) {
        String type = pokedex!.pokemon![index].type![0].toString();

        return Padding(
          padding: const EdgeInsets.all(8),
          child: InkWell(
            child: Container(
              decoration: BoxDecoration(
                  color: controller.backgroundColor(type),
                  borderRadius: BorderRadius.circular(24)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      pokedex!.pokemon![index].name.toString(),
                      style: AppFonts.subtileWhite,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: AppPalette.black.withOpacity(0.5)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              pokedex!.pokemon![index].type![0].toString(),
                              style: AppFonts.subtitleSmallWhite,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                color: AppPalette.white.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 8,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Hero(
                            tag: index,
                            child: CachedNetworkImage(
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              imageUrl: pokedex!.pokemon![index].img ?? '',
                              height: 90,
                              width: 90,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              Modular.to.pushNamed(
                '/details/',
                arguments: {
                  'heroTag': index,
                  'pokemonDetail': pokedex!.pokemon![index],
                  'color': controller.backgroundColor(type)
                },
              );
            },
          ),
        );
      },
    );
  }
}
