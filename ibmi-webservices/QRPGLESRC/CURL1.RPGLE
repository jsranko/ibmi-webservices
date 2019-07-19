000100190705**FREE
000101190715ctl-opt dftactgrp(*no) actgrp(*caller);
000102190715
000103190715/include SIIIA/qcpylesrc,systemp
000104190708
000105190719dcl-s WebServiceUrl varchar(256) inz('http://webservicesforibmi.azurewebsites.net/displayRequest?x=1');
000106190715dcl-s curl varchar(512);
000107190715dcl-s Qsh varchar(512);
000108190715
000109190715curl = 'curl --cacert cacert.pem --output earthquake.json ' + WebServiceUrl;
000110190715Qsh = 'QSH CMD(''' + curl + ''')';
000111190715
000112190715if system(Qsh) = cSystem_Return_Fails;
000114190715  dsply ('CURL error.');
000115190715endif;
000116190715
000117190715return;
