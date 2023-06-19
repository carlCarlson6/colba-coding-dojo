fun main() {
    println("Hello Kata!")
    getAccountNumber("")
}

fun getAccountNumber(zeroAccount: String): String {

    val pairOfNumbers: MutableList<String> = mutableListOf()

    for (i in zeroAccount.indices step 3) {
        val element1 = zeroAccount.get(i)
        val element2 = zeroAccount.get(i + 1)
        val element3 = zeroAccount.get(i + 2)
        pairOfNumbers.add(element1.toString() + element2.toString() + element3.toString())
    }

    val items = mutableListOf<String>()
    for (i in 0..8) {
        items.add(pairOfNumbers[i] + pairOfNumbers[i + 9] + pairOfNumbers[i + 18])
    }

    return buildAccountNumber(items)
}

fun buildAccountNumber(itemList: MutableList<String>): String {
    val stringBuilder = StringBuilder()
    for (i in 0 until 9) {
        stringBuilder.append(transformNumber(itemList[i]).toString())
    }
    return stringBuilder.toString()
}

fun transformNumber(accountDigit: String): Int? {
    when (accountDigit) {
        Numbers.NUMBER0.value -> return 0
        Numbers.NUMBER1.value -> return 1
        Numbers.NUMBER2.value -> return 2
        Numbers.NUMBER3.value -> return 3
        Numbers.NUMBER4.value -> return 4
        Numbers.NUMBER5.value -> return 5
        Numbers.NUMBER6.value -> return 6
        Numbers.NUMBER7.value -> return 7
        Numbers.NUMBER8.value -> return 8
        Numbers.NUMBER9.value -> return 9
    }
    return null
}

enum class Numbers(val value: String) {
    NUMBER0(" _ | ||_|"),
    NUMBER1("     |  |"),
    NUMBER2(" _  _||_ "),
    NUMBER3(" _  _| _|"),
    NUMBER4("   |_|  |"),
    NUMBER5(" _ |_  _|"),
    NUMBER6(" _ |_ |_|"),
    NUMBER7(" _   |  |"),
    NUMBER8(" _ |_||_|"),
    NUMBER9(" _ |_| _|")
}