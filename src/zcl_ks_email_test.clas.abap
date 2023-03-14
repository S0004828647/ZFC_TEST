CLASS zcl_ks_email_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
    CLASS-METHODS :    send_email
*      IMPORTING im_sender    TYPE cl_bcs_mail_message=>ty_address
*                im_subject   TYPE cl_bcs_mail_message=>ty_subject
*                im_receipent TYPE cl_bcs_mail_message=>ty_address "tyt_recipient
*                im_body      TYPE string
      .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ks_email_test IMPLEMENTATION.
  METHOD send_email.
    TRY.
        DATA(lo_mail) = cl_bcs_mail_message=>create_instance( ).
        lo_mail->set_sender( 'klaus.schulte@avnet.ceu' ).
        lo_mail->add_recipient( 'klaus.schulte@avnet.com' ).
*    lo_mail->add_recipient( iv_address = 'recipient2@yourcompany.com' iv_copy = cl_bcs_mail_message=>cc ).
        lo_mail->set_subject( 'Test Mail' ).
        lo_mail->set_main( cl_bcs_mail_textpart=>create_text_html( '<h1>Hello</h1><p>This is a test mail.</p>' ) ).
        lo_mail->add_attachment( cl_bcs_mail_textpart=>create_text_plain(
          iv_content      = 'This is a text attachment'
          iv_filename     = 'Text_Attachment.txt'
        ) ).
        lo_mail->add_attachment( cl_bcs_mail_textpart=>create_instance(
          iv_content      = '<note><to>John</to><from>Jane</from><body>My nice XML!</body></note>'
          iv_content_type = 'text/xml'
          iv_filename     = 'Text_Attachment.xml'
        ) ).
        lo_mail->send( IMPORTING et_status = DATA(lt_status) ).
      CATCH cx_bcs_mail INTO DATA(lx_mail).
*    “handle exceptions here
    ENDTRY.
  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.

    send_email( ).

  ENDMETHOD.

ENDCLASS.
