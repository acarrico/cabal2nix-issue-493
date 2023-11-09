#include <HsFFI.h>

void HsToCInit(void)
{
  int argc = 0;
  char *argv[] = { "HsToC", 0};
  char **pargv = argv;
  hs_init(&argc, &pargv);
}

void HsToCExit(void)
{
  hs_exit();
}
