From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2] clk: tegra: Make gr2d and gr3d clocks children of
 pll_c
Date: Wed, 3 Apr 2013 07:39:22 +0300
Message-ID: <515BB27A.20503@nvidia.com>
References: <1364912324-5576-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1364912324-5576-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02.04.2013 17:18, Thierry Reding wrote:
> By default these clocks are children of pll_m, but in downstream kernels
> they are reparented to pll_c. While at it, decrease their frequencies to
> 300 MHz because the defaults aren't in the specified range.
> 
> gr2d can reportedly run at much higher frequencies, but 300 MHz works
> and is a more conservative default.
> 
> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> ---
> Changes in v2:
> - make the same changes for Tegra30
> 
>  drivers/clk/tegra/clk-tegra20.c | 2 ++
>  drivers/clk/tegra/clk-tegra30.c | 2 ++
>  2 files changed, 4 insertions(+)
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
> diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
> index ba6f51b..b8b241d 100644
> --- a/drivers/clk/tegra/clk-tegra30.c
> +++ b/drivers/clk/tegra/clk-tegra30.c
> @@ -1911,6 +1911,8 @@ static __initdata struct tegra_clk_init_table init_table[] = {
>  	{disp1, pll_p, 600000000, 0},
>  	{disp2, pll_p, 600000000, 0},
>  	{twd, clk_max, 0, 1},
> +	{gr2d, pll_c, 300000000, 0},
> +	{gr3d, pll_c, 300000000, 0},
>  	{clk_max, clk_max, 0, 0}, /* This MUST be the last entry. */
>  };
>  
> 

Thanks, looks good.

Acked-By: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Terje
