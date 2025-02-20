# Scan&eat

CulinarioSupport es una plataforma diseñada para ayudar a los restaurantes a crear su propia **landing page** con productos y un sistema de pedidos en línea, mejorando así la experiencia del cliente y optimizando el servicio.

## Tecnologías utilizadas

El proyecto está desarrollado utilizando las siguientes tecnologías:

- **Ruby on Rails**: Framework principal que sigue la arquitectura **MVC**.
- **HTML & CSS**: Para el diseño y estructura de las páginas web.
- **Git & GitHub**: Control de versiones y colaboración en equipo.
- **Vercel**: Implementación y despliegue de la aplicación frontend.

## Arquitectura MVC en CulinarioSupport

La aplicación sigue el patrón **Modelo-Vista-Controlador (MVC)**, lo que permite una separación clara de responsabilidades:

### **1. Modelo (Model)**
Define la estructura de los datos y la lógica de negocio. Se utilizan modelos de **ActiveRecord** en Ruby on Rails para interactuar con la base de datos.

#### **Ejemplo de un modelo de producto**
```ruby
class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }
end
```

### **2. Vista (View)**
Las vistas contienen la interfaz de usuario utilizando **HTML y CSS**. En Rails, se manejan con archivos **ERB** (`.html.erb`), que permiten incrustar código Ruby dentro de HTML.

#### **Ejemplo de una vista para mostrar productos**
```erb
<h1>Menú</h1>
<ul>
  <% @products.each do |product| %>
    <li><%= product.name %> - $<%= product.price %></li>
  <% end %>
</ul>
```

### **3. Controlador (Controller)**
Gestiona la lógica de la aplicación y responde a las peticiones del usuario. Se encarga de interactuar con los modelos y enviar los datos a la vista.

#### **Ejemplo de un controlador para productos**
```ruby
class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
end
```

## Flujo de funcionamiento

1. Un usuario accede a la landing page de un restaurante.
2. Se muestra un listado de productos recuperados desde la base de datos.
3. El cliente selecciona productos y realiza un pedido.
4. Se procesa la orden y se notifica al restaurante.

## Implementación y despliegue

- El código es gestionado con **Git** y alojado en **GitHub**.
- Se utiliza **Vercel** para desplegar la parte estática del frontend.
- El backend en **Ruby on Rails** puede alojarse en plataformas como **Heroku o Railway**.

## Conclusión

CulinarioSupport facilita a los restaurantes la creación de su landing page con pedidos en línea, utilizando una arquitectura **MVC con Ruby on Rails** para una estructura organizada y eficiente. El uso de tecnologías modernas permite escalabilidad y facilidad de mantenimiento.

---

### 📌 Contacto y contribución
Si deseas contribuir al proyecto, revisa el repositorio en **GitHub** y envía tus mejoras mediante **pull requests**.
