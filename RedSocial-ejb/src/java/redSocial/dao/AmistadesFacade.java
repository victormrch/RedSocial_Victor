/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package redSocial.dao;

import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import redSocial.modelos.Amistades;
import redSocial.modelos.Usuario;

/**
 *
 * @author Jesus
 */
@Stateless
public class AmistadesFacade extends AbstractFacade<Amistades> {

    @PersistenceContext(unitName = "RedSocial-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AmistadesFacade() {
        super(Amistades.class);
    }
    
    public List<Amistades> findByUsuario(Usuario idUsuarioABuscar) throws Exception {
        try {
            String query = "FROM Amistades a WHERE a.idUsuario1 = :usuario";
            
            List res = em.createQuery(query)
                    .setParameter("usuario", idUsuarioABuscar)
                    .getResultList();
            
            return res;
        } catch (Exception ex) {
            throw new Exception(ex);
        }
    }
    
      public List<Usuario> GroupAmistades(Usuario user) throws Exception {

        try {
            List<Amistades> listaAmist = user.getAmistadesList();
            List<Usuario> misAmigos= new ArrayList ();
            for (Amistades amistad: listaAmist) {
                misAmigos.add(amistad.getIdUsuario2());
                
            }
            
            misAmigos.add(user);
       
            String sql  = "SELECT DISTINCT a FROM Usuario a WHERE a  NOT IN :list";
            List<Usuario> res =  em.createQuery(sql).setParameter("list", misAmigos).getResultList();
            return  res;
        } catch (Exception ex) {
            throw new Exception(ex);
        }

      

    }
}
