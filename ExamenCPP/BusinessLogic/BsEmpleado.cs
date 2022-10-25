using ExamenCPP.Models;
using ExamenCPP.Models.Request;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;

namespace ExamenCPP.BusinessLogic
{
    /// <summary>
    /// Clase de Negocio para tratamiento de la entidad Empleado
    /// </summary>
    public class BsEmpleado
    {
        private readonly BKdbExamenContext _dbCntext;
        OperationResult<Empleado> operationResult = new OperationResult<Empleado>();

        private readonly ILogger<BsEmpleado> _logger;

        public BsEmpleado(BKdbExamenContext dbcontext)
        {
            _dbCntext = dbcontext;
        }
        public OperationResult<Empleado> InsertEmpleado(RqEmpleado itemEmpleado)
        {
            try
            {

                var prmNombre = new SqlParameter("@Nombre", itemEmpleado.Nombre);
                var prmNumEmpleado = new SqlParameter("@NumeroEmpleado", itemEmpleado.NumeroEmpleado);
                var prmRolId = new SqlParameter("@RolId", itemEmpleado.IdRol);

                var userType = _dbCntext.Database.ExecuteSqlRaw($"exec dbo.[sp_GrabarEmpleado] @Nombre,@NumeroEmpleado,@RolId", prmNombre,prmNumEmpleado,prmRolId);

                operationResult.Success = true;
                operationResult.InfoMensaje = new SystemMessage { Message = "Se Guardaron los datos Correctamente", TipoMensaje = TipoMensaje.Default };
               //operationResult.SetSuccesObject(userType);
                
            }
            catch (Exception ex)
            {
                operationResult.Success = false;
                operationResult.InfoMensaje = new SystemMessage { Message = "Error al Guardar la Informacion", TipoMensaje = TipoMensaje.Error };

            }

            return operationResult;
        }
        public OperationResult<Empleado> ObtenerEmpleado(string numeroEmpleado)
        {
            try
            {
                string mensaje = "Operacion Exitosa";
                var itemEmpleado =    _dbCntext.Empleado.Where(e=>e.NumeroEmpleado == numeroEmpleado).FirstOrDefault();

                mensaje = itemEmpleado!=null?mensaje: "No se encontraron datos";
                operationResult.Success = true;
                operationResult.InfoMensaje = new SystemMessage { Message = mensaje, TipoMensaje = TipoMensaje.Default };
                operationResult.SetSuccesObject(itemEmpleado);

            }
            catch (Exception ex)
            {
                operationResult.Success = false;
                operationResult.InfoMensaje = new SystemMessage { Message = "Error al Obtener los datos", TipoMensaje = TipoMensaje.Error };

            }

            return operationResult;
        }
        public OperationResult<Empleado> ObtenerEmpleadoXId(int id)
        {
            try
            {
                var itemEmpleado = _dbCntext.Empleado.Where(e => e.Id == id).FirstOrDefault();


                operationResult.Success = true;
                operationResult.InfoMensaje = new SystemMessage { Message = "OperacionExitosa", TipoMensaje = TipoMensaje.Default };
                operationResult.SetSuccesObject(itemEmpleado);

            }
            catch (Exception ex)
            {
                operationResult.Success = false;
                operationResult.InfoMensaje = new SystemMessage { Message = "Error al Obtener los datos", TipoMensaje = TipoMensaje.Error };

            }

            return operationResult;
        }
        public  OperationResult<Empleado> UpdateEmpleado(Empleado itemEmpleado)
        {
            try
            {
                _dbCntext.Empleado.Update(itemEmpleado);
                 _dbCntext.SaveChanges();

                operationResult.Success = true;
                operationResult.InfoMensaje = new SystemMessage { Message = "Se Guardaron los datos Correctamente", TipoMensaje = TipoMensaje.Default };
                operationResult.SetSuccesObject(itemEmpleado);

            }
            catch (Exception ex)
            {
                operationResult.Success = false;
                operationResult.InfoMensaje = new SystemMessage { Message = "Error al Obtener los datos", TipoMensaje = TipoMensaje.Error };

            }

            return operationResult;
        }
        public OperationResult<IEnumerable<Empleado>> ObtenertListaEmpleados()
        {
            OperationResult<IEnumerable<Empleado>> operationResultList = new OperationResult<IEnumerable<Empleado>>();

            try
            {
                 
                    IEnumerable<Empleado> emp = (IEnumerable<Empleado>)_dbCntext.Empleado.ToList();

                    if (emp != null)
                    {
                    operationResultList.Success = true;
                    operationResultList.InfoMensaje = new SystemMessage { Message = "Se obtubieron los datos Correctamente", TipoMensaje = TipoMensaje.Default };
                    operationResultList.SetSuccesObject(emp);
                    }
                 
            }
            catch (Exception ex)
            {
                operationResultList.Success = false;
                operationResultList.InfoMensaje = new SystemMessage { Message = "Error al Obtener los datos", TipoMensaje = TipoMensaje.Error };

            }

            return operationResultList;
        }
    }
}
