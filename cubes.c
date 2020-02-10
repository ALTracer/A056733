/* cubes.c
 * Searches for integer triples such that
 * sum of their cubes equals to concatenated integers
 * ALTracer,2020
 */
#include <stdint.h>	//uint32_t
#include <stdio.h>	//printf()

void message2 (short a, short b, short c, uint32_t n) {
	printf("%3d^3 + %3d^3 + %3d^3", a, b, c);
	printf(" = %u\n", n);
}

#define POLITE

#ifdef POLITE
/* Global because the handler cannot get them via arguments */
short count = 0;
unsigned int iter = 0;
#include <stdlib.h>	//exit()
#include <signal.h>	//signal()

void message3 (int sig) {
	printf("(Caught SIGINT)\n");
	printf("Exiting early due to user request.\n");
	printf("Found %d triplets in %u iterations.\n",count,iter);
	exit(sig);
}
#endif

int main (int argc, char *argv[]) {
	uint32_t s, n;
#ifndef POLITE
	short count = 0;
	unsigned int iter = 0;
#else
	signal(SIGINT,message3);
#endif
	for (short a=0; a<1000; a++) {
		for (short b=0; b<1000; b++) {
			for (short c=0; c<1000; c++) {
				s = a*a*a + b*b*b + c*c*c;
				n = 1000000*a + 1000*b + c;
				if (s==n) {
					message2(a,b,c,n);
					count++;
				}
				iter++;
//				if (s>1000000000) break;
			}
		}
	}
	printf("Found %d triplets in %u iterations.\n",count,iter);
	return(0);
}
