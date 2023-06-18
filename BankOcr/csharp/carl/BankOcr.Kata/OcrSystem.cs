namespace BankOcr.Kata;

public static class OcrSystem
{
    public static int[] Parse(string numbers) => BuildNumbers(numbers.ToCharArray())
            .Select(n => n.ToInt())
            .ToArray();

    private static IEnumerable<Number> BuildNumbers(char[] charactersNumbers)
    {
        for (var i = 1; i <= 9; i++)
        {
            var group1 = charactersNumbers.Skip(3 * (i - 1)).Take(3);
            var group2 = charactersNumbers.Skip(3 * (i - 1) + 27).Take(3);
            var group3 = charactersNumbers.Skip(3 * (i - 1) + 2 * 27).Take(3);
            yield return new Number(group1.Concat(group2).Concat(group3));
        }
    }

    public static bool ValidateAccountNumber(int[] accountNumber) => 
        SumNumber(accountNumber) % 11 == 0;

    private static int SumNumber(IReadOnlyList<int> accountNumber)
    {
        var sum = 0;
        for (var i = 0; i < 9; i++)
        {
            sum += (9 - i) * accountNumber[i];
        }
        return sum;
    }
}