object knightRider {
	
	method peso()= 500
	method peligrosidad()=10
}

object bumblebee {
	var trasformado = false
	
	method peso()= 500
	method peligrosidad()= if(trasformado){30}else{15}
	method trasformar(estado){ trasformado=estado }
}

object paqueteLadrillos{
	var cantidad = 1
	
	method ponerCantidad(numero){ cantidad = numero}
	method cantidad()=cantidad
	method peso()= 2 * cantidad
	method peligrosidad()=2
}


object arena {
	var peso = 0
	
	method nuevoPeso(numero){peso = numero} 
	method peso()= peso
	method peligrosidad()= 1
}

object bateriaAntiarea {
	var misiles = true
	
	method peso()= if(misiles){300}else{200}
	method peligrosidad()= if(misiles){100}else{0}
	method tieneMisiles(estado){ misiles=estado }
}

object contenedor {
	const cosas = []
	
	method annairCosa(cosa){cosas.add(cosa)}
	method peso()= 100+cosas.sum({c=>c.peso()})
	method peligrosidad()=
		if(cosas.size()>0)
			{cosas.max({c=>c.peligrosidad()}).peligrosidad()}
		else{0}
}

object residuosRadioactivos {
	var peso = 0
	
	method nuevoPeso(numero){ peso = numero}
	method peso()= peso
	method peligrosidad()= 200
}

object embalajeSeguridad {
	var cosa 
	
	method cosaEmbalaja(objecto){cosa = objecto}
	method peso()= cosa.peso()
	method peligrosidad()= cosa.peligrosidad()/2
}
