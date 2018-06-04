#include<stdarg.h>

#define NORETURN            __attribute__((noreturn))
#define EXTERN_C            extern "C"

void printf(const char *format,...)
{
    unsigned syscall_index = 0; 
    va_list args;
    va_start(args,format);
    void *p_args = &args;
    asm volatile (
        "   mov %%esp, %%ecx    ;"
        "   mov $1f, %%edx      ;"
        "   sysenter            ;"
        "1:                     ;"
        : "+a" (syscall_index) : "S" (format),"D" (p_args) : "ecx", "edx");

}


EXTERN_C   NORETURN
void main_func ()
{
    printf("%s NOVA,%d","ECNU",2018);
    while (1) ;
}


