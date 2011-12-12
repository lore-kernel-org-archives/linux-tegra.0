From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v6 04/10] arm/tegra: prepare early init for multiple
 tegra variants
Date: Sun, 11 Dec 2011 16:17:03 -0800
Message-ID: <20111212001703.GA26598@quad.lixom.net>
References: <1323348254-29072-1-git-send-email-pdeschrijver@nvidia.com>
 <1323348254-29072-5-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1323348254-29072-5-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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
Cc: Gary King <gking-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Dec 08, 2011 at 02:43:47PM +0200, Peter De Schrijver wrote:
> This patch splits the early init code in a common and a tegra20 specific part.
> L2 cache initialization is generalized and discovers the cache associativity
> at runtime. Also use arm_pm_restart instead of arm_arch_reset and reset the
> the system using the PMC reset feature rather then the CAR system reset.
> 
> Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/mach-tegra/board-dt.c        |   10 +++++---
>  arch/arm/mach-tegra/board-harmony.c   |    2 +-
>  arch/arm/mach-tegra/board-paz00.c     |    2 +-
>  arch/arm/mach-tegra/board-seaboard.c  |    6 ++--
>  arch/arm/mach-tegra/board-trimslice.c |    2 +-
>  arch/arm/mach-tegra/board.h           |    2 +-
>  arch/arm/mach-tegra/clock.c           |    5 ----
>  arch/arm/mach-tegra/common.c          |   34 ++++++++++++++++++++------------
>  8 files changed, 34 insertions(+), 29 deletions(-)
> 
> diff --git a/arch/arm/mach-tegra/board-dt.c b/arch/arm/mach-tegra/board-dt.c
> index 6a460a2..ef9843c 100644
> --- a/arch/arm/mach-tegra/board-dt.c
> +++ b/arch/arm/mach-tegra/board-dt.c
> @@ -133,7 +133,8 @@ static void __init tegra_dt_init(void)
>  		"Unknown platform! Pinmuxing not initialized\n");
>  }
>  
> -static const char * tegra_dt_board_compat[] = {
> +#ifdef CONFIG_ARCH_TEGRA_2x_SOC
> +static const char *tegra20_dt_board_compat[] = {
>  	"compulab,trimslice",
>  	"nvidia,harmony",
>  	"compal,paz00",
> @@ -142,13 +143,14 @@ static const char * tegra_dt_board_compat[] = {
>  	NULL
>  };
>  
> -DT_MACHINE_START(TEGRA_DT, "nVidia Tegra (Flattened Device Tree)")
> +DT_MACHINE_START(TEGRA_DT, "nVidia Tegra20 (Flattened Device Tree)")
>  	.map_io		= tegra_map_common_io,
> -	.init_early	= tegra_init_early,
> +	.init_early	= tegra20_init_early,
>  	.init_irq	= tegra_dt_init_irq,
>  	.handle_irq	= gic_handle_irq,
>  	.timer		= &tegra_timer,
>  	.init_machine	= tegra_dt_init,
>  	.restart	= tegra_assert_system_reset,
> -	.dt_compat	= tegra_dt_board_compat,
> +	.dt_compat	= tegra20_dt_board_compat,
>  MACHINE_END
> +#endif

As previously mentioned by Stephen, please split up in separate
patches.

But also, I would prefer to see one board-dt for tegra20 and one for
tegra30 (board-dt-t20 and board-dt-t30, or whatnot). They wouldn't be
sharing much code anyway, I would rather see a limited amount of code
duplication than excessive ifdefs in one file.


-Olof
