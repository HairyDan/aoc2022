function solve(input)
  local stacks = {}
  local moves = {}
  -- 9 rows
  local rows = {{},{},{},{},{},{},{},{},{}}
  -- local rows = {{},{},{}}  
  -- parse input
  for line in input:gmatch("(.-)\n") do
    local stack = line:match("^%s*%[%s*(.-)%s*%]%s*$")
    if stack then
      table.insert(stacks, line)
    else
      local num, from, to = line:match("^move (%d+) from (%d+) to (%d+)$")
      if from then
        table.insert(moves, { from = tonumber(from), to = tonumber(to), num = tonumber(num) })
      end
    end
  end

  -- turn stacks into rows
  for i, row in ipairs(rows) do
    for _, line in ipairs(stacks) do
      -- print(line)
      local v = i-1
      local start = (v*4)+2
      local endd = (v*4)+2
      -- print(line:sub(start, endd))
      local val = line:sub(start, endd)
      if (val~=" ") then
        table.insert(row, val)
      end
    end
  end

  -- for _, row in ipairs(rows) do
  --   for i, fill in ipairs(row) do
  --     if (fill==" ") then
  --       print("EMPTYROW")
  --       table.remove(row,i)
  --     else
  --       print("nonempty, value is :" .. fill)
  --     end
  --   end
  -- end

  -- print rows (debug)
  for _, row in ipairs(rows) do
    for _, fill in ipairs(row) do
      print("fill: "..fill)
    end
    print("asdasdasdasdasdas")
  end
  
  -- apply moves
  for _, move in ipairs(moves) do
    for i=1,move.num do
      moveFromTo(rows, move.from, move.to)
    end
  end

    -- print rows (debug)
  for _, row in ipairs(rows) do
    for _, fill in ipairs(row) do
      print("fill: "..fill)
    end
    print("ENDOFROWENDOFROWENDOFROW")
  end
  
  -- output answer
  local answer = ""
  for _, row in ipairs(rows) do
    print(row[1])
    if (row[1]) then
      answer = answer .. row[1]
    end
  end
  return answer
end

function moveFromTo(rows, from, to)
  local val = rows[from][1]
  if val then
    table.remove(rows[from], 1)
    table.insert(rows[to], 1, val)
  end
end

print(solve([[            [L] [M]         [M]    
        [D] [R] [Z]         [C] [L]
        [C] [S] [T] [G]     [V] [M]
[R]     [L] [Q] [B] [B]     [D] [F]
[H] [B] [G] [D] [Q] [Z]     [T] [J]
[M] [J] [H] [M] [P] [S] [V] [L] [N]
[P] [C] [N] [T] [S] [F] [R] [G] [Q]
[Z] [P] [S] [F] [F] [T] [N] [P] [W]
 1   2   3   4   5   6   7   8   9 

move 7 from 3 to 9
move 5 from 8 to 9
move 3 from 9 to 5
move 6 from 9 to 2
move 9 from 9 to 3
move 3 from 7 to 3
move 8 from 2 to 3
move 9 from 3 to 1
move 11 from 3 to 8
move 5 from 6 to 9
move 1 from 6 to 3
move 1 from 2 to 7
move 1 from 4 to 8
move 1 from 3 to 9
move 4 from 4 to 3
move 6 from 8 to 3
move 2 from 8 to 2
move 4 from 9 to 3
move 3 from 2 to 5
move 2 from 5 to 4
move 5 from 3 to 4
move 11 from 1 to 4
move 1 from 7 to 6
move 1 from 3 to 5
move 2 from 1 to 9
move 1 from 1 to 4
move 7 from 5 to 8
move 21 from 4 to 6
move 6 from 6 to 2
move 6 from 8 to 9
move 5 from 8 to 5
move 2 from 2 to 7
move 4 from 3 to 7
move 1 from 2 to 6
move 1 from 2 to 5
move 2 from 2 to 7
move 4 from 3 to 7
move 1 from 4 to 6
move 9 from 5 to 3
move 7 from 3 to 4
move 7 from 7 to 3
move 7 from 4 to 1
move 8 from 3 to 5
move 1 from 3 to 5
move 3 from 8 to 2
move 2 from 2 to 9
move 13 from 9 to 4
move 5 from 5 to 3
move 4 from 7 to 6
move 1 from 7 to 4
move 2 from 4 to 2
move 3 from 3 to 4
move 2 from 5 to 2
move 6 from 1 to 7
move 1 from 2 to 8
move 1 from 3 to 8
move 1 from 1 to 6
move 1 from 3 to 4
move 1 from 2 to 6
move 24 from 6 to 1
move 3 from 2 to 3
move 3 from 3 to 5
move 2 from 8 to 6
move 2 from 5 to 4
move 3 from 5 to 1
move 7 from 4 to 8
move 3 from 8 to 9
move 2 from 9 to 5
move 2 from 6 to 3
move 1 from 9 to 8
move 5 from 7 to 5
move 2 from 3 to 1
move 1 from 7 to 1
move 7 from 4 to 7
move 2 from 4 to 8
move 6 from 8 to 6
move 3 from 6 to 9
move 10 from 5 to 1
move 7 from 7 to 1
move 1 from 4 to 9
move 1 from 6 to 3
move 2 from 9 to 7
move 1 from 4 to 2
move 1 from 9 to 5
move 1 from 8 to 5
move 39 from 1 to 8
move 1 from 2 to 5
move 2 from 6 to 9
move 3 from 9 to 5
move 3 from 1 to 6
move 1 from 7 to 2
move 1 from 3 to 2
move 2 from 6 to 2
move 3 from 2 to 3
move 1 from 6 to 2
move 1 from 1 to 8
move 3 from 1 to 2
move 3 from 2 to 4
move 2 from 4 to 5
move 2 from 3 to 8
move 8 from 5 to 2
move 8 from 8 to 2
move 15 from 2 to 7
move 1 from 1 to 5
move 25 from 8 to 7
move 2 from 2 to 4
move 2 from 4 to 3
move 1 from 8 to 4
move 2 from 4 to 6
move 1 from 2 to 1
move 26 from 7 to 2
move 15 from 2 to 1
move 7 from 8 to 9
move 10 from 1 to 6
move 10 from 7 to 2
move 1 from 8 to 1
move 5 from 9 to 8
move 1 from 8 to 9
move 2 from 6 to 9
move 3 from 7 to 1
move 1 from 7 to 1
move 5 from 9 to 2
move 1 from 3 to 1
move 9 from 6 to 3
move 1 from 6 to 1
move 4 from 2 to 4
move 3 from 4 to 8
move 1 from 4 to 1
move 9 from 3 to 1
move 1 from 7 to 6
move 9 from 2 to 5
move 14 from 1 to 6
move 1 from 3 to 8
move 5 from 2 to 6
move 8 from 1 to 8
move 6 from 6 to 8
move 14 from 6 to 7
move 1 from 1 to 7
move 10 from 5 to 4
move 11 from 8 to 5
move 15 from 7 to 1
move 4 from 5 to 6
move 4 from 8 to 9
move 6 from 5 to 3
move 1 from 6 to 9
move 1 from 1 to 6
move 1 from 5 to 8
move 2 from 6 to 2
move 6 from 1 to 5
move 1 from 5 to 8
move 2 from 5 to 4
move 9 from 2 to 9
move 13 from 9 to 8
move 1 from 2 to 1
move 1 from 4 to 8
move 3 from 3 to 1
move 2 from 4 to 5
move 2 from 1 to 5
move 1 from 9 to 3
move 17 from 8 to 1
move 3 from 3 to 2
move 4 from 5 to 1
move 2 from 2 to 4
move 1 from 6 to 1
move 1 from 2 to 8
move 4 from 4 to 6
move 1 from 5 to 9
move 5 from 6 to 8
move 1 from 5 to 4
move 1 from 5 to 6
move 3 from 8 to 6
move 8 from 4 to 5
move 32 from 1 to 7
move 11 from 7 to 6
move 8 from 5 to 3
move 3 from 8 to 7
move 6 from 3 to 9
move 4 from 3 to 8
move 5 from 8 to 2
move 1 from 8 to 5
move 11 from 6 to 3
move 1 from 5 to 2
move 2 from 8 to 6
move 12 from 7 to 8
move 2 from 6 to 2
move 2 from 6 to 4
move 5 from 2 to 5
move 8 from 7 to 2
move 2 from 7 to 1
move 2 from 7 to 6
move 5 from 5 to 4
move 5 from 4 to 7
move 5 from 8 to 2
move 2 from 9 to 7
move 5 from 8 to 4
move 2 from 7 to 3
move 2 from 9 to 3
move 3 from 7 to 9
move 1 from 1 to 8
move 2 from 6 to 1
move 2 from 9 to 8
move 1 from 7 to 8
move 1 from 2 to 5
move 1 from 7 to 9
move 7 from 4 to 3
move 3 from 3 to 6
move 5 from 8 to 6
move 3 from 9 to 5
move 16 from 3 to 1
move 2 from 9 to 1
move 7 from 1 to 8
move 1 from 1 to 2
move 5 from 8 to 2
move 12 from 1 to 4
move 1 from 3 to 5
move 1 from 2 to 9
move 1 from 9 to 4
move 4 from 6 to 5
move 5 from 6 to 1
move 1 from 6 to 5
move 1 from 1 to 4
move 1 from 4 to 7
move 1 from 3 to 7
move 9 from 4 to 6
move 2 from 7 to 8
move 1 from 3 to 4
move 2 from 8 to 9
move 4 from 8 to 4
move 4 from 2 to 8
move 2 from 9 to 7
move 2 from 7 to 8
move 10 from 2 to 4
move 1 from 2 to 1
move 5 from 4 to 7
move 1 from 1 to 3
move 3 from 8 to 7
move 6 from 7 to 2
move 3 from 2 to 7
move 1 from 6 to 7
move 5 from 5 to 8
move 4 from 1 to 3
move 4 from 3 to 1
move 8 from 4 to 2
move 1 from 3 to 2
move 2 from 7 to 2
move 2 from 6 to 3
move 4 from 7 to 2
move 4 from 5 to 7
move 14 from 2 to 7
move 3 from 2 to 1
move 3 from 8 to 2
move 1 from 5 to 7
move 6 from 2 to 4
move 2 from 2 to 7
move 2 from 3 to 6
move 6 from 8 to 2
move 4 from 6 to 4
move 2 from 6 to 9
move 4 from 4 to 2
move 2 from 4 to 8
move 10 from 7 to 2
move 18 from 2 to 6
move 2 from 2 to 6
move 2 from 9 to 2
move 2 from 8 to 5
move 1 from 2 to 9
move 1 from 2 to 9
move 1 from 5 to 7
move 1 from 2 to 6
move 2 from 9 to 2
move 6 from 7 to 3
move 7 from 6 to 8
move 5 from 7 to 2
move 1 from 7 to 4
move 1 from 5 to 7
move 4 from 8 to 7
move 5 from 2 to 3
move 1 from 7 to 5
move 2 from 2 to 8
move 9 from 4 to 3
move 13 from 6 to 8
move 10 from 3 to 1
move 1 from 5 to 2
move 3 from 6 to 8
move 5 from 1 to 2
move 1 from 1 to 8
move 2 from 4 to 3
move 17 from 8 to 6
move 5 from 6 to 3
move 3 from 1 to 2
move 9 from 6 to 5
move 2 from 6 to 8
move 5 from 5 to 9
move 3 from 9 to 8
move 3 from 1 to 3
move 3 from 7 to 5
move 6 from 5 to 8
move 7 from 2 to 4
move 1 from 6 to 3
move 1 from 1 to 5
move 4 from 4 to 5
move 2 from 2 to 9
move 3 from 1 to 3
move 4 from 5 to 8
move 1 from 4 to 5
move 6 from 8 to 7
move 1 from 5 to 2
move 4 from 9 to 2
move 2 from 5 to 9
move 2 from 1 to 8
move 2 from 4 to 9
move 6 from 7 to 5
move 3 from 5 to 2
move 3 from 2 to 5
move 10 from 8 to 3
move 2 from 8 to 5
move 3 from 2 to 5
move 6 from 5 to 1
move 4 from 5 to 6
move 1 from 7 to 5
move 23 from 3 to 7
move 2 from 5 to 9
move 2 from 1 to 5
move 2 from 6 to 3
move 6 from 3 to 1
move 1 from 1 to 7
move 4 from 3 to 1
move 1 from 8 to 5
move 2 from 9 to 2
move 3 from 3 to 8
move 2 from 6 to 8
move 12 from 1 to 3
move 1 from 9 to 7
move 3 from 5 to 9
move 9 from 3 to 8
move 1 from 1 to 7
move 1 from 9 to 4
move 3 from 3 to 6
move 3 from 2 to 1
move 3 from 8 to 6
move 1 from 4 to 2
move 1 from 2 to 9
move 1 from 2 to 7
move 20 from 7 to 5
move 3 from 7 to 3
move 3 from 1 to 3
move 5 from 8 to 1
move 5 from 1 to 5
move 4 from 5 to 2
move 3 from 2 to 6
move 3 from 8 to 7
move 1 from 2 to 6
move 2 from 8 to 6
move 2 from 7 to 5
move 2 from 3 to 6
move 12 from 5 to 1
move 6 from 5 to 7
move 12 from 6 to 8
move 4 from 9 to 3
move 4 from 5 to 8
move 3 from 1 to 5
move 4 from 7 to 4
move 3 from 5 to 9
move 7 from 1 to 6
move 1 from 1 to 3
move 6 from 7 to 6
move 1 from 1 to 3
move 10 from 3 to 6
move 10 from 6 to 2
move 2 from 9 to 5
move 4 from 6 to 5
move 9 from 6 to 1
move 16 from 8 to 7
move 3 from 8 to 7
move 1 from 8 to 1
move 7 from 2 to 1
move 1 from 5 to 9
move 1 from 6 to 1
move 2 from 2 to 1
move 3 from 1 to 4
move 1 from 6 to 8
move 7 from 4 to 1
move 1 from 8 to 2
move 22 from 1 to 8
move 18 from 7 to 9
move 6 from 5 to 2
move 2 from 2 to 7
move 2 from 1 to 5
move 4 from 7 to 6
move 1 from 5 to 6
move 2 from 8 to 2
move 3 from 2 to 6
move 1 from 5 to 6
move 15 from 9 to 6
move 6 from 9 to 5
move 1 from 9 to 8
move 1 from 2 to 9
move 5 from 5 to 9
move 9 from 8 to 6
move 3 from 2 to 7
move 12 from 8 to 9
move 1 from 7 to 5
move 1 from 5 to 7
move 3 from 7 to 1
move 17 from 6 to 3
move 1 from 2 to 6
move 2 from 1 to 4
move 16 from 6 to 4
move 7 from 4 to 6
move 1 from 5 to 7
move 8 from 4 to 5
move 9 from 9 to 8
move 16 from 3 to 7
move 1 from 1 to 5
move 3 from 5 to 1
move 5 from 6 to 2
move 3 from 1 to 7
move 3 from 6 to 7
move 3 from 9 to 3
move 5 from 8 to 5
move 11 from 5 to 7
move 2 from 3 to 7
move 1 from 2 to 1
move 1 from 3 to 6
move 17 from 7 to 9
move 1 from 3 to 2
move 3 from 4 to 6
move 1 from 1 to 2
move 1 from 6 to 4
move 14 from 7 to 6
move 15 from 9 to 6
move 4 from 8 to 7
move 1 from 4 to 7
move 7 from 9 to 5
move 5 from 2 to 9
move 7 from 5 to 1
move 3 from 1 to 7
move 29 from 6 to 4
move 1 from 2 to 4
move 18 from 4 to 2
move 3 from 1 to 4
move 1 from 1 to 7
move 18 from 2 to 4
move 3 from 6 to 5
move 15 from 4 to 1
move 1 from 5 to 1
move 1 from 5 to 4
move 9 from 4 to 1
move 5 from 1 to 3
move 9 from 1 to 5
move 2 from 4 to 3
move 5 from 5 to 6
move 3 from 7 to 9
move 7 from 7 to 5
move 6 from 4 to 6
move 2 from 3 to 7
move 6 from 5 to 8
move 2 from 8 to 4
move 1 from 8 to 9
move 9 from 6 to 2
move 3 from 9 to 3
move 1 from 2 to 1
move 6 from 7 to 4
move 2 from 2 to 8
move 3 from 9 to 5
move 5 from 4 to 8
move 1 from 6 to 9
move 1 from 3 to 1
move 1 from 3 to 4
move 1 from 6 to 5
move 1 from 9 to 3
move 10 from 8 to 7
move 3 from 9 to 2
move 7 from 2 to 4
move 6 from 5 to 7
move 4 from 5 to 8
move 7 from 3 to 2
move 3 from 7 to 1
move 9 from 1 to 5
move 5 from 7 to 9
move 7 from 1 to 4
move 11 from 4 to 2
move 4 from 8 to 3
move 5 from 4 to 7
move 4 from 4 to 1
move 1 from 3 to 6
move 12 from 7 to 4
move 2 from 1 to 8
move 5 from 9 to 7
move 7 from 5 to 6
move 1 from 1 to 4
move 1 from 9 to 8
move 1 from 4 to 7
move 1 from 8 to 9
move 5 from 7 to 9
move 2 from 7 to 5
move 2 from 6 to 3
move 5 from 2 to 7
move 1 from 7 to 8
move 1 from 1 to 6
move 3 from 5 to 1
]]))
