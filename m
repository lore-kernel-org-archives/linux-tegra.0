From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Multi-platform, and secure-only ARM errata workarounds
Date: Tue, 26 Feb 2013 11:01:30 -0700
Message-ID: <512CF87A.4090404@wwwdotorg.org>
References: <512BF81A.3080700@wwwdotorg.org> <201302261023.26939.arnd@arndb.de> <20130226113538.GS17833@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130226113538.GS17833-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02/26/2013 04:35 AM, Russell King - ARM Linux wrote:
> On Tue, Feb 26, 2013 at 10:23:26AM +0000, Arnd Bergmann wrote:
>> On Monday 25 February 2013, Stephen Warren wrote:
>>> Is there any other alternative I'm not seeing? Having the kernel
>>> suddenly become incompatible with any currently extant bootloader when I
>>> enable CONFIG_MULTIPLATFORM doesn't seem like a great idea.
>>
>> Could we make those errata be run-time enabled only when not booting
>> in secure mode?
> 
> The long and the short answer to this is... no.
> 
> 1. It is impossible to tell whether we're running secure or non-secure.
> 
> 2. Errata need to be applied before the MMU is initialized.  We need the
>    MMU to be initialized to run any C code what so ever, so calling out
>    to platform specific code to set errata is not possible.  Moreover,
>    we no longer determine the platform in the assembly code since DT
>    came along: this was removed because detecting it in DT from assembly
>    is far from trivial (you'd need to write an assembly DT parser).
> 
> Now, as for having the secure mode errata enabled on a kernel running in
> non-secure mode... what happens today is that we check whether something
> before the kernel has enabled the workaround, and we omit to write to
> the register.
> 
> What that means is that we expect whatever came before the kernel to have
> appropriately enabled the bits in the secure registers.  If it hasn't,
> and you have one of these secure mode workarounds enabled, the kernel
> will fault at boot time.

The conditional in that statement makes me wonder which of the following
operations will fault in non-secure mode:

1) Reading from the diagnostic register.

2) Writing to the diagnostic register, of a value the same as what's
already there.

3) Writing to the diagnostic register, of a value different than what's
already there.

Would the following not fault in both secure and non-secure mode:

read diagnostic register
if desired bit already set:
    b 1f
set desired bit
write value back to diagnostic register
1:

If so, that would allow a multi-SoC kernel to keep the errata workaround
enabled, and allow the kernel to apply the WAR /if/ booted in secure
mode, but require the errata to be previously enabled if the kernel was
not booted in secure mode.
