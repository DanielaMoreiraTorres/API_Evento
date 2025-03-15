using API_Evento.Model;

namespace API_Evento.Infraestructura.Data.IRepositorio
{
    public interface IEventoRepositorio
    {
        Task<IEnumerable<Evento>> ObtenerEventos();
        Task<Evento> ObtenerEventoPorId(int id);
        Task<bool> ExisteEvento(int id);
        Task<Evento> AgregarEvento(Evento evento);
        Task<Evento> ModificarEvento(Evento evento);
        Task<Evento> EliminarEvento(Evento evento);
    }
}
