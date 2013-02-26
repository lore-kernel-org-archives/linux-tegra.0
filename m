From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Multi-platform, and secure-only ARM errata workarounds
Date: Tue, 26 Feb 2013 08:07:30 -0600
Message-ID: <512CC1A2.3060704@gmail.com>
References: <512BF81A.3080700@wwwdotorg.org> <201302261023.26939.arnd@arndb.de> <20130226113538.GS17833@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130226113538.GS17833-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02/26/2013 05:35 AM, Russell King - ARM Linux wrote:
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

Only when booting in non-secure mode...

> So, if Stephen has working configs with these secure mode workarounds
> enabled, this means that the bits in the secure registers must already
> be appropriately set.

...and Stephen is booting in secure mode.

> Could the problem be that someone has made all errata workarounds, even
> those which apply after the system is up and running, depend on
> !MULTIPLATFORM ?

I don't think so. All those work-arounds remain and can be enabled.
There was one (430973) which had both a boot time chicken bit setting
and runtime piece. Only the boot time part of it is disabled for multi-plat.

Rob
