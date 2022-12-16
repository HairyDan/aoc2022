def shortest_path(arr)
    start_point = find_start(arr)
    end_point = find_end(arr)
    arr[start_point[0]][start_point[1]] = "a"
    arr[end_point[0]][end_point[1]] = "z"
    visited = {}

    queue = [[start_point]]
    until queue.empty?
        path = queue.shift
        current_position = path.last
        next if visited[current_position]
        return path if current_position == end_point
  
        visited[current_position] = true
          
        current_value = arr[current_position[0]][current_position[1]]

        find_traversible_neighbors(arr, current_position, current_value.ord).each do |position|
          next if visited[position]
          new_path = path.clone
          new_path << position
          queue << new_path
        end
    end
end
  
def find_start(arr)
  i = 0
  j = 0
  arr.each do |row|
    j = 0
    row.each do |ele|
      if ele == 'S'
        return [i, j]
      else
        j += 1
      end
    end
    i += 1
  end
end
  
def find_end(arr)
  i = 0
  j = 0
  arr.each do |row|
    j = 0
    row.each do |ele|
      if ele == 'E'
        return [i, j]
      else
        j += 1
      end
    end
    i += 1
  end
end

def find_traversible_neighbors(arr, curr_pos, curr_elevation)
  neighbors = []
  
  x, y = curr_pos
  # check all four directions
  neighbors << [x - 1, y] if x > 0 && (arr[x - 1][y].ord <= curr_elevation + 1)
  neighbors << [x, y - 1] if y > 0 && (arr[x][y - 1].ord <= curr_elevation + 1)
  neighbors << [x + 1, y] if x < arr.length - 1 && (arr[x + 1][y].ord <= curr_elevation + 1)
  neighbors << [x, y + 1] if y < arr[0].length - 1 && (arr[x][y + 1].ord <= curr_elevation + 1)
  
  return neighbors
end
# apply pathfinding :)
#

# Read data from input file
file_contents = File.read('input.txt')

# Create an empty 2D array to store characters
char_array = []
  
# Split each line into its own array
file_contents.each_line do |line|
  char_array << line.chomp.split('')
end

# -1 because we have the start position in the path
puts shortest_path(char_array).length - 1
  