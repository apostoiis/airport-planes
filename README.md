Airport
=======

### Makers Academy Week 3 - Test

This test was set by Enrique Comba Riepenhausen
[@ecomba](http://twitter.com/ecomba) and Alex Peattie
[@alexpeattie](https://twitter.com/alexpeattie) whilst learning to code at
[Makers Academy](http://www.makersacademy.com). The aim was to build an
object oriented model of airports and planes in Ruby.

#### Class Weather

| Responsibilities            | Collaborators |
| :-------------------------- | :------------ |
| can be sunny or stormy      | Airport       |
| can switch state at random  |               |

#### Class Plane

| Responsibilities                                    | Collaborators |
| :-------------------------------------------------- | :------------ |
| can land at an Airport, if clear to land            | Airport       |
| can take off from an Airport, if clear to take off  |               |

#### Class Airport

| Responsibilities                             | Collaborators |
| :------------------------------------------- | :------------ |
| has a maximum capacity of Planes             | Plane         |
| has a collection of Planes                   | Weather       |
| has its own Weather                          |               |
| can be clear for take offs and landings      |               |

![Airports](/images/logo.jpg)

How to use
---------------

```
clone git@github.com:Maikon/airport_test.git
cd airport-planes
[![rspec](https://codeclimate.com/github/apostoiis/airport-planes.png)](https://codeclimate.com/github/apostoiis/airport-planes)
```

