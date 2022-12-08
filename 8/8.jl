
function main()
    grid = readlines("input.txt")
    mask = zeros(Int8, length(grid), length(grid[1]))
    
    for rowindex in 1:length(grid)
        row = grid[rowindex]
        for colindex in 1:length(row)
            n = parse(Int, row[colindex])
            #check if n is largest to the left
            if colindex == 1
                mask[rowindex, colindex] = 1
            else
                for k in 1:colindex-1
                    if parse(Int, row[k]) >= n
                        break
                    end
                    if k == colindex-1
                        mask[rowindex, colindex] = 1    
                    end
                end
            end
            
            #check if n is largest to the right
            if colindex == length(row)
                mask[rowindex, colindex] = 1
            else
                for l in colindex+1:length(row)
                    if parse(Int, row[l]) >= n
                        break
                    end
                    if l == length(row)
                        mask[rowindex, colindex] = 1
                    end
                end
            end
            
            #check if n is largest to the top
            if rowindex == 1
                mask[rowindex, colindex] = 1
            else
                for comparatorRowIndex in 1:rowindex-1
                    if parse(Int, grid[comparatorRowIndex][colindex]) >= n
                        break
                    end
                    if comparatorRowIndex == rowindex-1
                        mask[rowindex, colindex] = 1
                    end
                end      
            end
            
            #check if n is largest to the bottom
            if rowindex == length(grid)
                mask[rowindex, colindex] = 1
            else
                for bottomcomparatorRowIndex in rowindex+1:length(grid)
                    if parse(Int, grid[bottomcomparatorRowIndex][colindex]) >= n
                        break
                    end
                    if bottomcomparatorRowIndex == length(grid)
                        mask[rowindex, colindex] = 1
                    end
                end
            end
        end
    end
    
    # display(mask)
    println(count(i->(0<i), collect(mask)))
  end
  
  main()