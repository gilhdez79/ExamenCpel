using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace ExamenCPP.Models
{
    public partial class ConfiguracionPercepciones
    {
        public int Id { get; set; }
        public double? Sueldobase { get; set; }
        public double? Pagorecorrido { get; set; }
        public int? PorcentajeIsr { get; set; }
        public double? TopeSalario { get; set; }
        public int? PorcentajeTope { get; set; }
        public int? PorcentajeValeDespensa { get; set; }
        public int? SemanaPorMes { get; set; }
        public bool? Activo { get; set; }
        public DateTime? Fecha { get; set; }
    }
}
