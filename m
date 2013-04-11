From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: upstream kernel 3.8.5: tegra_defconfig not working on Seco
 QSeven QuadMo747-X/T20
Date: Thu, 11 Apr 2013 15:44:07 +0200
Message-ID: <1365687847.1938.1.camel@antimon>
References: <1039301365682542@web29e.yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1039301365682542-0lqHHmzNcNNxpj1cXAZ9Bg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikhail Goryunov <gormih78-o+MxOtu4lMCHXe+LvDLADg@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am Donnerstag, den 11.04.2013, 16:15 +0400 schrieb Mikhail Goryunov:
> When building the kernel with the option tegra_defconfig loading occurs in the following way:
> Loading file "/boot/boot.scr" from usb device 0:1 (usbda1)
> 319 bytes read
> ## Executing script at 00408000
> USB boot...
> Loading file "/boot/uImage" from usb device 0:1 (usbda1)
> 3733096 bytes read
> ## Booting kernel from Legacy Image at 04080000 ...
>    Image Name:   Linux-3.8.5
>    Image Type:   ARM Linux Kernel Image (uncompressed)
>    Data Size:    3733032 Bytes = 3.6 MiB
>    Load Address: 00008000
>    Entry Point:  00008000
>    Verifying Checksum ... OK
>    Loading Kernel Image ... OK
> OK
> 
> Starting kernel ...
> 
> 
> and system freezes

Do you have a working devicetree for your module? Upstream kernel won't
work without this information. You may also want to enable the
earlyconsole support in kernel to see if it comes up at all.

Also please show what's in your boot script, otherwise it's guesswork
from our side.

Regards,
Lucas
