From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH V3 1/2] clocksource: add common of_clksrc_init()
 function
Date: Tue, 20 Nov 2012 20:31:05 +0100
Message-ID: <20121120203105.3c54e49f@skate>
References: <1353439206-1654-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1353439206-1654-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: John Stultz <johnstul-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Josh Cartwright <josh.cartwright-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Stephen,

On Tue, 20 Nov 2012 12:20:05 -0700, Stephen Warren wrote:

> It is desirable to move all clocksource drivers to drivers/clocksource,
> yet each requires its own initialization function. We'd rather not
> pollute <linux/> with a header for each function. Instead, create a
> single of_clksrc_init() function which will determine which clocksource
> driver to initialize based on device tree.

Sounds great!

I'm still planning to send irqchip soon, but I've been busy preparing
things for the merge window in the mvebu architecture, which has been
quite active during this cycle.

> +#include <linux/init.h>
> +#include <linux/of.h>
> +
> +extern struct of_device_id *__start_clksrc_of_match_tables[];
> +extern struct of_device_id *__stop_clksrc_of_match_tables[];
> +
> +void __init clocksource_of_init(void)
> +{
> +	struct of_device_id **table;
> +	struct of_device_id **stop;
> +	struct device_node *np;
> +	const struct of_device_id *match;
> +	void (*init_func)(void);
> +
> +	table = __start_clksrc_of_match_tables;
> +	stop = __stop_clksrc_of_match_tables;
> +
> +	for ( ; table < stop; table++) {
> +		for_each_matching_node(np, *table) {
> +			match = of_match_node(*table, np);
> +			init_func = match->data;
> +			init_func();
> +		}
> +	}
> +}

The way I did things for irqchip is a bit different: I used the
standard of_irq_init(), which requires a table that is terminated by a
sentinel. In order to guarantee that I have a sentinel, I did:

#define IRQCHIP_DECLARE(compstr,fn)                             \
        static const struct of_device_id irqchip_of_match       \
        __used __section(.init.irqchip)                         \
        = { .compatible = compstr, .data = fn }

which is used to declare all irq drivers. But then in the main
irqchip.c file, I did:

static const struct of_device_id
irqchip_of_match_end __used __section(.init.irqchip.end);

and my linker script looks like:

        .init.irqchip : {
                __irqchip_begin = .;
                *(.init.irqchip)
                *(.init.irqchip.end)
        }

So I gather all the of_device_id definitions and then the special
sentinel of_device_id. I don't know if it is better than your solution,
or even if my solution is good at all.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
