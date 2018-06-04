.text
.global __start
__start:
    mov $stack_top, %esp
    call main_func
    ud2
