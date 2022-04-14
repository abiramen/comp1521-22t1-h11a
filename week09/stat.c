#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
 
int main(int argc, char *argv[]) {
    for (int i = 1; i < argc; i++) {
        struct stat s; // This will store a COPY of the metadata
                       // so there is no point modifying it.
        
        if (stat(argv[i], &s) != 0) {
            perror("stat");
            // exit(1);
            return 1;
        }
 
 
        printf("-- file: %s --\n", argv[i]);
 
 
        printf("st_ino = %ld\n", s.st_ino);
        printf("st_mode = %o\n", s.st_mode);
 
        // TODO: How can we check what kind of filesystem object this is?

        // We can use the provided masks in man 7 inode
        // if ((s.st_mode & S_IFMT) == S_IFDIR) {
        //     printf("This is a directory!");
        // } else if ((s.st_mode & S_IFMT) == S_IFREG) {
        //     printf("This is a regular file!");
        // }

        // or we can use the provided macros
        if (S_ISREG(s.st_mode)) {
            printf("This is a regular file");
        } else if (S_ISDIR(s.st_mode)) {
            printf("This is a directory");

        }

        // if (s.st_mode & 0x4) {
        //     printf("The file is publicly readable\n");
        // } else {
        //     printf("The file is not publically readable\n");
        // }

        if (s.st_mode & S_IWUSR) {
            printf("The file is writeable by the user which owns the file\n");
        }


        printf("st_uid = %d\n", s.st_uid);
        printf("st_gid = %d\n", s.st_gid);
        printf("st_size = %ld\n", s.st_size);
        printf("st_blksize = %ld\n", s.st_blksize);
        printf("st_blocks = %ld\n", s.st_blocks);
        printf("st_atime = %ld\n", s.st_atime);
        printf("st_mtime = %ld\n", s.st_mtime);
        printf("st_ctime = %ld\n", s.st_ctime);
        putchar('\n');
    }
}
