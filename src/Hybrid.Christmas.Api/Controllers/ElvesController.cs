using System.Collections.Generic;
using Hybrid.Christmas.Api;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace Hybrid.Christmas.Controllers
{
	[ApiController]
	[Route("[controller]")]
	public class ElvesController : ControllerBase
	{
		private readonly ILogger<ElvesController> _logger;

		public ElvesController(ILogger<ElvesController> logger)
		{
			_logger = logger;
		}

		[HttpGet]
		public IEnumerable<Elf> Get()
		{
			return new List<Elf>
			{
				new Elf("Alabaster Snowball", "The administrator of the 'Naughy or Nice List'"),
				new Elf("Bushy Evergreen", "The inventor of Santa's magic toy-making machine"),
				new Elf("Pepper Minstix", "The protector of Santa's magic world"),
				new Elf("Shinny Upatree", "The leader of all the elves"),
				new Elf("Sugarplum Mary", "Head of sweet treats"),
				new Elf("Wunorse Openslae", "In charge of the reindeer"),
			};
		}
	}
}
