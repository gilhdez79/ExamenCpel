using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ExamenCPP.Models.Request
{
    public class RqEmpleado
    {
        public string Nombre { get; set; }
        public string NumeroEmpleado { get; set; }

        public int IdRol { get; set; }
    }
}
