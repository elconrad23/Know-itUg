class SRHInfo {
  // title
  final String title;
  // description
  final String description;
  // image
  final String image;
  // category
  final String category;

  // TODO 1: Add sections to the texts in the app so that they can easily be styled
  //  this will be a list of strings that will be used to style the text in the app when looped over
  // final List<String> sections; and is as a result of splitting the description into sections

  SRHInfo({
    required this.title,
    required this.description,
    required this.category,
    this.image = "Add images for each here",
  });
}
