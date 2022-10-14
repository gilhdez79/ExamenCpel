using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace ExamenCPP.Models
{
    public partial class EmpleadoRol
    {
        public int IdEmpleado { get; set; }
        public bool? Activo { get; set; }
        public int IdRol { get; set; }

        public virtual Empleado IdEmpleadoNavigation { get; set; }
        public virtual TbRolTrabajador IdRolNavigation { get; set; }
    }
}
