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

// https://doc.zeroc.com/ice/3.7/language-mappings/java-mapping/client-side-slice-to-java-mapping/customizing-the-java-mapping
["java:package:cl.ucn.disc.pdis.fivet.zeroice"]
module model {

    /**
     * Class Persona
     */
    class Persona{

       /**
        * PK
        */
       int id;

       /**
        * Rut: 81.518.400-9
        */
       string rut;

       /**
        * Nombre
        */
       string nombre;

       /**
         * Direccion
         */
       string direccion;

       /**
        * Telefono fijo: +56 55 2355000
        */
       long telefonoFijo;

       /**
        * Telefono movil: +569 8123 4567
        */
       long telefonoMofil;

       /**
        * Correo Electronico
        */
       string email;
    }

    /**
     * Class Ficha
     */
    class ficha{

      /**
       * PK
       */
      int id;

      /**
       * Numero: 1554
       */
      int numeroFicha;

      /**
       * Nombre del Paciente: Luca
       */
      string nombrePaciente;

      /**
       * Especie: Canino
       */
      string especie;

      /**
       * Fecha de Nacimiento (Edad)
       * Format: ISO_ZONED_DATE_TIME
       */
      string fechaDeNacimiento;

      /**
       * Raza: Labrador
       */
      string raza;

      /**
       * Sexo: Macho/Hembra
       */
      string sexo;

      /**
       * Color: Negro
       */
      string color;

      /**
       * Tipo
       */
      string tipo;

    }

    /**
     * Class Foto
     */
    class foto{
      /**
       * URL/Nombre
       */
    }

    /**
     * The base system.
     */
     interface TheSystem {

        /**
         * @return the diference in time between client and server.
         */
        long getDelay(long clientTime);

     }

}
