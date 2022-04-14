#include <stdio.h>
#include <spawn.h>
#include <stdlib.h>

int main(void) {
    // call posix_spawn to print date +%d-%m-%Y
    pid_t pid;
    char *date_argv[] = {"+%d-%m-%Y", NULL};
    char *date_envp[] = {NULL};
    if (posix_spawn(&pid, "/usr/bin/date", NULL, NULL, date_argv, date_envp) != 0) {
        perror("posix_spawn");
        exit(1);
    }

    // call posix_spawn to print date +%T

    return 0;
}
