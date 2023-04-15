#include <stdio.h>
#include <stdint.h>
#include <string.h>

#define FILE_NAME_TEMPLATE "%s/PUF%d_out.txt"

#define CHALLENGES   16
#define PUFS         8
#define MONTE_CARLOS 8

int main(int argc, char* argv[]) {

    int puf[MONTE_CARLOS][CHALLENGES][PUFS];

    FILE* metric_file = NULL;

    // check for correct number of arguments
    if (3 != argc) 
    {
        perror("Incorrect number of inputs. Expecting: \'./puf-metric <digital puf out directory> <metric file path>\'");
        return 1;
    }

    metric_file = fopen(argv[2], "w");
    if (NULL == metric_file) {
        perror("failed to open metric file");
        return 1;
    }

    // load PUF arrays
    for (int i = 0; MONTE_CARLOS > i; i++) {

        char file_path[128];

        // open digital puf out file
        sprintf(file_path, FILE_NAME_TEMPLATE, argv[1], i + 1);
        FILE* file = fopen(file_path, "r");
        if (NULL == file) {
            perror("failed to open digital puf output file");
            return 1;
        }
        
        // load file into array
        for (int j = 0; CHALLENGES > j; j++) {
            if (PUFS != fscanf(file, "%d %d %d %d %d %d %d %d\n", &puf[i][j][0], &puf[i][j][1],
                &puf[i][j][2], &puf[i][j][3], &puf[i][j][4], &puf[i][j][5], &puf[i][j][6], &puf[i][j][7])) {
                    perror("Failed to parse digital puf out file.");
                }
        }

        // close file
        fclose(file);
    }

    // calculate intra hamming distance

    // clean up
    fclose(metric_file);

    return 0;
}