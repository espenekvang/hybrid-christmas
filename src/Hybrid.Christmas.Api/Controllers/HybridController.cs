using System.Threading.Tasks;
using Hybrid.Christmas.Api.Services;
using Microsoft.AspNetCore.Mvc;

namespace Hybrid.Christmas.Api.Controllers
{
	[ApiController]
	[Route("[controller]")]
	public class HybridController : ControllerBase
	{
		private readonly IElfService _elfService;

		public HybridController(IElfService elfService)
		{
			_elfService = elfService;
		}

		[HttpGet]
		[Route("elves")]
		public async Task<IActionResult> GetElves()
		{
			var elves = await _elfService.GetElvesAsync();
			return Ok(elves);
		}
	}
}
