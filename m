From: =?koi8-r?B?58/SwM7P1yDtycjBycw=?= <gormih78-o+MxOtu4lMCHXe+LvDLADg@public.gmane.org>
Subject: spidev t20 on 2.6.36.2 kernel problem
Date: Wed, 03 Apr 2013 10:50:37 +0400
Message-ID: <1243821364971837@web10h.yandex.ru>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----==--bound.124383.web10h.yandex.ru"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


------==--bound.124383.web10h.yandex.ru
Content-Transfer-Encoding: 7bit
Content-Type: text/plain

Hello!
BOARD: QuadMo747-X/T20
i get kernel 2.6.36.2 from nvidia tegra partners: Toradex Colibri (http://developer.toradex.com/software-resources/arm-family/linux/source-code/linux-(colibri-t20)-source-code), and SecoQseven (http://www.secoqseven.com/en/download/downloads.html)


I build kernel with option "User mode SPI device support"
Example of my board-harmony.c file in attachment

While 

echo -ne "x5c">/dev/spidev1.1 &  
kernel module interface spi freezes. (bash not responding, and ignore SIGKILL)
if i run spidev_test.c from Documentation/spi folder - process spidev_test freezes




------==--bound.124383.web10h.yandex.ru
Content-Disposition: attachment;
	filename="board-harmony.h"
Content-Transfer-Encoding: base64
Content-Type: text/x-c;
	name="board-harmony.h"

LyoKICogYXJjaC9hcm0vbWFjaC10ZWdyYS9ib2FyZC1oYXJtb255LmgKICoKICogQ29weXJpZ2h0
IChDKSAyMDEwIEdvb2dsZSwgSW5jLgogKgogKiBUaGlzIHNvZnR3YXJlIGlzIGxpY2Vuc2VkIHVu
ZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljCiAqIExpY2Vuc2UgdmVyc2lv
biAyLCBhcyBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgYW5kCiAq
IG1heSBiZSBjb3BpZWQsIGRpc3RyaWJ1dGVkLCBhbmQgbW9kaWZpZWQgdW5kZXIgdGhvc2UgdGVy
bXMuCiAqCiAqIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0
IHdpbGwgYmUgdXNlZnVsLAogKiBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZl
biB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgogKiBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBG
T1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlCiAqIEdOVSBHZW5lcmFsIFB1YmxpYyBM
aWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCiAqCiAqLwoKI2lmbmRlZiBfTUFDSF9URUdSQV9CT0FS
RF9IQVJNT05ZX0gKI2RlZmluZSBfTUFDSF9URUdSQV9CT0FSRF9IQVJNT05ZX0gKCnZvaWQgaGFy
bW9ueV9waW5tdXhfaW5pdCh2b2lkKTsKdm9pZCBoYXJtb255X3Bvd2VyX29mZl9pbml0KHZvaWQp
OwppbnQgaGFybW9ueV9yZWd1bGF0b3JfaW5pdCh2b2lkKTsKaW50IGhhcm1vbnlfcGFuZWxfaW5p
dCh2b2lkKTsKaW50IGhhcm1vbnlfc2RoY2lfaW5pdCh2b2lkKTsKCiNlbmRpZgo=
------==--bound.124383.web10h.yandex.ru--
