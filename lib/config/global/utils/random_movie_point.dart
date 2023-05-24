import 'dart:math';

getRandomMoviePoint({required double minPoint, required double maxPoint}) =>
    (minPoint + Random().nextDouble() * (maxPoint - minPoint))
        .toStringAsFixed(1)
        .toString();
