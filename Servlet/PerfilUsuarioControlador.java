/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import redSocial.dao.AmistadesFacade;
import redSocial.dao.ComentariosGruposFacade;
import redSocial.dao.GruposFacade;
import redSocial.dao.PostFacade;
import redSocial.dao.UsuarioFacade;
import redSocial.modelos.Amistades;
import redSocial.modelos.ComentariosGrupos;
import redSocial.modelos.Grupos;
import redSocial.modelos.Post;
import redSocial.modelos.Privacidad;
import redSocial.modelos.Usuario;
import redSocial.svc.AmistadesSvc;

/**
 *
 * @author Jesus
 */
@WebServlet(name = "PerfilUsuario", urlPatterns = {"/PerfilUsuario"})
public class PerfilUsuarioControlador extends HttpServlet {

    @EJB
    public AmistadesSvc svc;

    @EJB
    public PostFacade postDao;

    @EJB
    public GruposFacade gruposDao;

    @EJB
    public ComentariosGruposFacade ComentariosGruposDao;
    
    @EJB
    public UsuarioFacade AmistadesDao;
    
    

    private final static String SUCCESS = "/perfil/perfil.jsp";

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Usuario user = (Usuario) request.getSession().getAttribute("usuario");
            
            // Crear Nuevo Grupo
            if (request.getParameter("nombregrupo") != null) {
                String nombregrupo = request.getParameter("nombregrupo");
                Grupos nuevoGrupo = PerfilUsuarioControlador
                        .CrearGrupo(user, nombregrupo);

                gruposDao.create(nuevoGrupo);

                PerfilUsuarioControlador.ActualizarGrupos(nuevoGrupo, user);

            //Crear COMENTARIO en Grupo
            } else if (request.getParameter("privacidad") != null) {
                String cadenaPrivacidad = request.getParameter("privacidad");
                int privacidad = Integer.parseInt(cadenaPrivacidad);
                if (privacidad != 0) {
                    Grupos gruposSeleccionado = PerfilUsuarioControlador.
                            BuscarGrupos(user, privacidad);

                    String contenido = request.getParameter("contenido");
                    ComentariosGrupos nuevoComentario = PerfilUsuarioControlador.
                            ConstruirComentario(user, contenido, gruposSeleccionado);

                    ComentariosGruposDao.create(nuevoComentario);

                    PerfilUsuarioControlador.ActualizarComentarioList(gruposSeleccionado, nuevoComentario);

                } else {

                    // Crear POST    
                    String contenido = request.getParameter("contenido");
                    Post nuevoPost = PerfilUsuarioControlador
                            .ConstruirPost(user, contenido);

                    postDao.create(nuevoPost);

                    PerfilUsuarioControlador.ActualizarPostList(user, nuevoPost, 1);
                } 
                
            }else if (request.getParameter("borrarPost") != null ){
                int idPost = Integer.parseInt(request.getParameter("borrarPost"));
                
                //Busco el post a borrar
                Post postBorrar = PerfilUsuarioControlador.BuscarPost(user, idPost);
                
                //Borro el post encontrado
                
                postDao.remove(postBorrar);
                
                //Actualizar lista de post del usuario
                
                PerfilUsuarioControlador.ActualizarPostList(user, postBorrar, 2);
                        
                
                
            }
            
            //Buscar Post Amigos

            List<Post> res = svc.buscarPostDeAmigos(user);
            request.setAttribute("PostAmigos", res);
            
            
            //Mostrar Grupos Sugeridos, donde el usuario no está registrado
            
            List<Grupos> grupo = gruposDao.GroupList(user);
            request.setAttribute("gruposExistentes", grupo);
            
            //Mostrar Amigos Sugeridos
            
            List<Usuario> amistades = AmistadesDao.GroupAmistades(user);
                    request.setAttribute("amigossugeridos", amistades);

            request.getRequestDispatcher(SUCCESS).forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private static Post ConstruirPost(Usuario usuario, String contenido) {

        Post post = new Post();
        post.setContenido(contenido);
        Privacidad privacidad = new Privacidad(1);
        privacidad.setTipo("publico");
        post.setPrivacidad(privacidad);
        post.setIdUsuario(usuario);
        post.setFecha(new Date());
        return post;

    }

    private static ComentariosGrupos ConstruirComentario(Usuario usuario, String comentario, Grupos grupoSeleccionado) {

        ComentariosGrupos comentarioGrupo = new ComentariosGrupos();
        comentarioGrupo.setComentario(comentario);
        comentarioGrupo.setFecha(new Date());
        comentarioGrupo.setIdGrupal(grupoSeleccionado);
        comentarioGrupo.setIdPublicador(usuario);

        return comentarioGrupo;
    }

    private static void ActualizarComentarioList(Grupos grupos, ComentariosGrupos comentariosGrupos) {
        List<ComentariosGrupos> antiguosComentarios
                = grupos.getComentariosList();
        antiguosComentarios.add(comentariosGrupos);
        grupos.setComentariosList(antiguosComentarios);

    }

    private static void ActualizarPostList(Usuario usuario, Post post, int toDo) {

        List<Post> antiguosPost = usuario.getPostList();
        if (toDo == 1) {
            antiguosPost.add(post);
        } else if (toDo == 2) {
            antiguosPost.remove(post);
        }

        usuario.setPostList(antiguosPost);
    }

    private static Grupos CrearGrupo(Usuario idUsuario, String nombregrupo) {

        Grupos grupos = new Grupos();
        grupos.setNombregrupo(nombregrupo);
        grupos.setIdUsuario(idUsuario);
        List<Usuario> integrantes = new ArrayList();
        integrantes.add(idUsuario);
        grupos.setUsuarioList(integrantes);

        return grupos;
    }

    private static void ActualizarGrupos(Grupos grupo, Usuario usuario) {
        List<Grupos> antiguosGrupos = usuario.getGruposList();
        antiguosGrupos.add(grupo);
        usuario.setGruposList(antiguosGrupos);
    }

    private static Grupos BuscarGrupos(Usuario usuario, Integer grupoId) {
        Iterator grupos = usuario.getGruposList().iterator();
        boolean encontrado = false;
        Grupos resultado = null;
        Grupos iteratorGrupos;
        while (grupos.hasNext() && !encontrado) {
            iteratorGrupos = (Grupos) grupos.next();
            if (iteratorGrupos.getIdgrupos() == grupoId) {
                resultado = iteratorGrupos;
                encontrado = true;
            }
        }
        return resultado;
    }

    private static Post BuscarPost(Usuario usuario, Integer idPost) {
        Iterator post = usuario.getPostList().iterator();
        boolean postEncontrado = false;
        Post resultadoPost = null;
        Post iteratorPost;
        while (post.hasNext() && !postEncontrado) {
            iteratorPost = (Post) post.next();
            if (iteratorPost.getIdPost() == idPost) {
                resultadoPost = iteratorPost;
                postEncontrado = true;
            }
        }
        return resultadoPost;
    }
}
