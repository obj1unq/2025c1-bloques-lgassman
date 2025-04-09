

# Ejemplo de bloques (también conocidos como Closures  o  Lambdas)

## Intro

Un bloque es un objeto que modela un comportamiento o "cacho de código" para les amigues.

Se construye (en principio entre llaves)

```
var miBloque =  { 
    pepita.comer(alpiste)
    pepita.volar(10) 
}

```
Notar que en este punto no se ha enviado ningún mensaje a pepita, simplemente hay un objeto que modela la idea de enviar el mensjae volar(10)  a pepita.

Como es un objeto que modela un comportamiento, una cosa muy útil es pedirle que se ejecute. Eso se hace usando el mensaje apply:

```
miBloque.apply()
```

Ahorá sí se ejecutó el bloque. Permite separar los lugares donde se define un comportamiento y el lugar dónde se ejecuta.
Esto puede tener muchas utilidades, que veremos más adelante

## Orden o Consulta?

Los bloques permiten modelar tanto envíos de mensajes de órdenes, como de consultas. 
En el primer caso, se utilizó como órden, ya que se utilizó para enviar una o más órdenes, por lo tanto no hay valor de retorno

Pero también se puede construir devolviendo algo. Si la última sentencia de un bloque es una consulta, entonces el bloque tiene eso mismo como valor de retorno.

```
    var miBloque = { pepita.energia() }
    var energiaDePepita = miBloque.apply()
```    
En este caso decidimos guardar el resultado en una variable, pero bien podría haberse enviado como parámetro de otro mensaje

## Se puede parametrizar?

Sí! se puede parametrizar utilizando `=>` para separar los parámetros, por ejemplo

```
    var bloqueComerAlpiste = {ave => ave.comer(alpiste)}
    var bloqueComerAlgo = {ave, comida => ave.comer(alpiste, comida)}
```

Ahora bien, así como el que envía el mensaje apply conoce de antemano si se trata de una orden o una consulta, para saber si tiene
que trabajar con el resultado o no, también debe conocer de antemano con cuantos parámetros trabaja el bloque, para utilizar el apply
con la cantidad de parámetros que corresponde:

```
    bloqueComerAlpiste.apply(pepita)
    bloqueComerAlgo.apply(pepita, alpiste)
```

## Para qué sirve?

La separación de la definición de un comportamiento del momento en que se debe ejecutar es especialmente útil cuando trabajamos
en la modulación de nuestro sistema. La separación de módulos es una manera de agrupar distintas partes del sistema. Generalmente
un módulo ofrece algún servicio a otro módulo, evitando que se conozcan detalles de implementación. 

En el caso de wollok, un ejemplo de esto es el módulo de testing. Las clase assert puede ser visto como parte de un módulo de testing
que ofrece el servicio de testear un comportamiento, para el uso de casos normales no se nesecita un bloque, pero que hay si queremos testear que un objeto lanza excepción?

Si ejecuto el código que lanza error en el mismo test, se corta el flujo de ejecución. Lo que necesitamos es que el módulo de testing
nos ofrezca una manera de ejecutar nuestra prueba en un entorno controlado, de tal manera que pueda ejecutarlo y manejar la excepción.

por eso nuestro test debería hacer algo así:

```
    assert.throwsException({pepita.volar(1000)})
```
Para que el apply lo ejecute en un entorno controlado y pueda decidir si está bien o mal. 
Pero es magia lo que hace el objeto assert? Claro que no!
Acá una implementación posible de como se puede dar cuenta si algo está bien o no

```
object miAsserter {

    method assertException(bloque) {

      try {
        bloque.apply() //ejecuto el bloque
        return false //no anda como espero
      }
      catch e: Exception {
        return true //anda como espero
      } 
      
    }

}
```

### Tarea

Hacer que a roque se le pueda configurar una rutina de entrenamiento.
Esa rutina debe ser un bloque

Cuando a roque se le diga entrenar, debe ejecutar esa rutina sobre pepita.

Hacer un test que configura una rutina que haga que 
1 - pepita coma alpiste
2 - pepita vuele 5
La energia de pepita luego de que roque la hace entrenar deberia ser 105

Hacer otro test que configura una rutina que haga:
1 - pepita vuela 5
2 - pepita come alpiste
3 - pepita vuela 5
La energia de pepita debe ser 90

Hacer otro test que configura una rutina que haga:
1 - pepita come alpiste
2 - pepita volar 1000
3 - pepita come alpiste

Esta rutina no puede aplicarse correctamente ya que al volar 1000 lanzara un error.
La energia de pepita quedaría en 120 ya que el primer alpiste si funcionó.

Para pensar: está bien que quede en 120? que podría hacer distinto el entrenador ante un error?
La respuesta de esto es tema de objetos 2.













