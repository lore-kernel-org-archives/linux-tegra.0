From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/2] clk: tegra: Make gr2d and gr3d clocks children of
 pll_c
Date: Tue, 2 Apr 2013 12:33:22 +0300
Message-ID: <20130402093321.GY18519@tbergstrom-lnx.Nvidia.com>
References: <1364502688-5135-1-git-send-email-thierry.reding@avionic-design.de>
 <1364502688-5135-2-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1364502688-5135-2-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Mar 28, 2013 at 09:31:28PM +0100, Thierry Reding wrote:
> By default these clocks are children of pll_m, but in downstream kernels
> they are reparented to pll_c. While at it, decrease their frequencies to
> 300 MHz because the defaults aren't in the specified range.
> 
> gr2d can reportedly run at much higher frequencies, but 300 MHz works
> and is a more conservative default.
> 
> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> ---
>  drivers/clk/tegra/clk-tegra20.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
> index bf19400..b020beb 100644
> --- a/drivers/clk/tegra/clk-tegra20.c
> +++ b/drivers/clk/tegra/clk-tegra20.c
> @@ -1247,6 +1247,8 @@ static __initdata struct tegra_clk_init_table init_table[] = {
>  	{host1x, pll_c, 150000000, 0},
>  	{disp1, pll_p, 600000000, 0},
>  	{disp2, pll_p, 600000000, 0},
> +	{gr2d, pll_c, 300000000, 0},
> +	{gr3d, pll_c, 300000000, 0},
>  	{clk_max, clk_max, 0, 0}, /* This MUST be the last entry */
>  };
>  

In the end we should move to a more flexible scheme where the pll_c frequency
is determined by the needs of the various users, but for now this should do I
think.

Acked-By: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Cheers,

Peter.
