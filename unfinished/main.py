
import os
import sys
from pathlib import Path
import shutil

# #demos for shutil here:
# # $ mv src dest
# shutil.move('src', 'dest')
# # $ cp src dest
# shutil.copy2('src', 'dest')
# # $ cp -r src dest
# shutil.copytree('src', 'dest')
# # $ rm a_file
# os.remove('a_file')
# # $ rm -r a_dir
# shutil.rmtree('a_dir')
# # $ tar caf 'my_archive.tar.gz' 'my_folder'
# shutil.make_archive('my_archive.tar.gz', 'gztar', 'my_folder')
# # $ tar xaf 'my_archive.tar.gz'
# shutil.unpack_archive('my_archive.tar.gz')
# # chown user:ninjaaron a_file.txt
# shutil.chown('a_file.txt', 'ninjaaron', 'user')
# # info about disk usage, a bit like `df`, but not exactly.
# shutil.disk_usage('.')
# # which vi
# shutil.which('vi')

p = Path()
if(len(sys.argv) == 1):
    print("need to specify one implementation.")
    exit
elif(len(sys.argv)>2):
    print("too many arguments.")
    exit
else:
    if(sys.argv[1] == 'quant'):
        # mv the modified to make the quant client/server binary file.
        shutil.move(p/'extern/instrumentations/quant_client.c', p/'extern/instrumentations/client.c')
        shutil.copy2(p/'extern/instrumentations/client.c', p/'quant/bin/')
        # Makefile
    elif(sys.argv[1] == 'quicly'):
        pass

'''
p = Path()
#p = p.absolute()
print(p.stat())
print(oct(p.stat().st_mode))
readu = p/'hah.txt'
with readu.open(mode='w') as fd:
    fd.writelines('just a test')
readu.chmod(0o777)
'''

# argv[1]:        choose the quic implementation

#choose the quic implementation

#select the instrumented file and replace the original file

#execute the makefile process and generate the binary file

# probably this step should be done by bash instead of Python according to:
# https://github.com/ninjaaron/replacing-bash-scripting-with-python#command-line-interfaces

#remind the user on how to run the measurement

#lots of text on how to get the result