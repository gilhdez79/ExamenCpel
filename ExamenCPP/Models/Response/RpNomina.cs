using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ExamenCPP.Models.Response
{
    public class RpNomina
    {
        public string Nombre { get; set; }
        public int IdRol { get; set; }
        public string NumEmpleado { get; set; }
        public int CantidadEntrega{get; set; }
        public float Salario { get; set; }
        public int TotalDias { get; set; }
        public float TotalDespensa { get; set; }
        public float Isr { get; set; }
        public float DescuentoExedenteSalarial { get; set; }


    }
}
