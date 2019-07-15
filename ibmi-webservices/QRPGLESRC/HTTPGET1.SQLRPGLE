000100190705**FREE
000101190715ctl-opt dftactgrp(*no) actgrp(*caller);
000102190715
000103190715/include SIIIA/qcpylesrc,systemp
000104190708
000105190715dcl-s WebServiceUrl varchar(256) inz('https://webservicesforibmi.azurewebsites.net/files/earthquake');
000106190715dcl-s FileRef sqltype(clob_file);
000108190715
000116190715FileRef_NAME = 'earthquake.json';
000117190715FileRef_NL = %len(%trim(FileRef_NAME));
000118190715FileRef_FO = SQFOVR;
000119190715
000120190715exec sql set :FileRef = systools.httpgetclob(:WebServiceUrl, '');
000121190715return;
