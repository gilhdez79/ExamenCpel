using ExamenCPP.Models;
using ExamenCPP.BusinessLogic;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ExamenCPP.Models.Request;
using Serilog;
using Microsoft.Extensions.Logging;

namespace ExamenCPP.Controllers
{
    [Route("api/empleado")]
    public class EmpleadoController : ControllerBase
    {
        private readonly BKdbExamenContext _dbCntext;
        ILogger<EmpleadoController> logger = null;
        BsEmpleado _bsEmpleado;
   
        public EmpleadoController(BKdbExamenContext dbcontext, ILogger<EmpleadoController> _logger)
        {
            logger = _logger;
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
            logger.LogError($"Returning Informacion ");
            return Ok(_bsEmpleado.ObtenerEmpleado(numeroEmpleado));
        }

        [HttpGet]
        [Route("ObtenerEmpleadoXId/{id}")]

        public ActionResult ObtenerEmpleadoXId(int id)
        {


            try
            {
                logger.LogError($"Returning informacion");
                return Ok(_bsEmpleado.ObtenerEmpleadoXId(id));
            }
            catch (Exception ex)
            {
                logger.LogError($"Returning {ex.Message.ToString()}  ");
                return BadRequest();
              
            }
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
            var result = _bsEmpleado.UpdateEmpleado(empleado);

            return Ok(result);
        }
    }
}
 