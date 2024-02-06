import 'package:flutter/material.dart';
import 'package:portifolio/constants.dart';
import 'package:portifolio/models/Recommendation.dart';
import 'package:portifolio/screens/home/components/recommendation_card.dart';

class Recommendations extends StatelessWidget {
  const Recommendations({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Column(
        children: [
          Text(
            "Recomendações",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: defaultPadding),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  demoRecommendations.length,
                  (index) => Padding(
                        padding: const EdgeInsets.only(right: defaultPadding),
                        child: RecommendationCard(
                            recommendation: demoRecommendations[index]),
                      )),
            ),
          )
        ],
      ),
    );
  }
}
