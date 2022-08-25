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
    
    public partial class tblCuentaPresupuestalEgr
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblCuentaPresupuestalEgr()
        {
            this.ARtblAlmacenProducto = new HashSet<ARtblAlmacenProducto>();
            this.tblOrdenCompraDet = new HashSet<tblOrdenCompraDet>();
            this.ARtblInvitacionCompraDetalle = new HashSet<ARtblInvitacionCompraDetalle>();
            this.tblCompraDet = new HashSet<tblCompraDet>();
            this.ARtblInventarioAjusteDetalle = new HashSet<ARtblInventarioAjusteDetalle>();
            this.ARtblInvitacionArticuloDetalle = new HashSet<ARtblInvitacionArticuloDetalle>();
            this.ARtblCortesiaDetalle = new HashSet<ARtblCortesiaDetalle>();
        }
    
        public int CuentaPresupuestalEgrId { get; set; }
        public string RamoId { get; set; }
        public string ProyectoId { get; set; }
        public string DependenciaId { get; set; }
        public string ObjetoGastoId { get; set; }
        public string TipoGastoId { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ARtblAlmacenProducto> ARtblAlmacenProducto { get; set; }
        public virtual tblObjetoGasto tblObjetoGasto { get; set; }
        public virtual tblProyecto tblProyecto { get; set; }
        public virtual tblRamo tblRamo { get; set; }
        public virtual tblTipoGasto tblTipoGasto { get; set; }
        public virtual tblDependencia tblDependencia { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblOrdenCompraDet> tblOrdenCompraDet { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ARtblInvitacionCompraDetalle> ARtblInvitacionCompraDetalle { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblCompraDet> tblCompraDet { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ARtblInventarioAjusteDetalle> ARtblInventarioAjusteDetalle { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ARtblInvitacionArticuloDetalle> ARtblInvitacionArticuloDetalle { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ARtblCortesiaDetalle> ARtblCortesiaDetalle { get; set; }
    }
}