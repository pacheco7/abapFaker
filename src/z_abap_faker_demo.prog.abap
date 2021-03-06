* See https://github.com/se38/abapFaker

********************************************************************************
* The MIT License (MIT)
*
* Copyright (c) 2018 abapFaker Contributors
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in all
* copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
********************************************************************************

REPORT z_abap_faker_demo.

CLASS app DEFINITION CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS main.

ENDCLASS.

PARAMETERS: p_langu TYPE languageiso,
            p_cntry TYPE char2.

NEW app( )->main( ).

CLASS app IMPLEMENTATION.

  METHOD main.
    cl_demo_output=>new( )->begin_section( |ABAP Faker|
                         )->write( VALUE stringtab( LET faker = NEW zcl_faker( |{ to_lower( p_langu ) }_{ p_cntry }| )
                                                    IN FOR i = 1 UNTIL i > 10
                                                    ( |{ faker->person->name( ) }\n| &&
                                                      |{ faker->address->street_address( ) }\n| &&
                                                      |{ faker->address->city_address( ) }\n\n| &&
                                                      |{ faker->phone->number( ) }\n| &&
                                                      |{ faker->company->company_name( ) }\n| &&
                                                      |{ faker->job->job_title( ) }\n| &&
                                                      |{ sy-uline }| ) )
                         )->display( ).
  ENDMETHOD.

ENDCLASS.
