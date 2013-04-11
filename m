From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: upstream kernel 3.8.5: tegra_defconfig not working on Seco QSeven
 QuadMo747-X/T20
Date: Thu, 11 Apr 2013 09:26:43 -0600
Message-ID: <5166D633.8060308@wwwdotorg.org>
References: <1039301365682542@web29e.yandex.ru> <1365687847.1938.1.camel@antimon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1365687847.1938.1.camel@antimon>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: Mikhail Goryunov <gormih78-o+MxOtu4lMCHXe+LvDLADg@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/11/2013 07:44 AM, Lucas Stach wrote:
> Am Donnerstag, den 11.04.2013, 16:15 +0400 schrieb Mikhail Goryunov:
>> When building the kernel with the option tegra_defconfig loading occurs in the following way:
>> Loading file "/boot/boot.scr" from usb device 0:1 (usbda1)
>> 319 bytes read
>> ## Executing script at 00408000
>> USB boot...
>> Loading file "/boot/uImage" from usb device 0:1 (usbda1)
>> 3733096 bytes read
>> ## Booting kernel from Legacy Image at 04080000 ...
>>    Image Name:   Linux-3.8.5
>>    Image Type:   ARM Linux Kernel Image (uncompressed)
>>    Data Size:    3733032 Bytes = 3.6 MiB
>>    Load Address: 00008000
>>    Entry Point:  00008000
>>    Verifying Checksum ... OK
>>    Loading Kernel Image ... OK
>> OK
>>
>> Starting kernel ...
>>
>>
>> and system freezes
> 
> ... You may also want to enable the
> earlyconsole support in kernel to see if it comes up at all.

i.e. enable the following Kconfig options:

CONFIG_DEBUG_LL=y
CONFIG_EARLY_PRINTK=y
CONFIG_TEGRA_DEBUG_UART_XXX=y

(where XXX above is the serial port you're using; look in menuconfig)

and add "earlyprintk" to the kernel command-line. That should hopefully
show the cause of the crash/hang.

BTW, what is your kernel command-line?
