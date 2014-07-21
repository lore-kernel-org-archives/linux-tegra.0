From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: tegra: Convert PMC to a driver
Date: Mon, 21 Jul 2014 15:08:49 -0600
Message-ID: <53CD8161.2030204@wwwdotorg.org>
References: <1404742610-4951-1-git-send-email-thierry.reding@gmail.com> <1404742610-4951-3-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404742610-4951-3-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/07/2014 08:16 AM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> This commit converts the PMC support code to a platform driver. Because
> the boot process needs to call into this driver very early, set up a
> minimalistic environment via an early initcall.

Can we do this without using standalone initcalls? There's no way to
ensure ordering with initcalls, which seems like it'll be problematic
once we start converting more stuff.

Instead, can we have some "driver" that binds to the top-level DT node,
does all the low-/chip-level init, then continues processing the DT? I
suspect that Pawel's "platform: Make platform_bus device a platform
device" will help out here. He just posted it today:

http://www.spinics.net/lists/arm-kernel/msg349328.html

> While at it, also move the driver out to drivers/power so that it can be
> shared with 64-bit SoCs.

>  arch/arm/mach-tegra/pmc.c       | 402 -----------------
>  arch/arm/mach-tegra/powergate.c | 503 ---------------------

>  drivers/power/tegra-pmc.c       | 948 ++++++++++++++++++++++++++++++++++++++++

It's a bit hard to review this patch because two files at the source
were merged into one at the destination, and so "git diff -M" couldn't
detect/represent any changes that happened during the move and highlight
just those. I assume this just cut/pastes the whole of pmc.c and
powergate.c into the new tegra-pmc.c without actually changing anything
much?

I wonder if putting the file into drivers/power/ directly makes sense?
We have "class"-specific sub-directories drivers/power/supply (after
this series) and drives/power/{avs,reset}/ before. Should we have a
drivers/power/domain or drivers/power/soc/? instead?

That said, drivers/soc/tegra still feels fine to me for this code...

Aside from that, at a quick look through, this series looks OK to me.
