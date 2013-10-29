From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 3/3] clk: tegra: Properly setup PWM clock on Tegra30
Date: Tue, 29 Oct 2013 13:45:38 -0600
Message-ID: <52701062.30405@wwwdotorg.org>
References: <1383061872-27899-1-git-send-email-treding@nvidia.com> <1383061872-27899-3-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383061872-27899-3-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/29/2013 09:51 AM, Thierry Reding wrote:
> The clock for the PWM controller is slightly different from other
> peripheral clocks on Tegra30. The clock source mux field start at
> bit position 28 rather than 30.

I think you need to CC this series to Mike Turquette and relevant lists
for review. While Peter is sending pull requests to Mike for the Tegra
clock driver, Mike still needs to see the patches before that happens.

> diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c

> @@ -836,7 +837,6 @@ static struct tegra_clk tegra30_clks[tegra_clk_max] __initdata = {
>  	[tegra_clk_extern1] = { .dt_id = TEGRA30_CLK_EXTERN1, .present = true },
>  	[tegra_clk_extern2] = { .dt_id = TEGRA30_CLK_EXTERN2, .present = true },
>  	[tegra_clk_extern3] = { .dt_id = TEGRA30_CLK_EXTERN3, .present = true },
> -	[tegra_clk_pwm] = { .dt_id = TEGRA30_CLK_PWM, .present = true },

I think you still need an entry in this table; isn't it used by the
DT->internal clock ID translation function?

Either way, it seems like this patch might want to add a
tegra_clk_pwm_tegra30 so that the common C files can still implement
this clock, just with different parameters?
