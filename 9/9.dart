import 'dart:convert';
import 'dart:io';

class Vector {
  int x;
  int y;

  Vector(this.x, this.y) {
    x = this.x;
    y = this.y;
  }

  int totalDistance() {
    return x + y;
  }

  @override
  String toString() {
    return 'Vector(x: $x, y: $y)';
  }
}

class Point {
  int x;
  int y;

  Point(this.x, this.y) {
    x = this.x;
    y = this.y;
  }

  void changePoint(int increX, int increY) {
    x = x + increX;
    y = y + increY;
  }

  void changeX(int change) {
    changePoint(change, 0);
  }

  void changeY(int change) {
    changePoint(0, change);
  }

  Vector subtract(Point secondPoint) {
    var diffX = x - secondPoint.x;
    var diffY = y - secondPoint.y;
    return new Vector(diffX, diffY);
  }

  @override
  String toString() {
    return 'Point(x: $x, y: $y)';
  }

  @override
  bool operator ==(Object other) {
    return (other is Point) && (other.x == x) && (other.y == y);
  }

  @override
  int get hashCode {
    return Object.hash(x, y);
  }
  
}

class MoveCommand {
  String direction;
  int magnitude;

  MoveCommand(this.direction, this.magnitude) {
    direction = this.direction;
    magnitude = this.magnitude;
  }

  @override
  String toString() {
    return 'MoveCommand(Direction: $direction, Magnitude: $magnitude)';
  }
}

class Rope {
  Point head = new Point(0, 0);
  Point tail = new Point(0, 0);
  List<Point> tailVisited = <Point>[new Point(0, 0)];

  void updateTail(MoveCommand command) {
    Vector distanceVector = head.subtract(tail);
    var xMod = 1;
    if (distanceVector.x.isNegative) {
      xMod *= -1;
    }
    var yMod = 1;
    if (distanceVector.y.isNegative) {
      yMod *= -1;
    }

    var xMag = distanceVector.x.abs();
    var yMag = distanceVector.y.abs();
    if (xMag > 1 || yMag > 1) {
      while (xMag > 1 || yMag > 1) {
        if ((xMag > 1 && yMag >=1)  || (yMag > 1 && xMag >=1)) {
          tail.changePoint(1 * xMod, 1 * yMod);
          xMag = xMag - 1;
          yMag = yMag - 1;
        } else if (xMag > 1) {
          tail.changeX(1 * xMod);
          xMag = xMag - 1;
        } else if (yMag > 1) {
          tail.changeY(1 * yMod);
          yMag = yMag - 1;
        }
        tailVisited.add(new Point(tail.x, tail.y));
      }
    }
  }

  void moveHead(MoveCommand command) {
    var xMod = 1;
    var yMod = 1;
    switch (command.direction) {
      case "U":
        {
          head.changeY(command.magnitude);
        }
        break;
      case "R":
        {
          head.changeX(command.magnitude);
        }
        break;
      case "D":
        {
          head.changeY(command.magnitude * -1);
        }
        break;
      case "L":
        {
          head.changeX(command.magnitude * -1);
        }
        break;
      default:
        {
          print("Invalid direction");
        }
        break;
    }
    updateTail(command);
  }

  void describe() {
    var uniqueVisited = tailVisited.toSet();
    print('Rope(Head: $head, Tail: $tail)');
    print('Tail Sites Visited: $uniqueVisited');
  }
}

MoveCommand parseCommand(String inputLine) {
  var splitLine = inputLine.split(' ');
  MoveCommand move = new MoveCommand(splitLine[0], int.parse(splitLine[1]));
  return move;
}

void main() {
  Rope test = new Rope();
  List<String> lines = new File('./input.txt').readAsLinesSync();
  for (var line in lines) {
    test.moveHead(parseCommand(line));
  }
  
  // test.describe();
  print(test.tailVisited.toSet().length);
}
