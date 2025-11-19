
package com.pe.mispatitas.historial.dao;

import entidad.Mascota;
import java.util.List;

/**
 *
 * @author Anai Huarancca
 */
public interface DaoMascota {
     List<Mascota> mascotaSel();

    Mascota mascotaGet(Integer id);

    String mascotaIns(Mascota mascota);

    String mascotaUpd(Mascota mascota);

    String mascotaDel(Integer id);

    String getMensaje();
    
}
