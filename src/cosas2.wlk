object knightRider {
	
	method peso()= 500
	method peligrosidad()=10
	method bultos()= 1
	method consecuencia(){}
}

object bumblebee {
	var trasformado = false
	
	method peso()= 500
	method peligrosidad()= if(trasformado){30}else{15}
	method trasformar(estado){ trasformado=estado }
	method bultos()= 2
	method consecuencia(){self.trasformar(true)}
}

object paqueteLadrillos{
	var cantidad = 1
	
	method ponerCantidad(numero){ cantidad = numero}
	method cantidad()=cantidad
	method peso()= 2 * cantidad
	method peligrosidad()=2
	method bultos()=
		if(cantidad<=100){1}
		else if(cantidad>=101 and cantidad<=300){2}
		else{3}
	method consecuencia(){self.ponerCantidad(self.cantidad()+12)}
}


object arena {
	var peso = 0
	
	method nuevoPeso(numero){peso = numero} 
	method peso()= peso
	method peligrosidad()= 1
	method bultos()=1
	method consecuencia(){self.nuevoPeso(self.peso()+20)}
}

object bateriaAntiarea {
	var misiles = true
	
	method peso()= if(misiles){300}else{200}
	method peligrosidad()= if(misiles){100}else{0}
	method tieneMisiles(estado){ misiles=estado }
	method bultos()= if(misiles){2}else{1}
	method consecuencia(){self.tieneMisiles(true)}
}

object contenedor {
	const cosas = []
	
	method annairCosa(cosa){cosas.add(cosa)}
	method peso()= 100+cosas.sum({c=>c.peso()})
	method peligrosidad()=
		if(cosas.size()>0)
			{cosas.max({c=>c.peligrosidad()}).peligrosidad()}
		else{0}
	method bultos()=1+cosas.sum({c=>c.bultos()})
	method consecuencia(){cosas.forEach({c=>c.consecuencia()})}
}

object residuosRadioactivos {
	var peso = 0
	
	method nuevoPeso(numero){ peso = numero}
	method peso()= peso
	method peligrosidad()= 200
	method bultos()=1
	method consecuencia(){self.nuevoPeso(self.peso()+15)}
}

object embalajeSeguridad {
	var cosa 
	
	method cosaEmbalaja(objecto){cosa = objecto}
	method peso()= cosa.peso()
	method peligrosidad()= cosa.peligrosidad()/2
	method bultos()=2
	method consecuencia(){}
}
