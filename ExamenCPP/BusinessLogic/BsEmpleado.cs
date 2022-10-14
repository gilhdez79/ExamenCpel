using ExamenCPP.Models;
using ExamenCPP.Models.Request;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ExamenCPP.BusinessLogic
{
    public class BsEmpleado
    {
        private readonly BKdbExamenContext _dbCntext;
        OperationResult<Empleado> operationResult = new OperationResult<Empleado>();


        public BsEmpleado(BKdbExamenContext dbcontext)
        {
            _dbCntext = dbcontext;
        }
        public async Task<OperationResult<Empleado>> InsertEmpleadoAsync(Empleado itemEmpleado)
        {
            try
            {



               // var result =  _dbCntext.SPInsertEmpleado.;


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

        public OperationResult<Empleado> ObtenerEmpleado(string numeroEmpleado)
        {
            try
            {
                 var itemEmpleado =    _dbCntext.Empleado.Where(e=>e.NumeroEmpleado == numeroEmpleado).FirstOrDefault();


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
        public OperationResult<Empleado> UpdateEmpleado(Empleado itemEmpleado)
        {
            try
            {
                _dbCntext.Empleado.Update(itemEmpleado);


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
