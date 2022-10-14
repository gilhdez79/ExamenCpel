using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace ExamenCPP.Models
{
    public partial class EmpleadoPercepcion
    {
        public int IdEmpleado { get; set; }
        public int? IdPercepcion { get; set; }

        public virtual Empleado IdEmpleadoNavigation { get; set; }
        public virtual ConfiguracionPercepciones IdPercepcionNavigation { get; set; }
    }
}
