using API_Evento.Infraestructura.Data.IRepositorio;
using API_Evento.Infraestructura.Persistencia;
using API_Evento.Model;
using Microsoft.EntityFrameworkCore;

namespace API_Evento.Infraestructura.Data.Repositorio
{
    public class EventoRepositorio : IEventoRepositorio
    {
        private readonly AppDbContext _context;

        public EventoRepositorio(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<Evento>> ObtenerEventos()
        {
            return await _context.Evento.Where(e => e.EstaActivo).ToListAsync();
        }

        public async Task<Evento> ObtenerEventoPorId(int id)
        {
            return await _context.Evento.FindAsync(id);
        }

        public async Task<bool> ExisteEvento(int id)
        {
            var evento = await _context.Evento.FindAsync(id);
            _context.Entry(evento).State = EntityState.Detached;

            return evento != null ? true : false;
        }

        public async Task<Evento> AgregarEvento(Evento evento)
        {
            _context.Evento.Add(evento);
            await _context.SaveChangesAsync();
            return evento;
        }

        public async Task<Evento> ModificarEvento(Evento evento)
        {
            _context.Entry(evento).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return evento;
        }

        public async Task<Evento> EliminarEvento(Evento evento)
        {
            evento.EstaActivo = false;
            await _context.SaveChangesAsync();
            return evento;
        }




    }
}
