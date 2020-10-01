#include <stdio.h>
#include "munit.h"
#include "../BMD/xml_header.h"

#include "../DB-ACCESS/db_connection.h"


#define STRING_SIZE 100
/* 
munit testing
how to run:-
gcc -Wall -I/usr/include/libxml2  -o hi  validate_munit.c ../BMD/validate_request.c ../BMD/xml_parsing.c  -lxml2  `mysql_config --cflags --libs`  ${INCLUDE} munit.c
*/

/* Test setup function creates bmd and returns it 
    *@brief munit testing for :
     * is_bmd_valid 
 */
static void *
is_bmd_valid_setup(const MunitParameter params[], void *user_data)
{
  char *file = "../BMD/Testcases_extract_bmd/bmd.xml";
  bmd* b = (bmd*) malloc (sizeof(bmd));
   b->envelop_value=  extract_envelop(file);
   b->payload= extract_payload(file);
  //bmd *b = parse_bmd_xml(file);
  return b;
}

/* Test function */
static MunitResult
test_is_bmd_valid(const MunitParameter params[], void *fixture)
{
  bmd *test_bmd = (bmd*)fixture;
  /* is_bmd_valid returns 1 if valid */
  munit_assert(is_bmd_valid(test_bmd) == 1);
  return MUNIT_OK;
}

static void
is_bmd_valid_tear_down(void *fixture)
{
  free(fixture);
}
static void *
is_bmd_valid_setup1(const MunitParameter params[], void *user_data)
{
  char *file = "../BMD/Testcases_extract_bmd/bmd1.xml";
  bmd* b = (bmd*) malloc (sizeof(bmd));
  b->envelop_value=  extract_envelop(file);
  b->payload= extract_payload(file);
  return b;
}

/* Test function */
static MunitResult
test_is_bmd_valid1(const MunitParameter params[], void *fixture)
{
  bmd *test_bmd = (bmd *)fixture;
  /* is_bmd_valid returns 1 if valid */
  munit_assert(is_bmd_valid(test_bmd) == 1);
  return MUNIT_OK;
}

static void
is_bmd_valid_tear_down1(void *fixture)
{
  free(fixture);
}
static void *
is_bmd_valid_setup2(const MunitParameter params[], void *user_data)
{
  char *file = "../BMD/Testcases_extract_bmd/bmd2.xml";
  bmd* b = (bmd*) malloc (sizeof(bmd));
   b->envelop_value=  extract_envelop(file);
   b->payload= extract_payload(file);
   return b;
}

/* Test function */
static MunitResult
test_is_bmd_valid2(const MunitParameter params[], void *fixture)
{
  bmd *test_bmd = (bmd*)fixture;
  /* is_bmd_valid returns 1 if valid */
  munit_assert(is_bmd_valid(test_bmd) == 1);
  return MUNIT_OK;
}

static void
is_bmd_valid_tear_down2(void *fixture)
{
  free(fixture);
}

/* Put all unit tests here. */
MunitTest bmd_tests[] = {
    

    {
        "/is_bmd_valid_test",   /* name */
        test_is_bmd_valid,      /* test function */
        is_bmd_valid_setup,     /* setup function for the test */
        is_bmd_valid_tear_down, /* tear_down */
        MUNIT_TEST_OPTION_NONE, /* options */
        NULL                    /* parameters */
    },
    {
    
        "/is_bmd_valid_test1",   /* name */
        test_is_bmd_valid1,      /* test function */
        is_bmd_valid_setup1,     /* setup function for the test */
        is_bmd_valid_tear_down1, /* tear_down */
        MUNIT_TEST_OPTION_NONE, /* options */
        NULL
        },
         {
    
        "/is_bmd_valid_test2",   /* name */
        test_is_bmd_valid2,      /* test function */
        is_bmd_valid_setup2,     /* setup function for the test */
        is_bmd_valid_tear_down2, /* tear_down */
        MUNIT_TEST_OPTION_NONE, /* options */
        NULL
        },
   
    /* Mark the end of the array with an entry where the test
   * function is NULL */
    {NULL, NULL, NULL, NULL, MUNIT_TEST_OPTION_NONE, NULL}};

/* Arrange the test cases into a test suite. */
static const MunitSuite suite = {
    "/bmd_tests",           /* name */
    bmd_tests,              /* tests */
    NULL,                   /* suites */
    1,                      /* iterations */
    MUNIT_SUITE_OPTION_NONE /* options */
};

/* Run the the test suite */
 int main(int argc, const char *argv[])
 {
  return munit_suite_main(&suite, NULL, argc, NULL);
 }

