using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace ExamenCPP.Models
{
    public partial class Nomina
    {
        public int Id { get; set; }
        public int? IdEmpleado { get; set; }
        public int? IdPercepcion { get; set; }
        public double? TotalSueldo { get; set; }
        public double? TotalSr { get; set; }
        public double? TotalDescuentoTopeS { get; set; }
        public double? TotalDespensa { get; set; }
        public int? TotalRecorrido { get; set; }
        public DateTime? Fecha { get; set; }
    }
}
