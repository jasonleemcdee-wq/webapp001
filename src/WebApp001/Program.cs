var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/", () => "Hello World");
app.MapGet("/health", () => "OK");

app.Run();

// Needed for integration testing
public partial class Program { }
