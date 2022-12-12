function main()
    grid = readlines("input.txt")
    mask = ones(Int32, length(grid), length(grid[1]))
    
    for rowindex in 1:length(grid)
        row = grid[rowindex]
        println(length(row))
        for colindex in 1:length(row)
            n = parse(Int, row[colindex])
            #check if n is largest to the left
            if colindex == 1
                mask[rowindex, colindex] *= colindex - 1
            else
                for k in colindex-1:-1:1
                    if parse(Int, row[k]) >= n
                        mask[rowindex, colindex] *= (colindex-k)
                        break
                    end
                    if k == 1
                        mask[rowindex, colindex] *= (colindex-k)
                    end
                end
            end
            
            #check if n is largest to the right
            if colindex == length(row)
                mask[rowindex, colindex] *= colindex - length(row)
            else
                for l in colindex+1:length(row)
                    if parse(Int, row[l]) >= n
                        mask[rowindex, colindex] *= (l-colindex)
                        break
                    end
                    if l == length(row)
                        mask[rowindex, colindex] *= (l-colindex)
                    end
                end
            end
            
            #check if n is largest to the top
            if rowindex == 1
                mask[rowindex, colindex] *= (rowindex - 1)
            else
                for comparatorRowIndex in rowindex-1:-1:1
                    if parse(Int, grid[comparatorRowIndex][colindex]) >= n
                      mask[rowindex, colindex] *= rowindex - comparatorRowIndex
                      break
                    elseif comparatorRowIndex == rowindex-1
                      mask[rowindex, colindex] *= rowindex - comparatorRowIndex
                    end
                end      
            end
            
            #check if n is largest to the bottom
            if rowindex == length(grid)
                mask[rowindex, colindex] *= (rowindex - length(grid))
            else
                for bottomcomparatorRowIndex in rowindex+1:length(grid)
                    if parse(Int, grid[bottomcomparatorRowIndex][colindex]) >= n
  
                      mask[rowindex, colindex] *= (bottomcomparatorRowIndex - rowindex)
                      
                      break
                    elseif bottomcomparatorRowIndex == length(grid)
  
                      mask[rowindex, colindex] *= bottomcomparatorRowIndex - rowindex
                    end
                end
            end
        end
    end
    
    display(mask)
    println()
    println(maximum(mask))
  end
  
  main()