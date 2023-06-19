using Xunit;

namespace BankOcr.Kata;

public class UseCase2
{
    [Fact]
    public void GivenValidAccount_WhenValidateAccount_ThenTrueIsReturned()
    {
        var validAccount = new[] {3,4,5,8,8,2,8,6,5};
        var isValid = OcrSystem.ValidateAccountNumber(validAccount);
        Assert.True(isValid);
    }

    [Fact]
    public void GivenFromOneToNine_WhenValidateAccount_ThenTrueIsReturned()
    {
        var validAccount = new[] {1,2,3,4,5,6,7,8,9};
        var isValid = OcrSystem.ValidateAccountNumber(validAccount);
        Assert.True(isValid);
    }
    
    [Fact]
    public void GivenAllOnes_WhenValidateAccount_ThenFalseIsReturned()
    {
        var validAccount = new[] {1,1,1,1,1,1,1,1,1};
        var isValid = OcrSystem.ValidateAccountNumber(validAccount);
        Assert.False(isValid);
    }
}