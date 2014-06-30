From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC 1/4] ARM: tegra: Move SoC drivers to drivers/soc/tegra
Date: Mon, 30 Jun 2014 12:45:54 -0600
Message-ID: <53B1B062.4070402@wwwdotorg.org>
References: <1403888329-24755-1-git-send-email-thierry.reding@gmail.com> <20140627232757.GB26184@ulmo> <53AEF81D.3080408@ti.com> <5279186.O063V9ZcHh@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5279186.O063V9ZcHh@wuerfel>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/30/2014 01:23 AM, Arnd Bergmann wrote:
> On Saturday 28 June 2014 13:15:09 Santosh Shilimkar wrote:
>>>> For SMP boot, ARMv8 expecting to have either PSCI based implementation or
>>>> device tree based boot scheme. you can move towards that model if possible.
>>>
>>> But we also have the code for SMP on 32-bit ARM. Should that remain in
>>> arch/arm/mach-tegra or can it move to drivers/soc/tegra?
>>>
>> You answered yourself. I don't see any point moving such a code to drivers
>> which is really SMP bring up code for ARM 32 bit. For ARM 64 bit, as
>> outline by maintainers (Catalin, Arnd), you should use PSCI or DT based
>> boot scheme.
> 
> I was hoping that one day we could unify the SMP bootup code with the
> cpuidle infrastructure, as a lot of the underlying functions are shared
> on the majority of SoCs. I have no plans to work on that myself though,
> and it would have to be agreed on by the cpuidle maintainers.
> 
> For ARM64, the hope was indeed to use PSCI for all SoCs. I just have no
> idea how that would be enforced for mobile SoCs that get shipped to
> system integrators with an bootloader and kernel tree that doesn't even
> get reviewed anywhere first.

Indeed, I'm not sure that our downstream kernels use PSCI. There has
been some discussion of that, but I'm not sure that it actually happened
at least on Tegra132. Even if we do use PSCI, it's likely to be
implemented in a binary blob firmware at the moment, which still seems
less palatable to me than putting the code directly into the kernel. If
the upstream mandate is "use PSCI or don't upstream", then given my and
Thierry's limited bandwidth (we are after all only human), we likely
can't port the kernel and write a whole new upstream-specific firmware
just to provide PSCI, so this kinda makes the choice for us...
