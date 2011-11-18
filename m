From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 03/10] arm/tegra: prepare clock code for multiple tegra
 variants
Date: Fri, 18 Nov 2011 11:06:49 -0800
Message-ID: <20111118190649.GB31678@quad.lixom.net>
References: <1321546766-26770-1-git-send-email-pdeschrijver@nvidia.com>
 <1321546766-26770-4-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1321546766-26770-4-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

A nit and two comments below.

On Thu, Nov 17, 2011 at 06:19:17PM +0200, Peter De Schrijver wrote:
> Rework the tegra20 clock code to support multiple tegra variants :
> 
>  * remove tegra2_periph_reset_assert/tegra2_periph_reset_deassert. This
>    functionality should be in clock.c.
>  * compile tegra_sdmmc_tap_delay only on tegra20 as this feature will not
>    be available in future variants.
>  * don't export clk_measure_input_freq as its functionality is also available
>    using clk_get_rate().
> 
> Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/mach-tegra/clock.c         |   14 +++++++++-----
>  arch/arm/mach-tegra/clock.h         |    3 ---
>  arch/arm/mach-tegra/tegra2_clocks.c |   14 +-------------
>  arch/arm/mach-tegra/timer.c         |   12 ++++++++----
>  4 files changed, 18 insertions(+), 25 deletions(-)
> 
> diff --git a/arch/arm/mach-tegra/clock.c b/arch/arm/mach-tegra/clock.c
> index f8d41ff..47f6366 100644
> --- a/arch/arm/mach-tegra/clock.c
> +++ b/arch/arm/mach-tegra/clock.c
> @@ -387,13 +387,15 @@ EXPORT_SYMBOL(tegra_clk_init_from_table);
>  
>  void tegra_periph_reset_deassert(struct clk *c)
>  {
> -	tegra2_periph_reset_deassert(c);
> +	BUG_ON(!c->ops->reset);
> +	c->ops->reset(c, false);
>  }
>  EXPORT_SYMBOL(tegra_periph_reset_deassert);
>  
>  void tegra_periph_reset_assert(struct clk *c)
>  {
> -	tegra2_periph_reset_assert(c);
> +	BUG_ON(!c->ops->reset);
> +	c->ops->reset(c, true);
>  }
>  EXPORT_SYMBOL(tegra_periph_reset_assert);
>  
> @@ -403,10 +405,11 @@ void __init tegra_init_clock(void)
>  }
>  
>  /*
> - * The SDMMC controllers have extra bits in the clock source register that
> - * adjust the delay between the clock and data to compenstate for delays
> - * on the PCB.
> + * The SDMMC controllers on tegra20 have extra bits in the clock source
> + * register that adjust the delay between the clock and data to compenstate
> + * for delays on the PCB.
>   */
> +#ifdef CONFIG_ARCH_TEGRA_2x_SOC
>  void tegra_sdmmc_tap_delay(struct clk *c, int delay)
>  {
>  	unsigned long flags;
> @@ -415,6 +418,7 @@ void tegra_sdmmc_tap_delay(struct clk *c, int delay)
>  	tegra2_sdmmc_tap_delay(c, delay);
>  	spin_unlock_irqrestore(&c->spinlock, flags);
>  }
> +#endif

Ifdeffing this out doesn't quite make sense. Better to do a #ifdef in the
include file with an #else case that fills in an empty function. This
needs to be abstracted differently for the two platforms anyway but
that can be done separately from this. Does tegra3 have tap delay setup
as well? (I don't have the TRM handy right now).

>  
> diff --git a/arch/arm/mach-tegra/clock.h b/arch/arm/mach-tegra/clock.h
> index 688316a..18df129 100644
> --- a/arch/arm/mach-tegra/clock.h
> +++ b/arch/arm/mach-tegra/clock.h
> @@ -146,11 +146,8 @@ struct tegra_clk_init_table {
>  };
>  
>  void tegra2_init_clocks(void);
> -void tegra2_periph_reset_deassert(struct clk *c);
> -void tegra2_periph_reset_assert(struct clk *c);
>  void clk_init(struct clk *clk);
>  struct clk *tegra_get_clock_by_name(const char *name);
> -unsigned long clk_measure_input_freq(void);

This should maybe be done as a separate change, but don't worry about
it this time around.

>  int clk_reparent(struct clk *c, struct clk *parent);
>  void tegra_clk_init_from_table(struct tegra_clk_init_table *table);
>  unsigned long clk_get_rate_locked(struct clk *c);
> diff --git a/arch/arm/mach-tegra/tegra2_clocks.c b/arch/arm/mach-tegra/tegra2_clocks.c
> index 371869d..2ab18f6 100644
> --- a/arch/arm/mach-tegra/tegra2_clocks.c
> +++ b/arch/arm/mach-tegra/tegra2_clocks.c
> @@ -174,7 +174,7 @@ static int tegra_periph_clk_enable_refcount[3 * 32];
>  #define pmc_readl(reg) \
>  	__raw_readl(reg_pmc_base + (reg))
>  
> -unsigned long clk_measure_input_freq(void)
> +static unsigned long clk_measure_input_freq(void)

This has only a single user left, so it can be folded down in that function
instead, especially since there's just two switch statements. That can be done
in a separate change.


-Olof
