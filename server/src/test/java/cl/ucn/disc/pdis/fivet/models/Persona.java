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

package cl.ucn.disc.pdis.fivet.models;
import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.table.DatabaseTable;

/**
 * The Persona class.
 *
 * @author Jorge Pizarro-Tapia
 */
@DatabaseTable(tableName = "persona")
public final class Persona {
    /**
     * The id: Primary Key and autoincrement.
     */
    @DatabaseField(generatedId = true)
    private Long id;

    /**
     * The Nombre.
     */
    @DatabaseField(canBeNull = false)
    private String nombre;

    /**
     * The Apellido.
     */
    @DatabaseField(canBeNull = false)
    private String apellido;

    /**
     * The Rut.
     */
    @DatabaseField(canBeNull = false, index = true)
    private String rut;

    /**
     * Empty constructor; Default visibility + empty body.
     */
    Persona(){
        //Nothing here.
    }

    /**
     * Constructor de una persona.
     *
     * @param nombre   de la persona.
     * @param apellido de la persona.
     * @param rut      debe ser valido.
     */
    public Persona(String nombre, String apellido, String rut) {

        this.nombre = nombre;
        this.apellido = apellido;
        this.rut = rut;
    }

    /**
     * @return the id.
     */
    public Long getId() {
        return id;
    }

    /**
     * @return the nombre.
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @return the apellido.
     */
    public String getApellido() {
        return apellido;
    }

    /**
     * @return the rut.
     */
    public String getRut() {
        return rut;
    }

    /**
     * @return the nombre and apellido.
     */
    public String getNombreApellido() {
        return nombre + " " + apellido;
    }

}
