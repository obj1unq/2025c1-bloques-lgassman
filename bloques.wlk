object pepita {
  var energia = 100

  method energia() = energia

  method volar(distancia) {
    self.validarVolar(distancia)
    energia = energia - self.energiaParaVolar(distancia)
  }

  method validarVolar(distancia) {
    if (energia < self.energiaParaVolar(distancia)) {
      self.error("No puedo volar esta distancia")
    }
  }

  method energiaParaVolar(distancia) {
    return 10 + distancia
  }

  method comer(alimento) {
    energia = energia + alimento.energiaQueAporta()
  }

}

object pepon {
  var energia = 30

  method energia() = energia

  method volar(distancia) {
    self.validarVolar(distancia)
    energia = energia - self.energiaParaVolar(distancia)
  }

  method validarVolar(distancia) {
    if (energia < self.energiaParaVolar(distancia)) {
      self.error("No puedo volar esta distancia")
    }
  }

  method energiaParaVolar(distancia) {
    return 20 + distancia * 2
  }

  method comer(alimento) {
    energia = energia + alimento.energiaQueAporta() / 2
  }

}


object alpiste {
  method energiaQueAporta() = 20
}

object roque {

  var rutina = {}
  var ave = pepita

  method rutina(_rutina) {
    rutina = _rutina
  }

  method ave(_ave) {
    ave = _ave
  }

  method entrenar() {
    rutina.apply(ave)
  }


}

object miAsserter {

    //Esto devuelve true si el bloque lanzó una exception
    //Devuelve false si no lanzó una expcion
    method assertException(unBloque) {
      
      try {
        unBloque.apply()
        return false // Esto se ejecuta solamente si no hay un error
      }
      catch e: Exception {
        return true //Esto se va a ejecutar si hay un error 
      }

    }

}
