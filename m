From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V3 1/2] clocksource: add common of_clksrc_init() function
Date: Tue, 20 Nov 2012 12:45:51 -0700
Message-ID: <50ABDDEF.10403@wwwdotorg.org>
References: <1353439206-1654-1-git-send-email-swarren@wwwdotorg.org> <20121120203105.3c54e49f@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121120203105.3c54e49f@skate>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: John Stultz <johnstul-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Josh Cartwright <josh.cartwright-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/20/2012 12:31 PM, Thomas Petazzoni wrote:
> Stephen,
> 
> On Tue, 20 Nov 2012 12:20:05 -0700, Stephen Warren wrote:
> 
>> It is desirable to move all clocksource drivers to drivers/clocksource,
>> yet each requires its own initialization function. We'd rather not
>> pollute <linux/> with a header for each function. Instead, create a
>> single of_clksrc_init() function which will determine which clocksource
>> driver to initialize based on device tree.
...
> The way I did things for irqchip is a bit different: I used the
> standard of_irq_init(), which requires a table that is terminated by a
> sentinel. In order to guarantee that I have a sentinel, I did:
> 
> #define IRQCHIP_DECLARE(compstr,fn)                             \
>         static const struct of_device_id irqchip_of_match       \
>         __used __section(.init.irqchip)                         \
>         = { .compatible = compstr, .data = fn }
> 
> which is used to declare all irq drivers. But then in the main
> irqchip.c file, I did:
> 
> static const struct of_device_id
> irqchip_of_match_end __used __section(.init.irqchip.end);
> 
> and my linker script looks like:
> 
>         .init.irqchip : {
>                 __irqchip_begin = .;
>                 *(.init.irqchip)
>                 *(.init.irqchip.end)
>         }
> 
> So I gather all the of_device_id definitions and then the special
> sentinel of_device_id. I don't know if it is better than your solution,
> or even if my solution is good at all.

That does have the advantage of constructing a single table for all
irqchips, rather than the approach in my patch was to construct an array
of pointers to those tables. Your approach is one less loop at runtime,
and one less sentinel and pointer data item per irqchip. Perhaps I
should convert mine to do the same thing, unless anyone gives feedback
against it.
