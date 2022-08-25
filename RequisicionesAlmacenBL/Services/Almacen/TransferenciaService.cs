using RequisicionesAlmacenBL.Entities;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Linq;
using RequisicionesAlmacenBL.Helpers;
using RequisicionesAlmacenBL.Services.SAACG;

namespace RequisicionesAlmacenBL.Services.Almacen
{
    public class TransferenciaService : BaseService<ARtblTransferencia>
    {
        public override ARtblTransferencia BuscaPorId(int id)
        {
            using (var Context = SAACGContextHelper.GetContext())
            {
                return Context.ARtblTransferencia.Where(m => m.TransferenciaId == id).FirstOrDefault();
            }
        }

        public List<ARtblTransferencia> BuscaTodos()
        {
            using (var Context = SAACGContextHelper.GetContext())
            {
                return Context.ARtblTransferencia.ToList();
            }
        }

        public List<ARvwListadoTransferencias> BuscaListado()
        {
            using (var Context = SAACGContextHelper.GetContext())
            {
                return Context.ARvwListadoTransferencias.ToList();
            }
        }

        public override ARtblTransferencia Inserta(ARtblTransferencia entidad, SAACGContext context)
        {
            //Asignamos el autonumerico
            entidad.Codigo = new AutonumericoService().GetSiguienteAutonumerico("Transferencias", context);

            //Agregamos la entidad el Context
            ARtblTransferencia modelo = context.ARtblTransferencia.Add(entidad);

            //Guardamos cambios
            context.SaveChanges();

            //Retornamos si guardó correctamente
            return modelo;
        }

        public override bool Actualiza(ARtblTransferencia entidad, SAACGContext context)
        {
            //Agregamos la entidad el Context
            ARtblTransferencia modelo = context.ARtblTransferencia.Add(entidad);

            //Marcamos el modelo como modificado
            context.Entry(entidad).State = EntityState.Modified;

            //Marcar todas las propiedades que no se pueden actualizar como FALSE
            //para que no se actualice su informacion en Base de Datos
            foreach (string propertyName in ARtblTransferencia.PropiedadesNoActualizables)
            {
                context.Entry(entidad).Property(propertyName).IsModified = false;
            }

            //Guardamos cambios
            return context.SaveChanges() > 0;
        }

        public int GuardaCambios(ARtblTransferencia entidad)
        {
            using (var Context = SAACGContextHelper.GetContext())
            {
                try
                {
                    //Iniciamos la transacción
                    Context.Database.BeginTransaction();

                    //Guardamos el modelo
                    ARtblTransferencia transferencia = Inserta(entidad, Context);

                    //Guardamos cambios
                    Context.SaveChanges();

                    //Registramos los movimientos en el inventario
                    Context.ARspAfectaTransferencias(transferencia.TransferenciaId, transferencia.CreadoPorId);

                    //Actualizamos la póliza
                    new PolizaService().ActualizaPolizaTransferencia(transferencia.TransferenciaId, transferencia.FechaCreacion, Context);

                    //Hacemos el Commit
                    Context.Database.CurrentTransaction.Commit();

                    //Retornamos la entidad que se acaba de guardar en la Base de Datos
                    return transferencia.TransferenciaId;
                }
                catch (DbEntityValidationException ex)
                {
                    //Hacemos el Rollback
                    Context.Database.CurrentTransaction.Rollback();

                    throw new Exception(UserExceptionHelper.GetMessage(ex));
                }
                catch (Exception ex)
                {
                    //Hacemos el Rollback
                    Context.Database.CurrentTransaction.Rollback();

                    throw new Exception(UserExceptionHelper.GetMessage(ex));
                }
            }
        }

        public override bool Elimina(int id, int eliminadoPorId, SAACGContext context)
        {
            throw new NotImplementedException();
        }

        public List<ARspConsultaTransferenciaDetalles_Result> BuscaMovtosPorTransferenciaId(int id)
        {
            using (var Context = SAACGContextHelper.GetContext())
            {
                return Context.ARspConsultaTransferenciaDetalles(id).ToList();
            }
        }

        public List<ARspConsultaTransferenciaProductos_Result> BuscaProductos()
        {
            using (var Context = SAACGContextHelper.GetContext())
            {
                return Context.ARspConsultaTransferenciaProductos().ToList();
            }
        }
    }
}