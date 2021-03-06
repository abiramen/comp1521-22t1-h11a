/**
 * Write a C program, print_diary.c,
 * which prints the contents of the file $HOME/.diary to stdout.
 * 
 * Be sure to handle any errors!
 * snprintf is a convenient function for constructing the pathname of the diary file.
 */
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
 
#define DIARY_PATH "/.diary"
 
 
int main(void) {
    // $HOME = /home/abiram
    // /home/abiram/.diary

    char *home = getenv("HOME");
    int pathlen = strlen(home) + strlen(DIARY_PATH) + 1;
    char *full_path = malloc(pathlen * sizeof(char));

    snprintf(full_path, pathlen, "%s%s\n", getenv("HOME"), DIARY_PATH);

 
    FILE *stream = fopen(full_path, "r");
    if (stream == NULL) {
        perror(full_path);
        exit(1);
    }
 
    int c;
    while ((c = fgetc(stream)) != EOF) {
        putchar(c);
    }
    
    fclose(stream);
    return 0;
}
