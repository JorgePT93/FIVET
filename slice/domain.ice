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
     * @author Jorge Pizarro-Tapia
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
     * The Sexo
     * @author Jorge Pizarro-Tapia
     */
    enum Sexo{
        MACHO,
        HEMBRA
    }
    /**
     * The TipoPaciente
     * @author Jorge Pizarro-Tapia
     */
    enum TipoPaciente{
        INTERNO,
        EXTERNO
    }
    /**
     * Class Ficha
     * @author Jorge Pizarro-Tapia
     */
    class Ficha{

      /**
       * PK
       */
      int id;

      /**
       * Numero: 1554
       */
      int numero;

      /**
       * Nombre del Paciente: Luca
       */
      string nombre;

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
      Sexo sexo;

      /**
       * Color: Negro
       */
      string color;

      /**
       * Tipo de Paciente
       */
      TipoPaciente tipoPaciente;

    }
    /**
     * Class Foto
     * @author Jorge Pizarro-Tapia
     */
    class Foto{
      /**
       * URL/Nombre
       */
    }

    /**
     * Class Control
     * @author Jorge Pizarro-Tapia
     */
    class Control{

      /**
       * PK
       */
      int id;

      /**
       * Fecha
       */
      string fecha;

      /**
       * Proximo Control
       */
      string proximoControl;

      /**
       * Temperatura
       */
      string temperatura;

      /**
       * Peso
       */
      double peso;

      /**
       * Altura
       */
      double altura;

      /**
       * Diagnostico
       */
      string diagnostico;

      /**
       * Veterinario
       */
      string veterinario;
    }

    /**
     * Class Examen
     * @author Jorge Pizarro-Tapia
     */
    class Examen{

        /**
         * PK
         */
        int id;

        /**
         *  Nombre
         */
        string nombre;

        /**
         * Fecha
         */
        string fecha;
    }

    /**
     * The Contratos
     */
    interface Contratos{

        /**
         * Dado el ingreso de una nueva ficha, retorna dicha ficha:
         * @param ficha nueva a ingresar
         * @return the ficha
         */
        Ficha ingresarFicha(Ficha ficha);

        /**
         * Dado un numero de ficha, retorna la ficha asociada:
         * @param numero de la ficha a obtener
         * @return the Ficha
         */
        Ficha obtenerFicha(int numero);

        /**
         * Dado el ingreso de un nuevo dueno(Persona), retorna dicho dueno:
         * @param Persona nueva a ingresar
         * @return the Persona
         */
        Persona ingresarDueno(Persona dueno);

        /**
         * Dado un rut asociado, retorna el dueno(Persona) asociado:
         * @param numero de la Persona a obtener
         * @return the Persona
         */
        Persona obtenerDueno(string rut);

        /**
         * Dado el ingreso de un nuevo Control, retorna dicho Control:
         * @param Control nuevo a ingresar
         * @return the Control
         */
        Control ingresarControl(Control control);

        /**
         * Dado el ingreso de una nueva foto, retorna dicha foto:
         * @param Foto nueva a ingresar
         * @return the Foto
         */
        Foto ingresarFoto(Foto foto);


        /**
         * Dado el ingreso de un nuevo Examen, retorna dicho Examen:
         * @param Examen nuevo a ingresar
         * @return the Examen
         */
        Examen ingresarExamen(Examen examen);
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
