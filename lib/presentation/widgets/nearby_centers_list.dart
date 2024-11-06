import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/nearby_center_bloc.dart';

class NearbyCentersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NearbyCenterBloc, NearbyCenterState>(
      builder: (context, state) {
        if (state.nearbyCenters.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }
        return SizedBox(
          height: 310,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.nearbyCenters.length,
            itemBuilder: (context, index) {
              final center = state.nearbyCenters[index];
              return Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: SizedBox(
                  width: 220,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image.asset(
                              center.image,
                              height: 180,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: CircleAvatar(
                              backgroundColor:
                              const Color.fromRGBO(175, 184, 186, 1),
                              child: IconButton(
                                icon: const Icon(Icons.favorite_border,
                                    color: Colors.white),
                                onPressed: () {
                                  print('Added to favorites!');
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        center.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(28, 42, 59, 1),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        center.locationName,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(157, 164, 176, 1),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.star,
                              color: Colors.orange, size: 16),
                          const SizedBox(width: 4),
                          Text(
                              '${center.reviewRate} (${center.countReviews} Reviews)'),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text('${center.distanceKm} km'),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}