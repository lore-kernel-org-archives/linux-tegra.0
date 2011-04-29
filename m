From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: Tegra: dt: Compile fix; tegra_common_init
 removed
Date: Fri, 29 Apr 2011 17:25:12 -0600
Message-ID: <20110429232511.GL7497@ponder.secretlab.ca>
References: <1303619404-27604-1-git-send-email-swarren@nvidia.com>
 <1303619404-27604-2-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1303619404-27604-2-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sat, Apr 23, 2011 at 10:30:02PM -0600, Stephen Warren wrote:
> tegra_common_init was removed by:
>   0cf6230af909a86f81907455eca2a5c9b8f68fe6
>   ARM: tegra: Move tegra_common_init to tegra_init_early
> 
> Fix the Tegra devicetree support to match.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Squashed into the "arm/dt: full tegra devicetree support" commit

Thanks!

g.

> ---
>  arch/arm/mach-tegra/board-dt.c |    2 --
>  1 files changed, 0 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-tegra/board-dt.c b/arch/arm/mach-tegra/board-dt.c
> index bc9777e..899311b 100644
> --- a/arch/arm/mach-tegra/board-dt.c
> +++ b/arch/arm/mach-tegra/board-dt.c
> @@ -156,8 +156,6 @@ static void __init tegra_dt_init(void)
>  	 */
>  	of_platform_prepare(NULL, tegra_dt_match_table);
>  
> -	tegra_common_init();
> -
>  	tegra_clk_init_from_table(tegra_dt_clk_init_table);
>  
>  	harmony_pinmux_init();
> -- 
> 1.7.1
> 
