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
    
    public partial class GRtblAutonumerico
    {
        public byte AutonumericoId { get; set; }
        public string Nombre { get; set; }
        public string Prefijo { get; set; }
        public long Siguiente { get; set; }
        public int Ceros { get; set; }
        public Nullable<int> NodoMenuId { get; set; }
        public Nullable<int> Ejercicio { get; set; }
        public bool Activo { get; set; }
        public System.DateTime FechaCreacion { get; set; }
        public Nullable<int> CreadoPorId { get; set; }
        public Nullable<System.DateTime> FechaUltimaModificacion { get; set; }
        public Nullable<int> ModificadoPorId { get; set; }
        public byte[] Timestamp { get; set; }
    }
}