object tito {
    var cantidad = 0
    var bebida = cianuro
    method peso() = 70
    method inerciaBase() = 490
    method consumir(unaCantidad,unaBebida) {
        bebida = unaBebida
        cantidad = unaCantidad
    }
    method bebida() = bebida

    method velocidad() {
        return bebida.rendimiento(cantidad)
        * self.inerciaBase() / self.peso()
    }
}

object wisky {
    method rendimiento(cantidad) = 0.9 ** cantidad
}

object cianuro {
    method rendimiento(cantidad) = 0
}

object terere {
    method rendimiento(cantidad) {
        return 1.max(cantidad * 0.1)
        //tambien (cantidad * 0.1).max(1)
    }
}

object licuadoDeFrutas {
    const nutrientes = []

    method agregarNutrientes(unNutriente) {
        nutrientes.add(unNutriente)
    }

    method rendimiento(cantidad) {
        return nutrientes.sum() * 1.max(cantidad.div(1000))
    }
}

object saborizada {
    var property bebida = wisky
    method rendimiento(cantidad){
        return 1 + self.rendimiento(cantidad/4)
    }
}

object coctel {
    const bebidas = #{wisky, terere, cianuro}

    method agregarBebida(unaBebida) {
        bebidas.add(unaBebida)
    } 

    method rendimiento(cantidad) {
        var total = 1
        bebidas.forEach({unaBebida => total = bebidas.rendimiento(cantidad / bebidas.size()) * total})
        return total
    }
}