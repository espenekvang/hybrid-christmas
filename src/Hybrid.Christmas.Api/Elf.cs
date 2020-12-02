namespace Hybrid.Christmas.Api
{
	public class Elf
	{
		public string Name { get; set; }
		public string Role { get; set; }

		public Elf(string name, string role)
		{
			Name = name;
			Role = role;
		}
	}
}
