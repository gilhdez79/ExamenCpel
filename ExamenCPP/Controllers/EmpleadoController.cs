using ExamenCPP.Models;
using ExamenCPP.BusinessLogic;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ExamenCPP.Models.Request;

namespace ExamenCPP.Controllers
{
    [Route("api/empleado")]
    public class EmpleadoController : ControllerBase
    {
        private readonly BKdbExamenContext _dbCntext;

         BsEmpleado _bsEmpleado;

   
        public EmpleadoController(BKdbExamenContext dbcontext)
        {
            _dbCntext = dbcontext;
            _bsEmpleado = new BsEmpleado(dbcontext);


        }

        [Route("")]
        [HttpGet]
        public IActionResult ObtenerListaEmpleados()
        {
            return Ok(_bsEmpleado.ObtenertListaEmpleados());
        }


        [HttpGet()]
        [Route("ObtenerEmpleado/{numeroEmpleado}")]
        public ActionResult ObtenerEmpleado(string numeroEmpleado)
        {
            return Ok(_bsEmpleado.ObtenerEmpleado(numeroEmpleado));
        }

        [HttpGet]
        [Route("ObtenerEmpleadoXId/{id}")]

        public ActionResult ObtenerEmpleadoXId(int id)
        {
            return Ok(_bsEmpleado.ObtenerEmpleadoXId(id));
        }


        [HttpPost]
        public ActionResult GrabarEmpleado([FromBody] RqEmpleado empleado)
        {
            var result = _bsEmpleado.InsertEmpleado(empleado);

            return Ok(result);
        }

        [HttpPut]
        public ActionResult Actualizar([FromBody] Empleado empleado)
        {
            var result = _bsEmpleado.InsertEmpleadoAsync(empleado);

            return Ok(result);
        }

    }
}
 