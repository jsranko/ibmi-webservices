000100190715**FREE
000101190715ctl-opt dftactgrp(*no) actgrp(*new);
000102190715
000103190715/include SIIIA/qcpylesrc,systemp
000104190715
000105190715  init();
000106190715
000107190715  if not callPgm('WGET1');
000109190715  endif;
000110190715
000111190715  if not callPgm('CURL1');
000113190715  endif;
000114190715
000115190715  if not callPgm('HTTPGET1');
000116190715  endif;
000117190715
000118190719  if not callPgm('AXIS1');
000119190719  endif;
000120190719
000121190715  return;
000122190715
000123190715// ------------------------------------------------------------------------------------------------------
000124190715//
000125190715// ------------------------------------------------------------------------------------------------------
000126190715dcl-proc init;
000127190715dcl-pi *n;
000128190715end-pi;
000129190715
000133190715  system('ADDENVVAR ENVVAR(QIBM_QSH_CMD_OUTPUT) VALUE(NONE)');
000134190715  system('ADDENVVAR ENVVAR(QIBM_QSH_CMD_ESCAPE_MSG) VALUE(Y)');
000135190715  //system('CLRLIB QTEMP');
000139190715
000140190715end-proc;
000141190715
000142190715// ------------------------------------------------------------------------------------------------------
000143190715//
000144190715// ------------------------------------------------------------------------------------------------------
000145190715dcl-proc callPgm;
000146190715dcl-pi *n ind;
000147190715  Programm char(10) const;
000148190715end-pi;
000149190715dcl-s call varchar(15);
000150190715dcl-s AnzCmd varchar(512);
000151190715
000152190715  call = 'CALL ' + %Trim(Programm);
000153190715  AnzCmd = 'ANZCMDPFR CMD(' + call + ') OUTPUT(*OUTFILE) OUTFILE(QTEMP/ANZCMDPRF) OUTMBR(*FIRST *ADD) ';
000154190715
000155190715  if system(AnzCmd) = cSystem_Return_Fails;
000156190715    return *off;
000157190715  else;
000158190715    return *on;
000159190715  endif;
000160190715
000161190715end-proc;
