/* 8100/0.c using curses */
/* https://github.com/gittub/ncurses/doc/ncurses-intro.doc */
#include <curses.h>
#include <signal.h>

extern void exit(int);
static void z(int s);

int
main(int argc, char* argv[])
{
  int a = 0;

  /* time to do our stuff, here */

  (void) signal(SIGINT, z); /* prepare our exit */

  (void) initscr();         /* CURSES things    */
  keypad(stdscr, TRUE);     /* TRUE convenience */
  (void) nonl();            /* not s,NL,CR NL,  */
  (void) cbreak();          /* char direct      */
  (void) echo();            /* let's see this   */
  if (has_colors())
  {
    start_color();
    init_pair(1, COLOR_RED, COLOR_BLACK);
    init_pair(2, COLOR_GREEN, COLOR_BLACK);
    init_pair(3, COLOR_YELLOW, COLOR_BLACK);
    init_pair(4, COLOR_BLUE,   COLOR_BLACK);
    init_pair(5, COLOR_CYAN,   COLOR_BLACK);
    init_pair(6, COLOR_MAGENTA, COLOR_BLACK);
    init_pair(7, COLOR_WHITE,   COLOR_BLACK);
   }

   for (;;) 
   {
     int b = getch();
     attrset(COLOR_PAIR(a % 8));
     a++;

     /* do our thing, given the key */
   }

   z(0);                     /* if ever here, exit */
}

static void z(int a)
{
  endwin();

  /* our own cleaning, now */

  exit(0);

}
