From: Mikhail Goryunov <gormih78-o+MxOtu4lMCHXe+LvDLADg@public.gmane.org>
Subject: upstream kernel 3.8.5: tegra_defconfig not working on Seco QSeven QuadMo747-X/T20
Date: Thu, 11 Apr 2013 16:15:42 +0400
Message-ID: <1039301365682542@web29e.yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

When building the kernel with the option tegra_defconfig loading occurs in the following way:
Loading file "/boot/boot.scr" from usb device 0:1 (usbda1)
319 bytes read
## Executing script at 00408000
USB boot...
Loading file "/boot/uImage" from usb device 0:1 (usbda1)
3733096 bytes read
## Booting kernel from Legacy Image at 04080000 ...
   Image Name:   Linux-3.8.5
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    3733032 Bytes = 3.6 MiB
   Load Address: 00008000
   Entry Point:  00008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...


and system freezes
