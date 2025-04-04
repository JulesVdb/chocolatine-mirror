/*
** EPITECH PROJECT, 2024
** chocolatine-tests
** File description:
** tests.c
*/

#include <criterion/criterion.h>
#include <criterion/redirect.h>
#include "../include/my.h"

void redirect_all(void)
{
    cr_redirect_stdout();
    cr_redirect_stderr();
}

Test(print, print_message_output, .init = redirect_all)
{
    print_message();
    cr_assert_stdout_eq_str("Hello, Chocolatine!\n", "La sortie ne correspond pas à l'attendu");
}
