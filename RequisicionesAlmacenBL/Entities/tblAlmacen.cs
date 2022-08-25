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
    
    public partial class tblAlmacen
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblAlmacen()
        {
            this.ARtblAlmacenProducto = new HashSet<ARtblAlmacenProducto>();
            this.tblOrdenCompra = new HashSet<tblOrdenCompra>();
            this.ARtblInvitacionCompra = new HashSet<ARtblInvitacionCompra>();
            this.tblCompra = new HashSet<tblCompra>();
            this.ARtblInventarioAjusteDetalle = new HashSet<ARtblInventarioAjusteDetalle>();
            this.ARtblInvitacionArticulo = new HashSet<ARtblInvitacionArticulo>();
            this.ARtblCortesia = new HashSet<ARtblCortesia>();
            this.ARtblTransferencia = new HashSet<ARtblTransferencia>();
            this.ARtblInventarioFisico = new HashSet<ARtblInventarioFisico>();
            this.ARtblControlMaestroConfiguracionAreaAlmacen = new HashSet<ARtblControlMaestroConfiguracionAreaAlmacen>();
            this.ARtblRequisicionMaterialDetalle = new HashSet<ARtblRequisicionMaterialDetalle>();
        }
    
        public string AlmacenId { get; set; }
        public string EstadoId { get; set; }
        public int MunicipioId { get; set; }
        public string Nombre { get; set; }
        public bool ControlDeProducto { get; set; }
        public string Domicilio { get; set; }
        public string Colonia { get; set; }
        public string CodigoPostal { get; set; }
        public string Telefono1 { get; set; }
        public string Telefono2 { get; set; }
        public string ConsecutivoAlmacen { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ARtblAlmacenProducto> ARtblAlmacenProducto { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblOrdenCompra> tblOrdenCompra { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ARtblInvitacionCompra> ARtblInvitacionCompra { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblCompra> tblCompra { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ARtblInventarioAjusteDetalle> ARtblInventarioAjusteDetalle { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ARtblInvitacionArticulo> ARtblInvitacionArticulo { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ARtblCortesia> ARtblCortesia { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ARtblTransferencia> ARtblTransferencia { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ARtblInventarioFisico> ARtblInventarioFisico { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ARtblControlMaestroConfiguracionAreaAlmacen> ARtblControlMaestroConfiguracionAreaAlmacen { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ARtblRequisicionMaterialDetalle> ARtblRequisicionMaterialDetalle { get; set; }
        public virtual tblEstado tblEstado { get; set; }
        public virtual tblMunicipio tblMunicipio { get; set; }
    }
}