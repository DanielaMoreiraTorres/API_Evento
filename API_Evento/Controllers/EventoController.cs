using API_Evento.Infraestructura.Data.IRepositorio;
using API_Evento.Infraestructura.Persistencia;
using API_Evento.Model;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace API_Evento.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class EventoController : ControllerBase
    {
        private readonly ILogger<EventoController> _logger;
        private readonly IEventoRepositorio _eventoRepositorio;

        public EventoController(ILogger<EventoController> logger, IEventoRepositorio eventoRepositorio)
        {
            _logger = logger;
            _eventoRepositorio = eventoRepositorio;
        }

        [HttpGet("obtenerEventos")]
        public async Task<ActionResult> ObteneEventos()
        {
            return Ok(await _eventoRepositorio.ObtenerEventos());
        }

        [HttpGet("obtenerEventoById/{id}")]
        public async Task<ActionResult> ObtenerEventoById(int id)
        {
            var evento = await _eventoRepositorio.ObtenerEventoPorId(id);
            if (evento == null || !evento.EstaActivo)
                return NotFound();
            return Ok(evento);
        }

        [HttpPost("agregarEvento")]
        public async Task<ActionResult> AgregarEvento(Evento evento)
        {
            return Ok(await _eventoRepositorio.AgregarEvento(evento));
        }

        [HttpPut("actualizarEvento")]
        public async Task<ActionResult> ModificarEvento(Evento evento)
        {
            int id = evento.Id ?? 0;
            bool existeEvento = await _eventoRepositorio.ExisteEvento(id);
            if (!existeEvento)
                return BadRequest();

            return Ok(await _eventoRepositorio.ModificarEvento(evento));
        }

        [HttpDelete("eliminarEvento/{id}")]
        public async Task<ActionResult> EliminarEvento(int id)
        {
            var evento = await _eventoRepositorio.ObtenerEventoPorId(id);
            if (evento == null || !evento.EstaActivo)
                return NotFound();

            return Ok(await _eventoRepositorio.EliminarEvento(evento));
        }
    }
}
