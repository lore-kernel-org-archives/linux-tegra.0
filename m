From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: Tegra: dt: Fix machine desc to match other
 boards.
Date: Fri, 29 Apr 2011 17:35:02 -0600
Message-ID: <20110429233502.GM7497@ponder.secretlab.ca>
References: <1303619404-27604-1-git-send-email-swarren@nvidia.com>
 <1303619404-27604-3-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1303619404-27604-3-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sat, Apr 23, 2011 at 10:30:03PM -0600, Stephen Warren wrote:
> The content of the machine descriptions has be re-organized. Without fixing
> the board-dt.c copy, the system will fail to boot (BUG_ON during timer
> initialization, which happens before printk is operational, leading to a
> silent hang early during kernel boot). Solve this basiclaly by copying the
> existing Harmony version over the copy in board-dt.c
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/mach-tegra/board-dt.c |   11 ++++++-----
>  1 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/mach-tegra/board-dt.c b/arch/arm/mach-tegra/board-dt.c
> index 899311b..7b9d469 100644
> --- a/arch/arm/mach-tegra/board-dt.c
> +++ b/arch/arm/mach-tegra/board-dt.c
> @@ -175,10 +175,11 @@ static const char * tegra_dt_board_compat[] = {
>  };
>  
>  DT_MACHINE_START(TEGRA_DT, "nVidia Tegra (Flattened Device Tree)")
> -	.fixup		= tegra_dt_fixup,

I take it that with memory ranges encoded into the device tree this
fixup is no longer needed?  I'll drop the tegra_dt_fixup() function
from the file too then.

> -	.init_irq	= tegra_init_irq,
> -	.init_machine	= tegra_dt_init,
> -	.map_io		= tegra_map_common_io,
> -	.timer		= &tegra_timer,
> +	.boot_params    = 0x00000100,

boot_params isn't used for dtb boot, so I'll drop this line.

> +	.map_io         = tegra_map_common_io,
> +	.init_early     = tegra_init_early,
> +	.init_irq       = tegra_init_irq,
> +	.timer          = &tegra_timer,
> +	.init_machine   = tegra_dt_init,
>  	.dt_compat	= tegra_dt_board_compat,
>  MACHINE_END

I'll also squash these changes into the clean commit in
devicetree/test.  I'm just building and testing now.

Thanks!
g.
