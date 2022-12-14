using System;
using System.Collections.Generic;
using System.Linq;


class Operation
{
    public string OpSign { get; set; }
    public long OpValue { get; set; }
    public bool OpValueSelf {get; set; }
  
    public Dictionary<string, Func<long, long, long>> OpsMap { get; } =
    new Dictionary<string, Func<long, long, long>>(){
                                          {"*", (x, y) => x * y},
                                          {"+", (x, y) => x + y},
                                          {"/", (x, y) => x / y}
                                            };

    public Operation(string opSign, long opValue = 1, bool opValueSelf=false)
    {
        OpSign = opSign;
        OpValue = opValue;
        OpValueSelf = opValueSelf;
    }

    public long ApplyOperation(long worryVal)
    {
      long result;
      
        if (OpValueSelf) {
          result = OpsMap[OpSign](worryVal, worryVal);
        } else {
          result = OpsMap[OpSign](worryVal, OpValue);
        }
        
        return result;
    }

}

class Monkey
{
    public long MonkeyID { get; set; } = 0; 
    public List<long> Items { get; set; } = new List<long>{};
    public long TestValue { get; set; } = 1;
    public Operation MonkeyOperation { get; set; } = new Operation("+", 0);
    public Operation BoredOperation { get; } = new Operation("/", 3);

    public Dictionary<bool, long> MonKeys { get; set; } = new Dictionary<bool, long>(){};
    public long InspectCount { get; set; } = 0;

    public Monkey(long monkeyID, List<long> startingItems, long testValue, Operation monkeyOperation, Dictionary<bool, long> monKeys)
    {
        MonkeyID = monkeyID;
        Items = startingItems;
        TestValue = testValue;
        MonkeyOperation = monkeyOperation;
        MonKeys = monKeys;
        InspectCount = 0;
    }

    public Monkey(long monkeyID) {
      MonkeyID = monkeyID;
    }

    public void addItem(long itemWorry)
    {
        Items.Add(itemWorry);
    }

    public void parseItemsLine(String line) {
      // do thing in here
      var itemValues = line.Substring(18).Split(",").Select(long.Parse).ToList();
      Items = itemValues;
    }

    public void parseTestLine(String line) {
      // do thing in here
      TestValue = long.Parse(line.Substring(21));
    }
  
  
    public void parseOppsLine(String line) {
      // do thing in here
      Operation covertMonkeyop = new Operation("+", 0);
      var splitOps = line.Substring(19).Split(" ");
      if (splitOps.Last() == "old") {
        covertMonkeyop.OpValueSelf = true;
      } else {
        covertMonkeyop.OpValueSelf = false;
        covertMonkeyop.OpValue = long.Parse(splitOps.Last());
      }
      covertMonkeyop.OpSign = splitOps[1];
      MonkeyOperation = covertMonkeyop;
    }
  
    public void parseTrueLine(String line) {
      // do thing in here
      MonKeys[true] = long.Parse(line.Substring(29));
    }

    public void parseFalseLine(String line) {
      // do thing in here
      MonKeys[false] = long.Parse(line.Substring(29));
    }

    public void inspectInventory(List<Monkey> eligibleMonkeys)
    {
        foreach (long item in Items)
        {
            // inspect item - add to inspect count
            // Console.WriteLine("INSPECTCOUNT GOING UP FOR MONKE: " + MonkeyID);
            this.InspectCount += 1;
            // apply operation to determine updated worry level
            long newWorry = MonkeyOperation.ApplyOperation(item); 
            // Console.WriteLine(newWorry);
            // do what monkey does when bored divide by 3 and round down 
            // NO LONGER DO THIS FOR PART B
            // newWorry = BoredOperation.ApplyOperation(newWorry);
            // Console.WriteLine(newWorry);
            // test item to determine which monkey it is thrown to
            int receivingMonkey = (int) MonKeys[(newWorry % TestValue == 0)];

            newWorry = newWorry % (3*5*2*13*11*17*19*7);
            // throw to monkey
            // Console.WriteLine(receivingMonkey);
            // Console.WriteLine(eligibleMonkeys.Count());
            eligibleMonkeys[receivingMonkey].addItem(newWorry);
        }
        // remove all items from monkeys inventory after inspecting all
        Items.Clear();
    }

    public void describethisshit()
    {
        Console.WriteLine("monkey id: {0}", MonkeyID);
        Console.WriteLine("monkey Items: {0}", string.Join(";", Items));
        Console.WriteLine("TestValue: {0}", TestValue);
        Console.WriteLine("MonkeyOperation: {0}", MonkeyOperation);
        Console.WriteLine("inspect count: {0}", InspectCount);
        MonKeys.Select(i => $"{i.Key}: {i.Value}").ToList().ForEach(Console.WriteLine);
        Console.WriteLine("\n");

    }
}

class Program
{
    public static List<Monkey> ParseMonkey(string fileName) {
      List<Monkey> parsedMonkeys = new List<Monkey>();
      var firstMonkey = true;
      
      Monkey currentMonkey = null;
      string[] lines = System.IO.File.ReadAllLines(fileName);
      
      foreach (string line in lines) {
        // read lines longo monkey
        if (line.Contains("Starting items:")) {
          currentMonkey.parseItemsLine(line);
        }
        if (line.Contains("Operation:")) {
          currentMonkey.parseOppsLine(line);
        }
        if (line.Contains("Test:") ) {
          currentMonkey.parseTestLine(line);
        }

        if (line.Contains("If true")) {
          currentMonkey.parseTrueLine(line);
        }

        if (line.Contains("If false")) {
          currentMonkey.parseFalseLine(line);
          // false is last thing in block so add it to parsed monkeys
          parsedMonkeys.Add(currentMonkey);
        }
        
        if (line.Contains("Monkey ")){
          // NOTE this breaks if the monkey id is two digits
          currentMonkey = new Monkey(long.Parse(line.Substring(7, 1)));

        }

        
      }

      
      return parsedMonkeys;
    }


    public static void Main(string[] args)
    {
      // read in monkeys to list of monkeys
      var allMonkeys = ParseMonkey("./input.txt");
      
      // then do 20 rounds
      var rounds = 10000;
      for (long i = 0; i < rounds; i++) 
        {
          // each round loop through each monkey and inspectInventory([monkeyList]);
          foreach (Monkey m in allMonkeys) {
            // m.describethisshit();
            m.inspectInventory(allMonkeys);
          }
        }
      
      foreach (Monkey m in allMonkeys) {
        Console.WriteLine("monkey ID: {0} monkey inspect count: {1}", m.MonkeyID, m.InspectCount);
      }
 

      // return highest 2 inspect counts and multiply for those 2 monkeys 
    }
}
