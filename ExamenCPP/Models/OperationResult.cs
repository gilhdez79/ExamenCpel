using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ExamenCPP.Models
{
    public class OperationResult<T>
    {
        public OperationResult()
        {
            _Success = false;
            InfoMensaje = new SystemMessage {Message ="Proceso Ejecutado Correctamente", TipoMensaje= TipoMensaje.Default };
        }

        private bool _Success;

        public bool Success
        {
            get { return _Success; }
            set { _Success = value; }
        }

        private SystemMessage _InfoMensaje;

        public SystemMessage InfoMensaje
        {
            get { return _InfoMensaje; }
            set { _InfoMensaje = value; }
        }

        private T objReturn;

        public T ObjReturn
        {
            get { return objReturn; }
            set { objReturn = value; }
        }

        public void SetSuccesObject(T obj)
        {
            this.objReturn = obj;
        }
    }

    public class SystemMessage{
        private string _Message;

        public string Message
        {
            get { return _Message; }
            set { _Message = value; }
        }

        private TipoMensaje tipoMensaje;

        public TipoMensaje TipoMensaje
        {
            get { return tipoMensaje; }
            set { tipoMensaje = value; }
        }


    }

    public enum TipoMensaje
    {
        Default,
        Error,
        Informacion
       
    }
}
