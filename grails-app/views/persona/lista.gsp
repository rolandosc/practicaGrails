<%--
  Created by IntelliJ IDEA.
  User: ROLANDO
  Date: 11/10/2015
  Time: 21:17
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>Buscar</title>
    <meta name="layout" content="main"/>
    <title>Welcome to Grails</title>
    <style type="text/css" media="screen">
    #status {
        background-color: #eee;
        border: .2em solid #fff;
        margin: 2em 2em 1em;
        padding: 1em;
        width: 12em;
        float: left;
        -moz-box-shadow: 0px 0px 1.25em #ccc;
        -webkit-box-shadow: 0px 0px 1.25em #ccc;
        box-shadow: 0px 0px 1.25em #ccc;
        -moz-border-radius: 0.6em;
        -webkit-border-radius: 0.6em;
        border-radius: 0.6em;
    }

    .ie6 #status {
        display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
    }

    #status ul {
        font-size: 0.9em;
        list-style-type: none;
        margin-bottom: 0.6em;
        padding: 0;
    }

    #status li {
        line-height: 1.3;
    }

    #status h1 {
        text-transform: uppercase;
        font-size: 1.1em;
        margin: 0 0 0.3em;
    }

    #page-body {
        margin: 2em 1em 1.25em 18em;
    }

    h2 {
        margin-top: 1em;
        margin-bottom: 0.3em;
        font-size: 1em;
    }

    p {
        line-height: 1.5;
        margin: 0.25em 0;
    }

    #controller-list ul {
        list-style-position: inside;
    }

    #controller-list li {
        line-height: 1.3;
        list-style-position: inside;
        margin: 0.25em 0;
    }

    @media screen and (max-width: 480px) {
        #status {
            display: none;
        }

        #page-body {
            margin: 0 1em 1em;
        }

        #page-body h1 {
            margin-top: 0;
        }
    }
    </style>
</head>
<body>
<div class="body">
    <g:javascript>
        function filtrar(){
            ${remoteFunction(controller:'personas', action: "buscar", params:"fecha: + documents.getElements()",update:"contenido")
                         }
        }
    </g:javascript>


        <title>Listado</title>
        <tr>


    <table border="1">
             <g:form controller="persona" action="crearnuevo" >
                <button type="submit" >Nuevo</button>
            </g:form>

            <g:form controller="persona" action="buscar" >
                 <h5>Buscar por:

                <select name="combo" SIZE=1 onChange="buscar">
                    <option value="nombre">Nombre</option>
                    <option value="apellidoPaterno">Apellido Paterno</option>
                    <option value="apellidoMaterno">Apellido Materno</option>
                    <option value="fechaNacimiento">Fecha Nacimiento</option>

                </select>
                   <%-- <g:textField name="dato" type="text"/>--%>
                    <g:textField name="buscar" type="text"/>

                <button type="submit" onclick="buscar">Buscar</button>
                 </h5>

               <%-- <g:textField name="fechaNacimiento" type="text"/>
                <button type="submit" onclick="buscar">Buscar</button>--%>

                <div id="contenido">
                <g:render template="lista" model="[personas:listaPersonas]"/>

                </div>
            </g:form>
    </table>



       <%-- <button onclick=filtrar() id="fechaNacimiento"> Buscar</button>--%>

        </tr>
        <table border="1">
        <tr>
            <th>Nombre </th>
            <th>Apellido Paterno </th>
            <th>Apellido Materno </th>
            <th>Fecha de Nacimiento </th>
        </tr>
             <g:each var="persona" in="${personas}">
                 <tr>
                    <td>
                    ${persona.nombre}
                    </td>
                    <td>
                    ${persona.apellidoPaterno}
                    </td>
                    <td>
                    ${persona.apellidoMaterno}
                    </td>
                    <td>
                    ${persona.fechaNacimiento}
                    </td>
                </tr>
             </g:each>

        </table>
        </div>
<div id="datosPaginados">
    <g:render template="lista" model="[personas:personas]"/>
</div>
<div>
    <util:remotePaginate controller="persona" action="updateList" total="${practicaGrails.Persona.count()}" update="datosPaginados" max="2"/>
</div>

            <%---<g:link controller="Persona" action="crearnuevo">Registrar nuevo</g:link>---%>



</body>
</html>