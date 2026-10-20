"! <p class="shorttext synchronized">Hello World no console do ADT</p>
"! Classe executável (F9 no ADT). Mostra o mínimo de ABAP Cloud:
"! interface IF_OO_ADT_CLASSRUN, string template e APIs liberadas
"! (CL_ABAP_CONTEXT_INFO) no lugar de campos de sistema como SY-UNAME.
CLASS zcl_ib_hello_world DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PRIVATE SECTION.
    METHODS build_greeting
      IMPORTING user_name       TYPE string
      RETURNING VALUE(greeting) TYPE string.
ENDCLASS.


CLASS zcl_ib_hello_world IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA(user_name) = CONV string( cl_abap_context_info=>get_user_technical_name( ) ).
    DATA(today) = cl_abap_context_info=>get_system_date( ).

    out->write( build_greeting( user_name ) ).
    out->write( |Data do sistema: { today DATE = ISO }| ).
    out->write( |Timestamp UTC: { utclong_current( ) TIMESTAMP = ISO }| ).
  ENDMETHOD.


  METHOD build_greeting.
    greeting = |Hello World, { user_name }! Este é o primeiro objeto ABAP Cloud do pacote ZIB_BTP_ABAP_ENV.|.
  ENDMETHOD.

ENDCLASS.
