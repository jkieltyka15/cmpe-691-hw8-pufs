/**
 * File: puf-metric.c
 *
 * Implementation for PUF performance metrics.
 */

#include <stdio.h>
#include <stdint.h>
#include <string.h>

#define FILE_NAME_TEMPLATE "%s/PUF%d_out.txt"

#define CHALLENGES   16
#define PUFS         8
#define MONTE_CARLOS 8

int main(int argc, char* argv[]) {

    double sum_of_hd_over_n = 0;
    double inter_hamming_distance = 0;

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

    // intra hamming distance
    fprintf(metric_file, "Intra Hamming Distance:\n");
    for (int i = 0; MONTE_CARLOS > i; i++) {

        int m = CHALLENGES - 1;
        double result = 0;
        sum_of_hd_over_n = 0;

        for (int j = 0; (CHALLENGES - 1) > j; j++) {

            int hd = 0;

            for (int z = 0; PUFS > z; z++) {
                if (puf[i][j][z] != puf[i][j][z+1]) {
                    hd++;
                }
            }
            sum_of_hd_over_n += ((double)hd / (double)PUFS);
        }

        result = (100 / (double)m) * sum_of_hd_over_n;
        fprintf(metric_file, "PUF %d: %f %%\n", i + 1, result);
    }
    fprintf(metric_file, "\n");

    // uniformity
    fprintf(metric_file, "Uniformity:\n");
    for (int i = 0; MONTE_CARLOS > i; i++) {

        double result = 0;
        int hw_sum = 0;

        for (int j = 0; CHALLENGES > j; j++) {
            for (int z = 0; PUFS > z; z++) {
                if (1 == puf[i][j][z]) {
                    hw_sum++;
                }
            }
        }

        result = (double)hw_sum / ((double)PUFS * (double)CHALLENGES) * 100;
        fprintf(metric_file, "PUF %d: %f %%\n", i + 1, result);
    }
    fprintf(metric_file, "\n");

    // inter hamming distance
    sum_of_hd_over_n = 0;
    for (int i = 0; MONTE_CARLOS - 1 > i; i++) {

        for (int j = i + 1; MONTE_CARLOS > j; j++) {

            for (int z = 0; CHALLENGES > z; z++) {

                int hd = 0;

                for (int y = 0; PUFS > y; y++) {
                    if (puf[i][z][y] != puf[j][z][y]) {
                        hd++;
                    }
                }

                sum_of_hd_over_n += ((double)hd / (double)PUFS);
            }
        }
    }
    inter_hamming_distance = (2 * 100 * sum_of_hd_over_n) / (CHALLENGES * (MONTE_CARLOS * (MONTE_CARLOS - 1)));
    fprintf(metric_file, "Inter Hamming Distance: %f %%", inter_hamming_distance);

    // clean up
    fclose(metric_file);

    return 0;
}