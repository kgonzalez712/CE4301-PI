import os #script to run the program

#os.system("nasm -felf64 -o 1file.o 1file.asm")
#os.system("ld -o 1file 1file.o")
os.system("./1file")
os.system("chmod +rwx output.txt")
os.system("nasm -felf64 -o program.o program.asm")
os.system("ld -o program program.o")
os.system("./program")
#os.system("gedit readme.txt")
#os.system("gedit output.txt")
os.system("python3 Display.py")
