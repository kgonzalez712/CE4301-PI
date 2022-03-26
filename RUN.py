import os

os.system("./1file")
os.system(" chmod +rwx output.bin")
os.system("nasm -felf64 -o program.o program.asm")
os.system("ld -o program program.o")
os.system("./program")
os.system("gedit readme.txt")
os.system("gedit output.bin")
os.system("python3 Display.py")
