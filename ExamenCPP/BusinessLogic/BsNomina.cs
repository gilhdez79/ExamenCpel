using ExamenCPP.Models;
using ExamenCPP.Models.Request;
using ExamenCPP.Models.Response;
using ExamenCPP.utils;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Threading.Tasks;

namespace ExamenCPP.BusinessLogic
{
    public class BsNomina :CommonFn
    {
        private readonly BKdbExamenContext _dbCntext;
        OperationResult<RpNomina> operationResult = new OperationResult<RpNomina>();
        public BsNomina(BKdbExamenContext dbcontext)
        {
            _dbCntext = dbcontext;
        }

        public  OperationResult<IEnumerable<RpNomina>> ObtenerNomniaAsync(int numeromes)
        {
            OperationResult<IEnumerable<RpNomina>> operationResult = new OperationResult<IEnumerable<RpNomina>>();

            try
            {
                /*
                var prmNumeroMes = new SqlParameter("@NumeroMes", numeromes);

                var userType = _dbCntext.Database.ExecuteSqlCommand($"exec dbo.[sp_GenerarNomina] @NumeroMes", prmNumeroMes);

                operationResult.Success = true;
                operationResult.InfoMensaje = new SystemMessage { Message = "Se  Obtuvieron Correctamente", TipoMensaje = TipoMensaje.Default };
              //  operationResult.SetSuccesObject(userType as RpNomina);
              */

                using (DbConnection conn = _dbCntext.Database.GetDbConnection())
                {
                    if (conn.State != System.Data.ConnectionState.Open)
                        conn.Open();
                    var cmd = conn.CreateCommand();

                    var prmNumeroMes = new SqlParameter("@NumeroMes", numeromes);
                    cmd.CommandText = $"exec dbo.[sp_GenerarNomina] {numeromes}";
                    var Result = cmd.ExecuteReader();

                   var resultado= base.ToList<RpNomina>(Result);

                    operationResult.Success = true;
                    operationResult.InfoMensaje = new SystemMessage { Message = "Se  Obtuvieron Correctamente", TipoMensaje = TipoMensaje.Default };
                    operationResult.SetSuccesObject(resultado);
                }
            }
            catch (Exception ex)
            {
                operationResult.Success = false;
                operationResult.InfoMensaje = new SystemMessage { Message = "Error Obtener la Informacion", TipoMensaje = TipoMensaje.Error };

            }

                return operationResult;
            }
    }
}
