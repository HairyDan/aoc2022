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

class Knot {
  // spoooky numbers here
  final maxLayers = 9;
  Point position = new Point(0, 0);
  int layerNumber;
  List<Knot> children = <Knot>[];

  // this should probs start blank have positon added in init but dont think make differnce
  List<Point> knotVisited = <Point>[new Point(0, 0)];
  
  // create any children in the chain during init
  Knot(this.layerNumber) {
    layerNumber = this.layerNumber;
    if (layerNumber < maxLayers) {
      children.add(new Knot(layerNumber + 1));
    }
  }

  Map getUniqueAllChildKnots (Map answerMap) {
    answerMap[layerNumber] = knotVisited.toSet().length;
    for (Knot child in children) {
      answerMap = child.getUniqueAllChildKnots(answerMap);
    }
    return answerMap;
  }
  
  void updatePosition(Point parentPos) {
    // logic for moving each:
    // update the position of this knot
    Vector distanceVector = parentPos.subtract(position);
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
        if ((xMag > 1 && yMag >= 1) || (yMag > 1 && xMag >= 1)) {
          position.changePoint(1 * xMod, 1 * yMod);
          xMag = xMag - 1;
          yMag = yMag - 1;
        } else if (xMag > 1) {
          position.changeX(1 * xMod);
          xMag = xMag - 1;
        } else if (yMag > 1) {
          position.changeY(1 * yMod);
          yMag = yMag - 1;
        }
        knotVisited.add(new Point(position.x, position.y));
      }
    }
    
    // then update for all children, propagating through chain
    for (Knot child in children) {
      child.updatePosition(position);
    }
  }

  @override
  String toString() {
    return 'Knot(layer: $layerNumber, postion: $position, children: $children)';
  }
}

class Rope {
  Point head = new Point(0, 0);
  Knot childKnot = new Knot(1);

  void moveHead(MoveCommand command) {
    var xMod = 0;
    var yMod = 0;
    switch (command.direction) {
      case "U":
        {
          yMod = 1;
        }
        break;
      case "R":
        {
          xMod = 1;
        }
        break;
      case "D":
        {
          yMod = -1;
        }
        break;
      case "L":  
        {
          xMod = -1;
        }
        break;
      default:
        {
          print("Invalid direction");
        }
        break;
    }

    for (int i = 0; i < command.magnitude; i++) {
      head.changePoint(xMod, yMod);
      childKnot.updatePosition(head);
    }
  }

  void describe() {
    print('Rope(Head: $head, children: $childKnot)');
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

  var uniqueKnotSiteCounts = test.childKnot.getUniqueAllChildKnots(new Map());

  var allknots = uniqueKnotSiteCounts;
  print('all knots: $allknots');
  
  var answer = uniqueKnotSiteCounts[1];
  print('part a answer: $answer');

  var banswer = uniqueKnotSiteCounts[9];
  print('part b answer: $banswer');
  
  // test.describe();
  
}
