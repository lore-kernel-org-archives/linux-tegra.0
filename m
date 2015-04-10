From: Michael Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v8 01/18] clk: tegra124: Remove old emc clock
Date: Fri, 10 Apr 2015 14:13:33 -0700
Message-ID: <20150410211333.14369.10202@quantum>
References: <1426171746-26864-1-git-send-email-tomeu.vizoso@collabora.com>
 <1426171746-26864-2-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426171746-26864-2-git-send-email-tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mikko Perttunen <mikko.perttunen-/1wQRMveznE@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Quoting Tomeu Vizoso (2015-03-12 07:47:53)
> From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> This clock has never been able to do anything.
> 
> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>

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
> index 9a893f2..d370134 100644
> --- a/drivers/clk/tegra/clk-tegra124.c
> +++ b/drivers/clk/tegra/clk-tegra124.c
> @@ -791,7 +791,6 @@ static struct tegra_clk tegra124_clks[tegra_clk_max] __initdata = {
>         [tegra_clk_i2c2] = { .dt_id = TEGRA124_CLK_I2C2, .present = true },
>         [tegra_clk_uartc] = { .dt_id = TEGRA124_CLK_UARTC, .present = true },
>         [tegra_clk_mipi_cal] = { .dt_id = TEGRA124_CLK_MIPI_CAL, .present = true },
> -       [tegra_clk_emc] = { .dt_id = TEGRA124_CLK_EMC, .present = true },
>         [tegra_clk_usb2] = { .dt_id = TEGRA124_CLK_USB2, .present = true },
>         [tegra_clk_usb3] = { .dt_id = TEGRA124_CLK_USB3, .present = true },
>         [tegra_clk_vde_8] = { .dt_id = TEGRA124_CLK_VDE, .present = true },
> -- 
> 2.1.0
> 
