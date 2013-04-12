From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: upstream kernel 3.8.5: tegra_defconfig not working on Seco QSeven
 QuadMo747-X/T20
Date: Fri, 12 Apr 2013 09:31:57 -0600
Message-ID: <516828ED.4090403@wwwdotorg.org>
References: <1039301365682542@web29e.yandex.ru> <1365687847.1938.1.camel@antimon> <5166D633.8060308@wwwdotorg.org> <1688621365751094@web10f.yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1688621365751094-5488f72fhnJxpj1cXAZ9Bg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikhail Goryunov <gormih78-o+MxOtu4lMCHXe+LvDLADg@public.gmane.org>
Cc: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/12/2013 01:18 AM, Mikhail Goryunov wrote:
> 11.04.2013, 19:26, "Stephen Warren" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>:
>> On 04/11/2013 07:44 AM, Lucas Stach wrote:
>>> Am Donnerstag, den 11.04.2013, 16:15 +0400 schrieb Mikhail Goryunov:
>>>> When building the kernel with the option tegra_defconfig loading occurs in the following way:
...
>>>> Starting kernel ...
>>>>
>>>> and system freezes
>>> ... You may also want to enable the
>>> earlyconsole support in the kernel to see if it comes up at all.
>>
>> ie enable the following Kconfig options:
>>
>> CONFIG_DEBUG_LL=y
>> CONFIG_EARLY_PRINTK=y
>> CONFIG_TEGRA_DEBUG_UART_XXX=y
>>
>> (where XXX above is the serial port you're using; look in menuconfig)
>>
>> and add "earlyprintk" to the kernel command-line. That should hopefully
>> show the cause of the crash/hang.
>>
>> BTW, what is your kernel command-line?

> These options are enabled.
> The argument "earlyprintk" gave no result.
> My command-line for kernel:
> 'root=/dev/sda2 rw rootwait console=ttyS0,115200n8 earlyprintk mem=384M@0M mem=512M@512M nvmem=128M@384M vmalloc=248M nohdparm noinitrd init=/sbin/init rootwait loglevel=8 video=tegrafb'

Many of those options are only useful for downstream kernels. Some may
be harmful for upstream kernels.

I suggest you try the following simplified command-line:

root=/dev/sda2 rw rootwait console=ttyS0,115200n8 earlyprintk
init=/sbin/init loglevel=8

Just to confirm:

a) You're using a pure upstream 3.8 kernel with no modifications. If
not, what modifications have been made?

b) You have written a device tree for your board, and are passing that
to the kernel.

c) When flashing the bootlaoder, you set the ODMDATA to correctly
specify the RAM size and serial console UART. Perhaps you can get away
with specifying the wrong console UART if you pick an explicit
CONFIG_TEGRA_DEBUG_UART_XXX, rather than the AUTO_ODMDATA option.

d) You're using a bootloader that understands device tree, and you're
passing both the zImage and DT address to "bootm" or "bootz", and the
bootloader is filling in the correct parameters in the /memory and
/chosen (for command-line) nodes.

BTW, I just noticed the following in your previous message:

> Image Type: PowerPC Linux Kernel Image (uncompressed)

That's certainly wrong...
