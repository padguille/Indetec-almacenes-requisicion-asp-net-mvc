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
    
    public partial class MItblPlanDesarrollo
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public MItblPlanDesarrollo()
        {
            this.MItblMatrizIndicadorResultado = new HashSet<MItblMatrizIndicadorResultado>();
            this.MItblPlanDesarrolloEstructura = new HashSet<MItblPlanDesarrolloEstructura>();
        }
    
        public int PlanDesarrolloId { get; set; }
        public string NombrePlan { get; set; }
        public System.DateTime FechaInicio { get; set; }
        public System.DateTime FechaFin { get; set; }
        public int EstatusId { get; set; }
        public System.DateTime FechaCreacion { get; set; }
        public int CreadoPorId { get; set; }
        public Nullable<System.DateTime> FechaUltimaModificacion { get; set; }
        public Nullable<int> ModificadoPorId { get; set; }
        public byte[] Timestamp { get; set; }
        public int TipoPlanId { get; set; }
    
        private GRtblControlMaestro GRtblControlMaestro { get; set; }
        private GRtblControlMaestro GRtblControlMaestro1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        private ICollection<MItblMatrizIndicadorResultado> MItblMatrizIndicadorResultado { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        private ICollection<MItblPlanDesarrolloEstructura> MItblPlanDesarrolloEstructura { get; set; }
        public virtual GRtblUsuario GRtblUsuario { get; set; }
        public virtual GRtblUsuario GRtblUsuario1 { get; set; }
    }
}
