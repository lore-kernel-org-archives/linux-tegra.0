From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH RFC v2 13/16] ARM: tegra: split tegra_pmc_init() in two
Date: Tue, 27 Aug 2013 15:59:40 -0600
Message-ID: <521D214C.80809@wwwdotorg.org>
References: <1376964271-22715-1-git-send-email-sebastian.hesselbarth@gmail.com> <1377638890-371-14-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1377638890-371-14-git-send-email-sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/27/2013 03:28 PM, Sebastian Hesselbarth wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Tegra's board file currently initializes clocks much earlier than those
> for most other ARM SoCs. The reason is:
> 
> * The PMC HW block is involved in the path of some interrupts (i.e. it
> inverts, or not, the IRQ input pin dedicated to the PMIC).
> 
> * So, that part of the PMC must be initialized early so that the IRQ
> polarity is correct.
> 
> * The PMC initialization is currently monolithic, and the PMC has some
> clock inputs, so the init routine ends up calling of_clk_get_by_name(),
> and hence clocks must be set up early too.
> 
> In order to defer clock initialization to the more typical location,
> split out the portions of tegra_pmc_init() that are truly IRQ-related
> into a separate tegra_pmc_init_irq(), which can be called from the
> machine descriptor's .init_irq() function, and defer the rest until
> the machine descriptor's .init_machine() function. With arch/arm calling
> of_clk_init(NULL) from time_init() this also allows the removal of
> .init_time() hook.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changelog:
> v1->v2:
> - took Stephen Warren's patch provided to separate Tegra's pmc_init
> - sqashed in .init_time removal and reworded patch text

I think it'd be better to keep the 2 patches separate so the two logical
changes are in different patches. I suppose it isn't a huge deal though.

Either way, on this patch, your S-o-b line is missing above.
