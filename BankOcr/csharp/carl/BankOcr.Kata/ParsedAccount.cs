namespace BankOcr.Kata;

public record ParsedAccount(string Numbers, ParsedResult Result);

public enum ParsedResult
{
    OK,
    ERR,
    ILL
}