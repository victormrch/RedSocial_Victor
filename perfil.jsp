<%-- 
    Document   : perfil
    Created on : 09-mar-2019, 11:44:52
    Author     : Víctor
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>University Social Network</title>

        <!-- Bootstrap core CSS -->
        <link href="perfil/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom fonts for this template -->
        <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet">
        <link href="perfil/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="perfil/css/resume.min.css" rel="stylesheet">

    </head>

    <body id="page-top">

        <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
            <a class="navbar-brand js-scroll-trigger" href="#page-top">
                <span class="d-block d-lg-none">Clarence Taylor</span>
                <span class="d-none d-lg-block">
                    <img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="perfil/img/profile.jpg" alt="">
                </span>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="#about">Mi perfil</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="#experience">Mis amigos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="#education">Mis grupos</a>
                    </li>
                    <li class="nav-item">
                        <div class="alert alert-dark" role="alert">
                            Añadir nuevo...
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="#skills">Publicación</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="#interests">Amigo</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="#awards">Grupo</a>
                    </li>
                </ul>
            </div>
        </nav>

        <div class="container-fluid p-0">

            <section class="resume-section p-3 p-lg-5 d-flex align-items-center" id="about">
                <div class="w-100">
                    <h1 class="mb-0">${usuario.nombre}
                        <span class="text-primary">${usuario.apellidos}</span>
                    </h1>
                    <div class="subheading mb-5">
                        <a href="mailto:name@email.com">${usuario.email}</a>
                    </div>
                    <div class="social-icons">
                        <a href="#">
                            <i class="fab fa-linkedin-in"></i>
                        </a>
                        <a href="#">
                            <i class="fab fa-instagram"></i>
                        </a>
                        <a href="#">
                            <i class="fab fa-twitter"></i>
                        </a>
                        <a href="#">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                    </div>
                    <br>
                    </br>
                    
                    <div class="subheading mb-2 text-secondary">Mis últimas Publicaciones</div>
                    <tr>
                        <c:forEach items="${usuario.postList}" var="Post">
                        <form action="PerfilUsuario" method="POST">
                            <div class="container">
                                <div class="row">

                                    <div class="col-8">
                                        <p class="lead mb-5">${Post.contenido}</p>
                                    </div>
                                    <div class="col-4">
                                        <button type="submit" value="${Post.idPost}" name="borrarPost" class="btn btn-secondary btn-lg active" aria-pressed="true">Borrar Publicación</button>
                                    </div>

                                </div>
                            </div>
                        </form>
                    </c:forEach>
                    </tr>
                    
                    <div class="subheading mb-2 text-primary">Mis últimas Publicaciones en Grupos</div>
                    <tr>
                    <div class="container">
                        <div class="row">
                            <div class="col-3">
                                <div class="subheading mb-2 text-secondary">Nombre del grupo</div>
                                Bike Mountains
                            </div>
                            <div class="col-8">
                                <div class="subheading mb-2 text-secondary">Comentario</div>
                                Buenas a todos, os recuerdo que esta tarde a las 16.00 tenemos la salida al Llano de la perdiz. Se ruega puntualidad.
                            </div>
                            <div class="col-1">
                                <br>
                                </br>
                                <button type="submit" value="" name="borrarPost" class="btn btn-danger btn-lg active" aria-pressed="true">Borrar</button>
                            </div>
                        </div>
                    </    
                    </tr>
                    
                </div>
            </section>

            <hr class="m-0">

            <section class="resume-section p-3 p-lg-5 d-flex justify-content-center" id="experience">
                <div class="w-100">
                    <h2 class="mb-5">Mis amigos</h2>


                    <div class="resume-item d-flex flex-column flex-md-row justify-content-between mb-5">
                        <div class="col-sm-4">
                            <img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="perfil/img/profile3.jpg" alt="">
                            <h3 class="mb-0 text-secondary text-center">Jesús España</h3>
                            <br>
                            <button type="button" class="btn btn-primary btn-lg btn-block">Dejar de Seguir</button>

                        </div>


                        <div class="col-sm-8">
                            <div class="resume-content">
                                <div class="subheading mb-3 text-primary">Su último comentario</div>
                                <p>Chic@s ¿alguien tiene los apuntes de la asignatura Programacion Avanzada II y puede prestarmelos? Invito a unas cervezas quien me los consiga. Gracias a tod@s</p>
                            </div>
                        </div>
                    </div>

                    <div class="resume-item d-flex flex-column flex-md-row justify-content-between mb-5">
                        <div class="col-sm-4">
                            <img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="perfil/img/profile2.jpg" alt="">
                            <h3 class="mb-0 text-secondary text-center">Jorge Cruzado</h3>
                            <br>
                            <button type="button" class="btn btn-primary btn-lg btn-block">Dejar de Seguir</button>

                        </div>


                        <div class="col-sm-8">
                            <div class="resume-content">
                                <div class="subheading mb-3 text-primary">Su último comentario</div>
                                <p>OMG! Llevo varios dias con GlassFish y no consigo que funcione. Yo me rindo me paso a Payara, jajaja</p>
                                <p>En serio, lo de GlassFish no es normal, lo he instalado y reinstalado 1000 veces.</p>
                                <p>Tiene toda la pinta de que GlassFish no me va a funcionar, tras varios intento no conecta. Mañana seguiré peleandome.</p>
                            </div>
                        </div>
                    </div>


            </section>

            <hr class="m-0">

            <section class="resume-section p-3 p-lg-5 d-flex align-items-center" id="education">
                <div class="w-100">
                    <h2 class="mb-5">mis grupos</h2>
                    <c:forEach items="${usuario.gruposList}" var="grupos">  
                        <div class="resume-item d-flex flex-column flex-md-row justify-content-between mb-5">
                            <div class="col-sm-4 align-items-left">
                                <h3 class="mb-0 text-primary text-center">${grupos.nombregrupo}</h3>
                                <p></p>
                                <img class="img-fluid img-profile rounded mx-auto mb-2" src="perfil/img/biketeam.jpg" alt="">
                                <button type="button" class="btn btn-primary btn-lg btn-block">Integrantes
                                    <span class="badge badge-light">${grupos.getUsuarioList().size()}</span>
                                    <span class="sr-only">unread messages</span>
                                </button>
                            </div>
                            <div class="col-sm-8">
                                <div class="resume-content">
                                    <div class="subheading mb-3 text-dark">Últimos comentarios del grupo</div>
                                    <c:forEach items="${grupos.comentariosList}" var="comentariosgrupos"> 
                                        <h5 class="mb-0 text-secondary text-left">${comentariosgrupos.comentario}</h5>
                                    </c:forEach> 
                                </div>
                            </div>

                        </div>
                    </c:forEach>  

                    <div class="resume-item d-flex flex-column flex-md-row justify-content-between mb-5">
                        <div class="col-sm-4 align-items-left">
                            <h3 class="mb-0 text-primary text-center">Cardio Workout</h3>
                            <p></p>
                            <img class="img-fluid img-profile rounded mx-auto mb-2" src="perfil/img/cardioworkout.jpg" alt="">
                            <button type="button" class="btn btn-primary btn-lg btn-block">Integrantes
                                <span class="badge badge-light">16</span>
                                <span class="sr-only">unread messages</span>
                            </button>
                        </div>
                        <div class="col-sm-8">
                            <div class="resume-content">
                                <div class="subheading mb-3 text-dark">Últimos comentarios del grupo</div>
                                <p>Bring to the table win-win survival strategies to ensure proactive domination. At the end of the day, going forward, a new normal that has evolved from generation X is on the runway heading towards a streamlined cloud solution. User generated content in real-time will have multiple touchpoints for offshoring.</p>
                            </div>
                        </div>
                    </div>

            </section>

            <hr class="m-0">

            <section class="resume-section p-3 p-lg-5 d-flex align-items-center" id="skills">
                <div class="w-100">
                    <form action="PerfilUsuario" method="POST">
                        <h2 class="mb-5">Nueva Publicación</h2>
                        <div class="form-group text-primary">
                            <label for="exampleFormControlTextarea1">¿Sobre qué quieres hablar?</label>
                            <textarea name="contenido" class="form-control" id="exampleFormControlTextarea1" rows="4"></textarea>
                        </div>

                        <div class="input-group">
                            <select name="privacidad" class="custom-select" id="inputGroupSelect04" aria-label="Example select with button addon">
                                <option selected>Elige donde quieres publicar...</option>
                                <option value="0">A todo el mundo</option>
                                <c:forEach items="${usuario.gruposList}" var="grupos"> 
                                    <option value="${grupos.idgrupos}">${grupos.nombregrupo}</option>
                                </c:forEach>
                            </select>
                            <div class="input-group-append">
                                <button class="btn btn-outline-secondary" type="submit">Publicar</button>
                            </div>
                        </div>
                    </form>

                </div>
            </section>

            <hr class="m-0">

            <section class="resume-section p-3 p-lg-5 d-flex align-items-center" id="interests">
                <div class="w-100">
                    <h2 class="mb-5">Añadir Nuevo Amigo</h2>
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="Escribe el nombre de tu amigo" aria-label="Escribe el nombre de tu amigo" aria-describedby="button-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary" type="button" id="button-addon2">Buscar</button>
                        </div>
                    </div>
                    <br>

                    <h3 class="mb-5 text-primary">Amigos Sugeridos</h3>

                    <div class="container px-lg-5">
                        <div class="row mx-lg-n5">
                          <c:forEach items="${amigossugeridos}" var="amigo">
                            <div class="col py-3 px-lg-5 border bg-light">
                                <h3 class="mb-0 text-secondary text-center">${amigo.nombre}</h3>
                                <br>
                                <img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="perfil/img/profile4.jpg" alt="">
                                <br>
                                <button type="button align-items-center text-primary" class="justify-content-center btn btn-outline-danger">Seguir</button>
                            </div>
                           </c:forEach>                           
                        </div>
                    </div>
                </div>

            </section>

            <hr class="m-0">

            <section class="resume-section p-3 p-lg-5 d-flex align-items-center center-block" id="awards">
                <div class="w-100">
                    <h2 class="mb-5">Unirse a Grupos Existentes</h2>

                               
                        <div class="center-block container-fluid px-lg-5">

                            <div class="row mx-lg-n5 center-block">
                                <c:forEach items="${gruposExistentes}" var="grupo">  
                                <div class="col-sm-4 py-3 px-lg-5 border bg-light">
                                    <h3 class="mb-0 text-secondary text-center">${grupo.nombregrupo}</h3>
                                    <br>
                                    <img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="perfil/img/biketeam.jpg" alt="">
                                    <br>
                                    <button type="button" class="btn btn-primary btn-lg btn-block">Unirse</button>
                                </div>
                                  </c:forEach>
                            </div>
                        </div>
                    
                    <br>
                    <h2 class="mb-5">Añadir Nuevo Grupo</h2>
                    <form action="PerfilUsuario" method="POST">
                        <div class="input-group mb-3">
                            <input name="nombregrupo" type="text" class="form-control" placeholder="Escribe el nombre del grupo" aria-label="Escribe el nombre del grupo" aria-describedby="button-addon2">
                            <div class="input-group-append">

                                <div class="input-group">
                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04">
                                        <label class="custom-file-label" for="inputGroupFile04">Elegir Imagen</label>
                                    </div>
                                    <div class="input-group-append">
                                        <button class="btn btn-outline-secondary" type="submit" id="inputGroupFileAddon04">Crear Grupo</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

        </div>

    </div>
</section>

</div>

<!-- Bootstrap core JavaScript -->
<script src="perfil/vendor/jquery/jquery.min.js"></script>
<script src="perfil/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Plugin JavaScript -->
<script src="perfil/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for this template -->
<script src="perfil/js/resume.min.js"></script>

</body>

</html>
