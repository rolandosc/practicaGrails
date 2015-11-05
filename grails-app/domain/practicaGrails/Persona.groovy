package practicaGrails
/**
 * Created by DELL on 06/10/2015.
 */

class Persona {

    String nombre
    String apellidoPaterno
    String apellidoMaterno
    String fechaNacimiento
    int edad

    static constraints = {
        nombre nullable: false, blank: false
        apellidoPaterno nullable: false, blank: false
        apellidoMaterno nullable: true
        fechaNacimiento nullable: false
        edad nullable:false
    }
}
