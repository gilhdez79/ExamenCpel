using ExamenCPP.BusinessLogic;
using ExamenCPP.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ExamenCPP.Controllers
{
    [Route("api/nomina")]
    public class NominaController : Controller
    {
        private readonly BKdbExamenContext _dbCntext;
        BsNomina _bsNomina;
        public NominaController(BKdbExamenContext dbcontext)
        {
            _dbCntext = dbcontext;
            _bsNomina = new BsNomina(dbcontext);
        }

        [Route("{numeroMes}")]
        [HttpGet]
        public IActionResult ObtenerNomina(int numeroMes)
        {
            return Ok(_bsNomina.ObtenerNomniaAsync(numeroMes));
        }
    }
}
