import java.io.File
import java.lang.Math.abs

var listPart2 = arrayListOf<String>();


fun main(args: Array<String>) {
    println(System.getProperty("user.dir") + File.separator + "input.txt")
    listPart2 = readFileAsLinesUsingUseLines(System.getProperty("user.dir") + File.separator + "/input.txt")
    var linesList = arrayListOf<Line>();

    listPart2.map { s -> distinguishLines(s) }.toCollection(linesList)
    var map = HashMap<String, MutableList<MyFile>>()
    var currentDir = ""
    var subDirectories = ArrayList<String>()
    for (line in linesList) {
//        println(line.toString())

        if (line.content.startsWith("$ cd ")) {
//            println("command is: ${line.content}")
            println("initial current dir is: $currentDir")
            val dir = line.content.replace("$ cd ", "")
            if (dir.equals("..")) {
                if (currentDir.equals("/")) {
                    currentDir = "/"
                } else if  (currentDir.count { it == '/' } > 1) {
                    currentDir = currentDir.substring(0, currentDir.lastIndexOf("/"))
                }  else {
                    currentDir = "/"
                }
            } else if (dir.equals("/")) {
                currentDir = "/"
            } else {
                if (currentDir.last().equals('/')) {
                    currentDir += dir
                } else {
                    currentDir += "/${dir}"
                }
            }
            println("updated current dir is: $currentDir")

        }
        if (line.type.equals("dir")) {
            var dirFile = MyFile("dirfile", 0)
            if (map.containsKey(currentDir)) {
                var listOfPedos = map[currentDir]
                if (dirFile.name !in listOfPedos!!.map { it.name }) {
                    map[currentDir] = (listOfPedos + dirFile).toMutableList()
                }
            } else {
                map[currentDir] = mutableListOf(dirFile)
            }
        }
        if (line.type.equals("file")) {
            var splitLine = line.content.split(" ")
            var pedoFile = MyFile(splitLine[1], splitLine[0].toInt())
            if (map.containsKey(currentDir)) {
                var listOfPedos = map[currentDir]
                if (pedoFile.name !in listOfPedos!!.map { it.name }) {
                    map[currentDir] = (listOfPedos + pedoFile).toMutableList()
                }
            } else {
                map[currentDir] = mutableListOf(pedoFile)
            }
        }

    }
    var answeranswer: Long = 0
    var spaceNeeded: Long = 0;
    var currentSmallestOver: Long = Long.MAX_VALUE



    var rootsize: Long = 0
    var allApplicable = map.keys
    for (cumkey: String in allApplicable) {
        var fileList = map[cumkey]
        if (fileList != null) {
            for (file in fileList) {
                val size = file.fileSize

                rootsize += size

            }
        }
    }
    println("ROOT DIR SIZE IS: ${rootsize}")
    val freeSpace = 70000000 - rootsize
    spaceNeeded = abs(30000000 - freeSpace)
    println("DELETE FOLDER OF SIZE: $spaceNeeded")






    for ((key, value) in map) {
        var totalSize: Long = 0
        var allApplicable = map.keys.filter { it.startsWith(key)  || it.equals(key) }
        for (cumkey: String in allApplicable) {
            var fileList = map[cumkey]
            if (fileList != null) {
                for (file in fileList) {
                    val size = file.fileSize

                        totalSize += size

                }
            } else {
                println("NULL FILELIST!!!!!!!!!")
            }
        }


        if (key.equals("/")) {

        }


        if (totalSize > spaceNeeded && totalSize < currentSmallestOver) {
            currentSmallestOver = totalSize
        }
        if (totalSize <= 100000) {
            println(totalSize)

            answeranswer += totalSize
        }
    }


    println("DELETE THIS KEY: $currentSmallestOver")
    println(answeranswer)
}
