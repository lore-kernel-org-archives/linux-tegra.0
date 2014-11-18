From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v5 01/14] clk: tegra124: Remove old emc clock
Date: Tue, 18 Nov 2014 13:23:17 -0800
Message-ID: <20141118212317.25314.65898@quantum>
References: <1416312860-4446-1-git-send-email-tomeu.vizoso@collabora.com>
 <1416312860-4446-2-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1416312860-4446-2-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, mikko.perttunen@kapsi.fi, acourbot@nvidia.com, Mikko Perttunen <mperttunen@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Tomeu Vizoso (2014-11-18 04:13:03)
> From: Mikko Perttunen <mperttunen@nvidia.com>
> 
> This clock has never been able to do anything.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>

Looks good to me.

Regards,
Mike

> 
> ---
> 
> v2:     * Don't remove emc_mux as it's being used by the MC clock now
> ---
>  drivers/clk/tegra/clk-tegra124.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
> index f5f9bac..07ec882 100644
> --- a/drivers/clk/tegra/clk-tegra124.c
> +++ b/drivers/clk/tegra/clk-tegra124.c
> @@ -790,7 +790,6 @@ static struct tegra_clk tegra124_clks[tegra_clk_max] __initdata = {
>         [tegra_clk_i2c2] = { .dt_id = TEGRA124_CLK_I2C2, .present = true },
>         [tegra_clk_uartc] = { .dt_id = TEGRA124_CLK_UARTC, .present = true },
>         [tegra_clk_mipi_cal] = { .dt_id = TEGRA124_CLK_MIPI_CAL, .present = true },
> -       [tegra_clk_emc] = { .dt_id = TEGRA124_CLK_EMC, .present = true },
>         [tegra_clk_usb2] = { .dt_id = TEGRA124_CLK_USB2, .present = true },
>         [tegra_clk_usb3] = { .dt_id = TEGRA124_CLK_USB3, .present = true },
>         [tegra_clk_vde_8] = { .dt_id = TEGRA124_CLK_VDE, .present = true },
> -- 
> 1.9.3
> 
