using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace ExamenCPP.Models
{
    public partial class Empleado
    {
        public Empleado()
        {
            TbMovimientosEmpleados = new HashSet<TbMovimientosEmpleados>();
        }

        public int Id { get; set; }
        public string Nombre { get; set; }
        public string NumeroEmpleado { get; set; }

        public virtual ICollection<TbMovimientosEmpleados> TbMovimientosEmpleados { get; set; }
    }
}
