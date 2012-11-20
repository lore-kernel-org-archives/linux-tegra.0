From: Josh Cartwright <josh.cartwright-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 2/2] ARM: tegra: move timer.c to drivers/clocksource/
Date: Mon, 19 Nov 2012 18:50:36 -0600
Message-ID: <20121120005036.GA6280@kryptos>
References: <1353371237-2482-1-git-send-email-swarren@wwwdotorg.org>
 <1353371237-2482-2-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1353371237-2482-2-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: John Stultz <johnstul-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Nov 19, 2012 at 05:27:17PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Move arch/arm/mach-tegra/timer.c to drivers/clocksource/tegra20_timer.c
> so that the code is co-located with other clocksource drivers, and to
> reduce the size of the mach-tegra directory.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> v2: Rebase on ARM sys_timer rework, and addition of clocksource_of_init().
[..]
> diff --git a/drivers/clocksource/clksrc-of.c b/drivers/clocksource/clksrc-of.c
> index aeec8d2..328d18f 100644
> --- a/drivers/clocksource/clksrc-of.c
> +++ b/drivers/clocksource/clksrc-of.c
> @@ -20,6 +20,10 @@
>  #include "clksrc-of.h"
>  
>  static const struct of_device_id clksrc_of_match[] __initconst = {
> +	{
> +		.compatible = "nvidia,tegra20-timer",
> +		.data = tegra20_init_timer,
> +	},

Shouldn't this be wrapped in #if ARCH_TEGRA?

I had suggested this with Thomas Petazzoni's consolidated irq_chip patch
as well:

It seems like it would be a bit cleaner/easier to maintain if we relied
on the linker to stitch together a clksrc_of_match table, based on what
clocksources are being built into the image.  With that approach, at
least, a public initialization header wouldn't have to be exposed, and
this central table wouldn't have to be maintained (as more clocksrcs are
added, I forsee [admittedly trivial] merge conflicts).

Thoughts?

   Josh
