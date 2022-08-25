using RequisicionesAlmacenBL.Entities;
using System;
using System.Data.Entity;

namespace RequisicionesAlmacenBL.Services
{
    public class AlmacenProductoService : BaseService<ARtblAlmacenProducto>
    {
        public override bool Actualiza(ARtblAlmacenProducto entidad, SAACGContext context)
        {
            throw new NotImplementedException();
        }

        public override ARtblAlmacenProducto BuscaPorId(int id)
        {
            throw new NotImplementedException();
        }

        public override bool Elimina(int id, int eliminadoPorId, SAACGContext context)
        {
            throw new NotImplementedException();
        }

        public override ARtblAlmacenProducto Inserta(ARtblAlmacenProducto entidad, SAACGContext context)
        {
            throw new NotImplementedException();
        }
    }
}