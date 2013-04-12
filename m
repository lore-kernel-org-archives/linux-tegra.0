From: Mikhail Goryunov <gormih78-o+MxOtu4lMCHXe+LvDLADg@public.gmane.org>
Subject: Re: upstream kernel 3.8.5: tegra_defconfig not working on Seco QSeven QuadMo747-X/T20
Date: Fri, 12 Apr 2013 11:18:14 +0400
Message-ID: <1688621365751094@web10f.yandex.ru>
References: <1039301365682542@web29e.yandex.ru> <1365687847.1938.1.camel@antimon> <5166D633.8060308@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5166D633.8060308-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

These options are enabled.
The argument "earlyprintk" gave no result.
My command-line for kernel:
'root=/dev/sda2 rw rootwait console=ttyS0,115200n8 earlyprintk mem=384M@0M mem=512M@512M nvmem=128M@384M vmalloc=248M nohdparm noinitrd init=/sbin/init rootwait loglevel=8 video=tegrafb'


11.04.2013, 19:26, "Stephen Warren" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>:
> On 04/11/2013 07:44 AM, Lucas Stach wrote:
>
>> Am Donnerstag, den 11.04.2013, 16:15 +0400 schrieb Mikhail Goryunov:
>>> When building the kernel with the option tegra_defconfig loading occurs in the following way:
>>> Loading file "/boot/boot.scr" from the usb device 0:1 (usbda1)
>>> 319 bytes read
>>> ## Executing the script at 00408000
>>> USB boot...
>>> Loading file "/boot/uImage" from the usb device 0:1 (usbda1)
>>> 3733096 bytes read
>>> ## Booting kernel from Legacy Image at 04080000 ...
>>> Image Name: Linux-3.8.5
>>> Image Type: PowerPC Linux Kernel Image (uncompressed)
>>> Data Size: 3733032 Bytes = 3.6 MiB
>>> Load Address: 00008000
>>> Entry Point: 00008000
>>> Verifying Checksum ... OK
>>> Loading Kernel Image ... OK
>>> OK
>>>
>>> Starting kernel ...
>>>
>>> and system freezes
>> ... You may also want to enable the
>> earlyconsole support in the kernel to see if it comes up at all.
>
> ie enable the following Kconfig options:
>
> CONFIG_DEBUG_LL=y
> CONFIG_EARLY_PRINTK=y
> CONFIG_TEGRA_DEBUG_UART_XXX=y
>
> (where XXX above is the serial port you're using; look in menuconfig)
>
> and add "earlyprintk" to the kernel command-line. That should hopefully
> show the cause of the crash/hang.
>
> BTW, what is your kernel command-line?
