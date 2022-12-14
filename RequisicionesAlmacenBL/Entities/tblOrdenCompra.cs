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
    
    public partial class tblOrdenCompra
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblOrdenCompra()
        {
            this.tblOrdenCompraDet = new HashSet<tblOrdenCompraDet>();
            this.ARtblCortesia = new HashSet<ARtblCortesia>();
        }
    
        public int OrdenCompraId { get; set; }
        public int ProveedorId { get; set; }
        public string AlmacenId { get; set; }
        public string TipoOperacionId { get; set; }
        public int TipoComprobanteFiscalId { get; set; }
        public int Ejercicio { get; set; }
        public System.DateTime Fecha { get; set; }
        public System.DateTime FechaRecepcion { get; set; }
        public string Referencia { get; set; }
        public string Status { get; set; }
        public string Observacion { get; set; }
        public Nullable<int> GastoPorComprobarId { get; set; }
    
        public virtual tblAlmacen tblAlmacen { get; set; }
        public virtual tblProveedor tblProveedor { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblOrdenCompraDet> tblOrdenCompraDet { get; set; }
        public virtual tblTipoComprobanteFiscal tblTipoComprobanteFiscal { get; set; }
        public virtual tblTipoOperacion tblTipoOperacion { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ARtblCortesia> ARtblCortesia { get; set; }
    }
}
