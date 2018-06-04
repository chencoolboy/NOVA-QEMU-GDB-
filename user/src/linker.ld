OUTPUT_FORMAT("elf32-i386")
OUTPUT_ARCH("i386")
ENTRY(__start)

PHDRS
{
	data    PT_LOAD FLAGS(6);
	text    PT_LOAD FLAGS(5);
}

SECTIONS
{
    . =  0x1000 + SIZEOF_HEADERS;

    .data  :
    {
        BYTE(42);
        . = ALIGN(0x1000);
        stack_top = .;

        *(.data);
        *(.bss);
    } : data

    .text :
    {
        . = ALIGN(0x1000);
        *(.text);
    } : text
}
