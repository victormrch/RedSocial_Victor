/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package redSocial.dao;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import redSocial.modelos.ComentariosGrupos;

/**
 *
 * @author Victor
 */
@Stateless
public class ComentariosGruposFacade extends AbstractFacade<ComentariosGrupos> {

    @PersistenceContext(unitName = "RedSocial-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ComentariosGruposFacade() {
        super(ComentariosGrupos.class);
    }
    
}
