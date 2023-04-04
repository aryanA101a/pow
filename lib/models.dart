class LngLat {
  final double longitude;
  final double latitude;

  const LngLat(
    this.longitude,
    this.latitude,
  );

  @override
  String toString() {
    return '($longitude,$latitude)';
  }
}
