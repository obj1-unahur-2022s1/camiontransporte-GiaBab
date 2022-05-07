object knightRider {
	
	method peso()= 500
	method peligrosidad()=10
}

object bumblebee {
	var trasformado = false
	
	method peso()= 500
	method peligrosidad()= if(trasformado){30}else{15}
	method trasformar(estado){ trasformado=estado }
	method bultos()= 2
}

object paqueteLadrillos{
	var cantidad = 1
	
	method cantidad(numero){ cantidad = numero}
	method peso()= 2 * cantidad
	method peligrosidad()=2
	method bultos()=
		if(cantidad<=100){1}
		else if(cantidad>=101 and cantidad<=300){2}
		else{3}
}


object arena {
	var peso = 0
	
	method nuevoPeso(numero){peso = numero} 
	method peso()= peso
	method peligrosidad()= 1
	method bultos()=1
}

object bateriaAntiarea {
	var misiles = true
	
	method peso()= if(misiles){300}else{200}
	method peligrosidad()= if(misiles){100}else{0}
	method tieneMisiles(estado){ misiles=estado }
	method bultos()= if(misiles){2}else{1}
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
}

object residuosRadioactivos {
	var peso = 0
	
	method nuevoPeso(numero){ peso = numero}
	method peso()= peso
	method peligrosidad()= 0
	method bultos()=1
}

object embalajeSeguridad {
	var cosa 
	
	method cosaEmbalaja(objecto){cosa = objecto}
	method peso()= cosa.peso()
	method peligrosidad()= cosa.peligrosidad()/2
	method bultos()=2
}
