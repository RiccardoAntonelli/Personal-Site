import 'dart:math';
import 'dart:ui';

Path getPathPortion(Path path, double animationPercent) {
  final totalLength = path
      .computeMetrics()
      .fold(0.0, (double prev, PathMetric metric) => prev + metric.length);
  final currentLength = totalLength * animationPercent;

  return extractPathUntilLength(path, currentLength);
}

Path extractPathUntilLength(Path originalPath, double length) {
  double currentLength = 0.0;
  final Path path = Path();
  Iterator metricsIterator = originalPath.computeMetrics().iterator;

  while (metricsIterator.moveNext()) {
    dynamic metric = metricsIterator.current;
    double nextLength = currentLength + metric.length;
    final bool isLastSegment = nextLength > length;

    if (isLastSegment) {
      final double remainingLength = length - currentLength;
      final Path pathSegment = metric.extractPath(0.0, remainingLength);

      path.addPath(pathSegment, Offset.zero);
      break;
    } else {
      final Path pathSegment = metric.extractPath(0.0, metric.length);
      path.addPath(pathSegment, Offset.zero);
    }
    currentLength = nextLength;
  }
  return path;
}

double radiansToDegrees(double degrees) => (degrees * pi) / 180;
