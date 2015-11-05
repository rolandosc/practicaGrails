import practicaGrails.Persona
import grails.plugin.cache.Timer
import java.util.HashMap
import practicaGrails.PersonaService

/**
 * Created by DELL on 06/10/2015.
 */
class PersonaController {
    def personaService

   //List<Persona> personas = personaService.listarPersonas(params)//new ArrayList<Persona>()

    static scope="session"
    static defaultAction = "verlista"
    def index() {
       //List<Persona> personas = personaService.listarPersonas(params)
       // render(view: '/persona/FORM', model: [personas: personas])
        render view:"/RegistrarPersona/lista"

             }
        def verlista(){

        List<Persona> personas = personaService.listarPersonas(params)
         render view:'/persona/lista', model:[personas: personas]

        }
        def crearnuevo() {
            render view: "/RegistrarPersona/registrar"

        }
    def buscar(){
//view:"/RegistrarPersona/registrar"

        def com=params.combo
       // def b=Persona.findByFechaNacimiento(fecha)
        def buscar=params.buscar
        def p
         if(com=="nombre")
             p=Persona.findAllByNombre(buscar)
        if(com=="apellidoPaterno")
            p=Persona.findAllByApellidoPaterno(buscar)
        if(com=="apellidoMaterno")
            p=Persona.findAllByApellidoMaterno(buscar)
        if(com=="fechaNacimiento")
            p=Persona.findAllByFechaNacimiento(buscar)

        render view: "/persona/lista", model:[personas: p]

    }
        def registrar() {
            try {
                personaService.guardarPersona(params)
                List<Persona> personas = personaService.listarPersonas(params)
                render view:"/RegistrarPersona/registrar"
                println params
                params.max = Math.min(params.max ? params.int('max'): 2,100)
                if(!params.offset)
                    params.offset = 0

                def mapa = personaService.listarPersonas(params)
                if(params.offset)
                    render (view: "lista",model:[personas:Persona.list(params)])
                else
                    render (view: "lista",model:[personas:Persona.list(params)])
                /*Persona persona = new Persona()

                persona.properties = params

                try {
                    personas.add(persona)
                }

                catch(Exception e){

                    log.debug("Exception Occured ::", e)

                }*/
               // render view:'/persona/lista', model:[personas: personas]
            }
            catch (e)
            {
                render view:"/RegistrarPersona/registrar"
            }
        }
    def updateList = {
        println params
        params.max = Math.min(params.max ? params.int('max'): 1,100)
        if(!params.offset)
            params.offset = 0

        def mapa = personaService.listarPersonas(params)
        if(params.offset)
            render (view: "lista",model:[personas:Persona.list(params)])
        else
            render (view: "lista",model:[personas:Persona.list(params)])
    }


}
