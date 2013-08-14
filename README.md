SpreeNeighbors
==============

Relaciona productos cercanos a un producto.

- depende de spree_location

- define relacion neighbor (i_am_close_to_this_product)

- modifica vista show para mostrar los vecino diferenciandolos del propio producto.

- en la vista admin se pueden configurar varias cosas (especificar bien)

	define el métodos [productos_cercanos (nearest)]

	por defecto devuelve los productos relacionados con la relación i_am_related_to_this_product

	los herederos lo pueden sobreescribir

Spree::Config

	how_many_near_products

	max_distance_in_map

	show_nearest_or_related (con las relaciones)
	en la interfaz de admin permite configurar estas cosas.


Installation
------------

Add spree_neighbors to your Gemfile:

```ruby
gem 'spree_neighbors'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_neighbors:install
```

Copy migrations from spree_neighbors to application:

```shell
bundle exec rake spree_neighbors:install:migrations
```

