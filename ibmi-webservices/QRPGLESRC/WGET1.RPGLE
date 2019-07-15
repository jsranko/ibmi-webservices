000100190705**FREE
000101190715ctl-opt dftactgrp(*no) actgrp(*caller);
000102190715
000103190715/include SIIIA/qcpylesrc,systemp
000104190708
000105190715dcl-s WebServiceUrl varchar(256) inz('https://webservicesforibmi.azurewebsites.net/files/earthquake');
000106190715dcl-s wget varchar(512);
000107190715dcl-s Qsh varchar(512);
000108190715
000109190715wget = 'wget --ca-certificate cacert.pem --output-document earthquake.json ' + WebServiceUrl;
000110190715Qsh = 'QSH CMD(''' + wget + ''')';
000111190715
000112190715if system(Qsh) = cSystem_Return_Fails;
000114190715  dsply ('WGET error.');
000115190715endif;
000116190715
000117190715return;
