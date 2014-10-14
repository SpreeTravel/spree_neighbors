Spree Neighbors
==============
Spree Neighbors, is an extension of spree e-commerce platform. It depends of [Spree Location](https://github.com/openjaf/spree_location/) project, and it provides spree's products with another way of relating them, the "near" product relation.

###Important Note
The Spree Neighbors project is a work in progress, and will suffer major changes. Please use it and keep a live feedback with the team by opening a [GitHub issue](https://github.com/openjaf/spree_neighbors/issues/new).

Requirements
------------
### Rails and Spree
Spree Neighbors now requires Rails version **>= 4.0** and a Spree version **>=2.1**.
### Spree Location
Spree Neighbors now requires a Spree Location version **>=2.1**.

Installation
------------

Spree Neighbors is not yet distributed as a gem, so it should be used in your app with a git reference or you can download the source and build the gem on your own.

1. Add the following to your Gemfile

  ```ruby
    gem 'spree_neighbors’, :git => 'https://github.com/openjaf/spree_neighbors.git', :branch => 'master'
  ```

2. Run `bundle install`

3. To copy and apply migrations run:

  ```
  rails g spree_neighbors:install
  ```

Features
------------

- Adds a new property to products, the neighbors, or near products.
- Adds a way to relate products by the distance between them.
- Allows to control wich items will be marked as close to each other, a way to control haow many will be shown and a way to sort them.
- Shows a map with the location of the related products, and a list beneath with links to those related.


How to use it
------------

After installing the extensions go to **admin/products** and from the products list, select one of the products and a link will appear on the bar on the right side of the view with the text **NEIGHBORS**.

![Edit Neighbors Selection](/readme_images/edit_view.jpg?raw=true "Neighbors Edit View")

All the configurations to show product neighbors are shown in this view:

1. How many neighbors will be shown
2. How far will be considered a neighbor
3. On wich criteria, the neighbors will be ordered.
4. If a neighbor will be considered if it haves certain property.
5. Add neighbors manually to the list.

The map resulting of this configuration will be showed on the product details view, centered between all the neighbors:

![map view](/readme_images/details_view.jpg?raw=true "Products Details View")


Contributing
------------

If you'd like to contribute a feature or bugfix: Thanks! To make sure your
fix/feature has a high chance of being included, please read the following
guidelines:

1. Post a [pull request](https://github.com/openjaf/spree_neighbors/compare/).
2. Or open a [GitHub issue](https://github.com/openjaf/spree_neighbors/issues/new).

License
-------

Spree Neighbors is Copyright © 2014 openjaf. It is free software, and may be
redistributed under the terms specified in the MIT-LICENSE file.
