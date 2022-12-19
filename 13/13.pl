print "Hello, world\n";

#!/usr/bin/perl

sub say {print @_, "\n"}

# open the input file
open(my $fh, '<', 'input.txt') or die "Could not open file 'input.txt' $!";
 
# create an array to store the lines
my @lines;

my @firstLines;
my @secondLines;
 
# read each line from the input file and store it in the array
while (my $line = <$fh>) {
	chomp $line;
	push @lines, $line;
}
 
# close the input file
close $fh;
 
# print each line of the array
foreach my $line (@lines) {
	say "$line";
}

# loop through the lines array putting first of each pair in @first, second in @second etc. Remove first 2 lines here to line up the while loop better

push @firstLines, shift(@lines);
push @secondLines, shift(@lines);

while (@lines) {
  shift(@lines);
  push @firstLines, shift(@lines);
  push @secondLines, shift(@lines);
}

say "FIRSTLINES";
foreach my $fl (@firstLines) {
	say "$fl";
}
say "SECONDLINES";
foreach my $sl (@secondLines) {
	say "$sl";
}

sub compareTwo (leftOne, rightOne) {
  # returns bool representing if the pairs presented are in the right order
  # for all checks below immediately return 0 if wrong order identified

  # maybe BUGGED cba to think properly rn: may not pop the actual value off each time, might need to double pop as nested arrays
  my @currentLeft = shift @leftOne;
  my @currentRight = shift @rightOne;
  
  # check types of current values somehow


  # if both are ints - compare the two ints
  if (CHECK_IF_INTS) {
    if (leftOne > rightOne) {
      return 0
    }
  }
  
  # if only one is a list - convert the integer to a list which contains that integer
  if (CHECK_IF_ONELIST) {
    # convert the integer value to a list [3, 5] vs 7 --> [3, 5] vs [7]
    # then move onto below check
    
  }



  # if both are lists (which they will be if one was initially a list) - compare each value of the list 
  # recurse here too - same rules apply?
  if (CHECK_IF_TWOLIST) {
    # really hating perl
    for (my $i = 0; $i < scalar @currentLeft; $i++) {
      my $nextLeft = currentLeft[i];
      my $nextRight = currentRight[i];
      
      if (compareTwo(@nextLeft, @nextRight) == 0) {
        return 0;
      }
      
    }


  }


  # if not the final value get the next value and repeat
    my $nextResult = compareTwo(@currentLeft, @currentRight);
    if ($nextResult == 0) {
      return 0;
    }
    
  # if no values remain to traverse through deeper and lists not unordered, return true
  return 1
   
}


# loop through each pair
foreach my $fl (@firstLines) {
  # retrieve the left side and right side
  my $leftVal = shift @firstLines;
  my $rightVal = shift @secondLines;
  say "leftval: $leftVal";
  say "rightval: $rightVal";

  # now do the comparison
  my $result = compareTwo($leftVal, $rightVal);
  # store the result for each pair of lists, and calculate answer in the end
}
