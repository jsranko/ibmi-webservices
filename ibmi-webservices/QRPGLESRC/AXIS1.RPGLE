000001190719**FREE
000002190719            ctl-opt pgminfo(*pcml:*module:*dclcase) dftactgrp(*no) bnddir('SIIIWS') DFTNAME(CLIENTR);
000003190719            // ********************************************************************
000004190719            //                                                                    *
000005190719            //                   IBM Web Services Client for ILE                  *
000006190719            //                                                                    *
000007190719            //   FILE NAME:      client.RPGLE                                     *
000008190719            //                                                                    *
000009190719            //   DESCRIPTION:    Source to do REST request using transport APIs   *
000010190719            //                                                                    *
000011190719            // ********************************************************************
000012190719            //  LICENSE AND DISCLAIMER                                            *
000013190719            //  ----------------------                                            *
000014190719            //  This material contains IBM copyrighted sample programming source  *
000015190719            //  code ( Sample Code ).                                             *
000016190719            //  IBM grants you a nonexclusive license to compile, link, execute,  *
000017190719            //  display, reproduce, distribute and prepare derivative works of    *
000018190719            //  this Sample Code.  The Sample Code has not been thoroughly        *
000019190719            //  tested under all conditions.  IBM, therefore, does not guarantee  *
000020190719            //  or imply its reliability, serviceability, or function. IBM        *
000021190719            //  provides no program services for the Sample Code.                 *
000022190719            //                                                                    *
000023190719            //  All Sample Code contained herein is provided to you "AS IS"       *
000024190719            //  without any warranties of any kind. THE IMPLIED WARRANTIES OF     *
000025190719            //  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND             *
000026190719            //  NON-INFRINGMENT ARE EXPRESSLY DISCLAIMED.                         *
000027190719            //  SOME JURISDICTIONS DO NOT ALLOW THE EXCLUSION OF IMPLIED          *
000028190719            //  WARRANTIES, SO THE ABOVE EXCLUSIONS MAY NOT APPLY TO YOU.  IN NO  *
000029190719            //  EVENT WILL IBM BE LIABLE TO ANY PARTY FOR ANY DIRECT, INDIRECT,   *
000030190719            //  SPECIAL OR OTHER CONSEQUENTIAL DAMAGES FOR ANY USE OF THE SAMPLE  *
000031190719            //  CODE INCLUDING, WITHOUT LIMITATION, ANY LOST PROFITS, BUSINESS    *
000032190719            //  INTERRUPTION, LOSS OF PROGRAMS OR OTHER DATA ON YOUR INFORMATION  *
000033190719            //  HANDLING SYSTEM OR OTHERWISE, EVEN IF WE ARE EXPRESSLY ADVISED OF *
000034190719            //  THE POSSIBILITY OF SUCH DAMAGES.                                  *
000035190719            //                                                                    *
000036190719            //   <START_COPYRIGHT>                                                *
000037190719            //                                                                    *
000038190719            //   Licensed Materials - Property of IBM                             *
000039190719            //                                                                    *
000040190719            //   5770-SS1                                                         *
000041190719            //                                                                    *
000042190719            //   (c) Copyright IBM Corp. 2016, 2016                               *
000043190719            //   All Rights Reserved                                              *
000044190719            //                                                                    *
000045190719            //   U.S. Government Users Restricted Rights - use,                   *
000046190719            //   duplication or disclosure restricted by GSA                      *
000047190719            //   ADP Schedule Contract with IBM Corp.                             *
000048190719            //                                                                    *
000049190719            //   Status: Version 1 Release 0                                      *
000050190719            //   <END_COPYRIGHT>                                                  *
000051190719            //                                                                    *
000052190719            // ********************************************************************
000053190719
000054190719            /COPY /QIBM/ProdData/OS/WebServices/V1/client/include/Axis.rpgleinc
000055190719
000056190719            DCL-S rc         INT(10);
000057190719            DCL-S tHandle    POINTER;
000058190719
000059190719            DCL-S uri        CHAR(200);
000060190719            DCL-S response   CHAR(32768);
000062190719            DCL-S propBuf    CHAR(100);
000064190719            DCL-S bytesRead  INT(10) inz(0);
000065190719
000066190719            // --------------------------------------------------------------------
000067190719            //  Web service logic. The code will attempt to invoke a Web service.
000068190719            // --------------------------------------------------------------------
000069190719
000070190719            // Uncomment to enable trace
000071190719            axiscAxisStartTrace('axistransport.log': *NULL);
000072190719
000073190719            // Set URI in order to delete student
000074190719            uri = 'http://webservicesforibmi.azurewebsites.net/displayRequest?x=1'+ x'00';
000075190719
000076190719            // Create HTTP transport handle.
000077190719            tHandle = axiscTransportCreate(uri:AXISC_PROTOCOL_HTTP11);
000078190719            if (tHandle = *NULL);
000079190719              return;
000080190719            endif;
000081190719
000082190719            propBuf = 'GET' + X'00';
000083190719            axiscTransportSetProperty(tHandle: AXISC_PROPERTY_HTTP_METHOD: %addr(propBuf));
000084190719
000085190719            // Flush data so request is sent
000086190719            rc = axiscTransportFlush(tHandle);
000087190719            if (rc = -1);
000089190719              return;
000090190719            endif;
000091190719
000092190719            // Receive data and print out data and response to stdout
000093190719            rc = axiscTransportReceive(tHandle: %ADDR(response): %SIZE(response): 0);
000094190719            if (rc = 0);
000095190719              dsply ('Error');
000096190719            else;
000104190719            endif;
000105190719
000106190719
000109190719            // Cleanup handle.
000110190719            axiscTransportDestroy(tHandle);
000111190719
000114190719
000154190719            *INLR=*ON;
000155190719            Return;
000156190719
