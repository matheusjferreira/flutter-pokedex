import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/shared/core/app_palette.dart';

import '../../../shared/core/app_fonts.dart';

class DetailsPage extends StatefulWidget {
  final int heroTag;
  final dynamic pokemonDetail;
  final Color color;

  const DetailsPage({
    Key? key,
    required this.heroTag,
    required this.pokemonDetail,
    required this.color,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHead(),
              _buildDetails(),
            ],
          ),
        ),
      ),
    );
  }

  _buildHead() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        color: widget.color,
      ),
      height: MediaQuery.of(context).size.height / 2,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
                onPressed: () => Modular.to.pop(context),
                icon: const Icon(Icons.chevron_left)),
          ),
          Text(
            widget.pokemonDetail.name,
            style: AppFonts.titleWhite,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppPalette.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.pokemonDetail.type.join(', '),
                        style: AppFonts.subtileWhite),
                  ),
                ),
                Text('#${widget.pokemonDetail.num}',
                    style: AppFonts.subtileWhite),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: AppPalette.black.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 8,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Hero(
              tag: widget.heroTag,
              child: CachedNetworkImage(
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                imageUrl: widget.pokemonDetail.img,
                height: 150,
                width: 150,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 32),
          _buildDetailRow('Height', widget.pokemonDetail.height),
          _buildDetailRow('Weight', widget.pokemonDetail.weight),
          _buildDetailRow('Spawn Chance', widget.pokemonDetail.spawnChance.toString()),
          _buildDetailRow('Avg Spawns', widget.pokemonDetail.avgSpawns.toString()),
          _buildDetailRow('Spawn Time', widget.pokemonDetail.spawnTime),
          _buildDetailRow('Weaknesses', widget.pokemonDetail.weaknesses.join(', ')),
          widget.pokemonDetail.prevEvolution != null
              ? _buildDetailRow('Pre Evolution', widget.pokemonDetail.prevEvolution[0].name)
              : _buildDetailRow('Pre Evolution', 'Just Hatched'),
          widget.pokemonDetail.nextEvolution != null
              ? _buildDetailRow('Next Evolution', widget.pokemonDetail.nextEvolution[0].name)
              : _buildDetailRow('Next Evolutio', 'Maxed Out'),
        ],
      ),
    );
  }

  _buildDetailRow(String label, String description) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: Text(
            label,
            style: AppFonts.bodyTitle,
          ),
        ),
        Expanded(
          child: Text(
            description,
            style: AppFonts.bodyText,
            maxLines: 3,
          ),
        ),
      ],
    );
  }
}
