# OrderCalculator

Um programa de linha de comando capaz de calcular o valor final de um pedido em um e-commerce.


Cálculo do Valor Final do Pedido

O valor total do pedido é a soma do valor dos produtos do pedido menos o Desconto. Cada pedido possui no máximo uma unidade de cada produto.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'order_calculator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install order_calculator

## Usage

Executar o comando 'exercicio' com os nomes dos quatro arquivos

```bash
exercicio cupons.csv products.csv orders.csv order_items.csv totals.csv
```
