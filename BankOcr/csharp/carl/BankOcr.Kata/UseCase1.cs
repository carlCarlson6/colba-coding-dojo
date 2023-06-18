using Xunit;

namespace BankOcr.Kata;

public class UseCase1
{
    [Fact]
    public void GivenAllZerosInput_WhenParse_ThenArrayOfAllZerosIsReturned()
    {
        const string zeros = " _  _  _  _  _  _  _  _  _ " +
                             "| || || || || || || || || |" +
                             "|_||_||_||_||_||_||_||_||_|";
        var result = OcrSystem.Parse(zeros);
        Assert.Equal(new[] {0,0,0,0,0,0,0,0,0}, result);
    }

    [Fact]
    public void GivenAllOnesInput_WhenParse_ThenArrayOfAllOnesIsReturned()
    {
        const string ones = "                           " + 
                            "  |  |  |  |  |  |  |  |  |" + 
                            "  |  |  |  |  |  |  |  |  |";
        var result = OcrSystem.Parse(ones);
        Assert.Equal(new[] {1,1,1,1,1,1,1,1,1}, result);
    }

    [Fact]
    public void GivenAllTwosInput_WhenParse_ThenArrayOfAllTwosIsReturned()
    {
        const string twos = " _  _  _  _  _  _  _  _  _ " + 
                            " _| _| _| _| _| _| _| _| _|" + 
                            "|_ |_ |_ |_ |_ |_ |_ |_ |_ ";
        var result = OcrSystem.Parse(twos);
        Assert.Equal(new[] {2,2,2,2,2,2,2,2,2}, result);
    }
    
    [Fact]
    public void GivenAllThreesInput_WhenParse_ThenArrayOfAllThreesIsReturned()
    {
        const string threes = " _  _  _  _  _  _  _  _  _ " + 
                            " _| _| _| _| _| _| _| _| _|" + 
                            " _| _| _| _| _| _| _| _| _|";
        var result = OcrSystem.Parse(threes);
        Assert.Equal(new[] {3,3,3,3,3,3,3,3,3}, result);
    }
    
    [Fact]
    public void GivenAllFoursInput_WhenParse_ThenArrayOfAllFoursIsReturned()
    {
        const string threes = "                           " + 
                              "|_||_||_||_||_||_||_||_||_|" + 
                              "  |  |  |  |  |  |  |  |  |";
        var result = OcrSystem.Parse(threes);
        Assert.Equal(new[] {4,4,4,4,4,4,4,4,4}, result);
    }
    
    [Fact]
    public void GivenAllFivesInput_WhenParse_ThenArrayOfAllFivesIsReturned()
    {
        const string threes = " _  _  _  _  _  _  _  _  _ " + 
                              "|_ |_ |_ |_ |_ |_ |_ |_ |_ " + 
                              " _| _| _| _| _| _| _| _| _|";
        var result = OcrSystem.Parse(threes);
        Assert.Equal(new[] {5,5,5,5,5,5,5,5,5}, result);
    }
    
    [Fact]
    public void GivenAllSixesInput_WhenParse_ThenArrayOfAllSixesIsReturned()
    {
        const string threes = " _  _  _  _  _  _  _  _  _ " + 
                              "|_ |_ |_ |_ |_ |_ |_ |_ |_ " + 
                              "|_||_||_||_||_||_||_||_||_|";
        var result = OcrSystem.Parse(threes);
        Assert.Equal(new[] {6,6,6,6,6,6,6,6,6}, result);
    }
    
    [Fact]
    public void GivenAllSevensInput_WhenParse_ThenArrayOfAllSevensIsReturned()
    {
        const string threes = " _  _  _  _  _  _  _  _  _ " + 
                              "  |  |  |  |  |  |  |  |  |" + 
                              "  |  |  |  |  |  |  |  |  |";
        var result = OcrSystem.Parse(threes);
        Assert.Equal(new[] {7,7,7,7,7,7,7,7,7}, result);
    }
    
    [Fact]
    public void GivenAllEightsInput_WhenParse_ThenArrayOfAllEightsIsReturned()
    {
        const string threes = " _  _  _  _  _  _  _  _  _ " + 
                              "|_||_||_||_||_||_||_||_||_|" + 
                              "|_||_||_||_||_||_||_||_||_|";
        var result = OcrSystem.Parse(threes);
        Assert.Equal(new[] {8,8,8,8,8,8,8,8,8}, result);
    }
    
    [Fact]
    public void GivenAllNinesInput_WhenParse_ThenArrayOfAllNinesIsReturned()
    {
        const string threes = " _  _  _  _  _  _  _  _  _ " + 
                              "|_||_||_||_||_||_||_||_||_|" + 
                              " _| _| _| _| _| _| _| _| _|";
        var result = OcrSystem.Parse(threes);
        Assert.Equal(new[] {9,9,9,9,9,9,9,9,9}, result);
    }

    [Fact]
    public void GivenNumbersFromOneToNine_WhenParse_ThenArrayOfNumberFromOneToNineIsReturned()
    {
        const string threes = "    _  _     _  _  _  _  _ " + 
                              "  | _| _||_||_ |_   ||_||_|" + 
                              "  ||_  _|  | _||_|  ||_| _|";
        var result = OcrSystem.Parse(threes);
        Assert.Equal(new[] {1,2,3,4,5,6,7,8,9}, result);
    }
}