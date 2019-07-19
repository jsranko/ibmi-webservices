000100190705**FREE
000101190715ctl-opt dftactgrp(*no) actgrp(*caller);
000102190715
000103190715/include SIIIA/qcpylesrc,systemp
000104190708
000105190719dcl-s WebServiceUrl varchar(256) inz('http://webservicesforibmi.azurewebsites.net/displayRequest?x=1');
000106190719dcl-s FileRef sqltype(clob:10000);
000107190719//dcl-s FileRef sqltype(clob_file);
000108190715
000116190719//FileRef_NAME = 'earthquake.json';
000117190719//FileRef_NL = %len(%trim(FileRef_NAME));
000118190719//FileRef_FO = SQFOVR;
000119190715
000120190715exec sql set :FileRef = systools.httpgetclob(:WebServiceUrl, '');
000121190715return;
