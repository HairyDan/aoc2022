import java.io.File

var list = arrayListOf<String>();


fun main(args: Array<String>) {
    println(System.getProperty("user.dir") + File.separator + "input.txt")
    list = readFileAsLinesUsingUseLines(System.getProperty("user.dir") + File.separator + "/input.txt")
    var linesList = arrayListOf<Line>();

    list.map { s -> distinguishLines(s) }.toCollection(linesList)
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


        if (totalSize <= 100000) {
            println(totalSize)

            answeranswer += totalSize
        }
    }

    println(answeranswer)
}

fun readFileAsLinesUsingUseLines(fileName: String): ArrayList<String> =
    File(fileName).useLines { return ArrayList(it.toList()) }

fun distinguishLines(line: String): Line {
    return when {
        line.startsWith("$") -> Line("command", line)
        line.startsWith("dir") -> Line("dir", line)
        else -> Line("file", line)
    }

}

class Line constructor(val type: String, val content: String){
    override fun toString(): String {
        return "type: $type, content: $content"
    }
}

class MyFile constructor(val name: String, val fileSize: Int){
    override fun toString(): String {
        return "name: $name, filesize: $fileSize"
    }
}

