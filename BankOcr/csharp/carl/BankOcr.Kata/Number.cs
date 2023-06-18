using static BankOcr.Kata.Numbers;

namespace BankOcr.Kata;

public class Number
{
    private readonly List<char> _characters;
    public Number(IEnumerable<char> characters) => _characters = characters.ToList();

    public int ToInt() => string.Join("", _characters) switch
    {
        Zero  => 0,
        One   => 1,
        Two   => 2,
        Three => 3,
        Four  => 4,
        Five  => 5,
        Six   => 6,
        Seven => 7,
        Eight => 8,
        Nine  => 9,
        _             => throw new ArgumentOutOfRangeException()
    };
}