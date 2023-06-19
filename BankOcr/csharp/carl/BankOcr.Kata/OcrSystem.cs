using static BankOcr.Kata.Number;

namespace BankOcr.Kata;

public static class OcrSystem
{
    public static int[] Parse(string numbers) => BuildNumbers(numbers.ToCharArray())
            .Select(n => n.ToInt())
            .ToArray();

    private static IEnumerable<Number> BuildNumbers(IReadOnlyList<char> charactersNumbers)
    {
        for (var i = 1; i <= 9; i++)
        {
            var element1 = charactersNumbers[GetElementIndex(i, 0, 0)];
            var element2 = charactersNumbers[GetElementIndex(i, 1, 0)];
            var element3 = charactersNumbers[GetElementIndex(i, 2, 0)];
            var element4 = charactersNumbers[GetElementIndex(i, 0, 1)];
            var element5 = charactersNumbers[GetElementIndex(i, 1, 1)];
            var element6 = charactersNumbers[GetElementIndex(i, 2, 1)];
            var element7 = charactersNumbers[GetElementIndex(i, 0, 2)];
            var element8 = charactersNumbers[GetElementIndex(i, 1, 2)];
            var element9 = charactersNumbers[GetElementIndex(i, 2, 2)];
            yield return new Number(new[] { element1, element2, element3, element4, element5, element6, element7, element8, element9 });
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