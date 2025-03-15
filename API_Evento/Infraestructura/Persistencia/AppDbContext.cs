using API_Evento.Model;
using Microsoft.EntityFrameworkCore;

namespace API_Evento.Infraestructura.Persistencia
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions options) : base(options)
        {
        }
        public DbSet<Evento> Evento { get; set; }
    }
}
