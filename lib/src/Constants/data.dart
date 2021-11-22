class Categories {
  final String? image;
  final String? name;

  Categories({this.image, this.name});
}

final List<Categories> category = [
  Categories(
      image:
          'https://media.istockphoto.com/photos/healthy-fresh-rainbow-colored-fruits-and-vegetables-background-picture-id1208790371?s=612x612',
      name: 'Fruit and Vegetable'),
  Categories(
      image:
          'https://www.google.com/url?sa=i&url=https%3A%2F%2Forigin.club%2Fstaples%2Fedible-oils.html&psig=AOvVaw0gEyXEK7PVnT8bmuwbq-Xe&ust=1635923973818000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCKjC9e6R-fMCFQAAAAAdAAAAABAD',
      name: 'Staples'),
  Categories(
      image:
          'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.foodbusinessnews.net%2Farticles%2F15350-theres-a-beverage-for-that&psig=AOvVaw2WksGwZ-QL9OoSDqno9NS7&ust=1635924004124000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCPjlyoiS-fMCFQAAAAAdAAAAABAI',
      name: 'Beverages'),
  Categories(
      image:
          'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.shutterstock.com%2Fsearch%2Fpersonal%2Bcare%2Bproducts&psig=AOvVaw37wGl7aitFOivBrCTf1yDK&ust=1635924114731000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCMD7vbGS-fMCFQAAAAAdAAAAABAD',
      name: 'Personal Care'),
  Categories(
      image:
          'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.dreamstime.com%2Fphotos-images%2Fhomecare.html&psig=AOvVaw049LltBNpZeJO67F2ejdZQ&ust=1635924190903000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCKCvtuKS-fMCFQAAAAAdAAAAABAD',
      name: 'Home Care'),
  Categories(
      image:
          'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.foodbusinessnews.net%2Farticles%2F13814-the-future-of-snacking-flavorful-functional-and-full-of-opportunity&psig=AOvVaw1FKStQS7mKXtefAP_qdkV2&ust=1635924250903000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCIC2nfSS-fMCFQAAAAAdAAAAABAD',
      name: 'Snacks'),
];

//Carosel

class Carosel {
  final String imageURL;

  Carosel({
    this.imageURL = '',
  });
}

final List<Carosel> carosel = [
  Carosel(
    imageURL : 'assets/images/carosel1.jpg'
  ),
  Carosel(
    imageURL : 'assets/images/carosel2.jpg'
  ),
  Carosel(
    imageURL : 'assets/images/carosel3.jpg'
  ),
  Carosel(
    imageURL : 'assets/images/carosel4.jpg'
  ),
  Carosel(
    imageURL : 'assets/images/carosel5.jpg'
  ),
];