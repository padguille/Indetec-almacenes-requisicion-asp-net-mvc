//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace RequisicionesAlmacenBL.Entities
{
    using System;
    using System.Collections.Generic;
    
    public partial class ARvwListadoRequisicionMaterial
    {
        public int RequisicionMaterialId { get; set; }
        public string CodigoRequisicion { get; set; }
        public string Fecha { get; set; }
        public string CreadoPor { get; set; }
        public string Area { get; set; }
        public Nullable<decimal> Monto { get; set; }
        public int EstatusId { get; set; }
        public string Estatus { get; set; }
        public byte[] Timestamp { get; set; }
        public Nullable<bool> PermiteEditar { get; set; }
        public Nullable<bool> PermiteCancelar { get; set; }
        public int CreadoPorId { get; set; }
        public int UsuarioId { get; set; }
    }
}
