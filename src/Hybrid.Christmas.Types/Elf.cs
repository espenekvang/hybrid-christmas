namespace Hybrid.Christmas.Types
{
	public class Elf
	{
		public string Name { get; set; }
		public string Role { get; set; }

		//Needed for deserialization
		public Elf()
		{
			
		}

		public Elf(string name, string role)
		{
			Name = name;
			Role = role;
		}
	}
}
