package practicaGrails
/**
 * Created by DELL on 06/10/2015.
 */

import grails.transaction.Transactional
import org.apache.commons.validator.Form
import practicaGrails.Persona

@Transactional
class PersonaService {
    def utilService

    Persona guardarPersona(params){

        Persona persona = new Persona(params)
        persona.save(flush: true, failOnError: true)
        persona

    }


    Persona consultarPersona(Long id){
        Persona persona = Persona.get(id)
        persona.edad = UtilService.calcularEdad(persona.fechaNacimiento)
        persona
    }
    List<Persona> listarPersonas(params)
    {
    /* params.nombre ="rolando"
        params.apellidoPaterno ="salvador"
        params.apellidoMaterno ="coello"
        params.fechaNacimiento = new Date()
        params.edad =23*/
      //  guardarPersona(params)
        List<Persona> listarPersonas = Persona.list()
        //listarPersonas
    }


}
