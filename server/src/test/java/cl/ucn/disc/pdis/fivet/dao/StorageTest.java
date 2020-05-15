/*
 * MIT License
 *
 * Copyright (c) 2020 Diego Urrutia-Astorga <durrutia@ucn.cl>.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

package cl.ucn.disc.pdis.fivet.dao;
import cl.ucn.disc.pdis.fivet.models.Persona;
import com.j256.ormlite.dao.Dao;
import com.j256.ormlite.dao.DaoManager;
import com.j256.ormlite.jdbc.JdbcConnectionSource;
import com.j256.ormlite.support.ConnectionSource;
import com.j256.ormlite.table.TableUtils;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 * Model Test.
 *
 * @author Jorge Pizarro-Tapia
 */
public class StorageTest {

    /**
     * The Logger.
     */
    private static final Logger log = LoggerFactory.getLogger(StorageTest.class);

    /**
     * Testing the ORMLite + H2 (database)
     */
    @Test
    public void testDatabase(){

        // The database to use (in RAM memory)
        String dataBaseURL = "jdbc:h2:mem:fivet_db";

        // Connection source: autoclose with the try/catch
        try (ConnectionSource connectionSource = new JdbcConnectionSource(dataBaseURL)) {

            //Create the table from Persona Class Annotations
            TableUtils.createTableIfNotExists(connectionSource, Persona.class);

            //The Dao of Persona
            Dao<Persona, Long> daoPersona = DaoManager.createDao(connectionSource,Persona.class);

            //New Persona
            Persona persona = new Persona("Juan","Perez","123456781");

            //Insert Persona into the database
            int tuples = daoPersona.create(persona);
            log.debug("ID: {}",persona.getId());
            //
            Assertions.assertEquals(1,tuples,"Save tuples != 1");

            //Get from db
            Persona personaDb = daoPersona.queryForId(persona.getId());

            Assertions.assertEquals(persona.getNombre(),personaDb.getNombre(),"Nombre not equals!");
            Assertions.assertEquals(persona.getApellido(),personaDb.getApellido(),"Apellido not equals!");
            Assertions.assertEquals(persona.getRut(),personaDb.getRut(),"Rut not equals!");

            //Search by rut: Select * FROM  'persona' WHERE 'rut' = '123456781'
            List<Persona> personaList = daoPersona.queryForEq("rut","123456781");
            Assertions.assertEquals(persona.getRut(),personaDb.getRut(),"Ruts are equals?");

            //Not found rut
            Assertions.assertEquals(0,daoPersona.queryForEq("rut","19").size(),"Found somethings?");

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
