using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace API_Evento.Model
{
    [Table("evento")]
    public class Evento
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("id")]
        public int? Id { get; set; }

        [Column("fecha")]
        public DateTime Fecha { get; set; }

        [Column("lugar")]
        public string Lugar { get; set; } = string.Empty;

        [Column("descripcion")]
        public string? Descripcion { get; set; }

        [Column("precio")]
        public decimal? Precio { get; set; }

        [Column("activo")]
        public bool EstaActivo { get; set; } = true;
    }
}
