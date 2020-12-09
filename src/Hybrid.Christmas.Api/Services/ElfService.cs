using System.Collections.Generic;
using System.Net.Http;
using System.Text.Json;
using System.Threading.Tasks;
using Hybrid.Christmas.Types;

namespace Hybrid.Christmas.Api.Services
{
	public interface IElfService
	{
		Task<List<Elf>> GetElvesAsync();
	}

	public class ElfService : IElfService
	{
		private readonly HttpClient _httpClient;

		public ElfService(HttpClient httpClient)
		{
			_httpClient = httpClient;
		}

		public async Task<List<Elf>> GetElvesAsync()
		{
			var responseString = await _httpClient.GetStringAsync("elves");
			var options = new JsonSerializerOptions
			{
				PropertyNamingPolicy = JsonNamingPolicy.CamelCase
			};
			return JsonSerializer.Deserialize<List<Elf>>(responseString, options);
		}
	}
}
