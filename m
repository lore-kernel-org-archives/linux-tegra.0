From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 10/19] clk: tegra: move audio clk to common file
Date: Tue, 15 Oct 2013 13:13:44 -0600
Message-ID: <525D93E8.1010903@wwwdotorg.org>
References: <1381848794-11761-1-git-send-email-pdeschrijver@nvidia.com> <1381848794-11761-11-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381848794-11761-11-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/15/2013 08:52 AM, Peter De Schrijver wrote:
> Move audio clocks and PLLA initialization to a common file so it can be used by
> multiple Tegra SoCs.

> diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c

> +static struct tegra_clk tegra114_clks[tegra_clk_max] __initdata = {
> +	[tegra_clk_rtc] = { .dt_id = TEGRA114_CLK_RTC, .present = true },
> +	[tegra_clk_timer] = { .dt_id = TEGRA114_CLK_TIMER, .present = true },
> +	[tegra_clk_uarta] = { .dt_id = TEGRA114_CLK_UARTA, .present = true },
...
> @@ -2194,7 +2167,7 @@ static void __init tegra114_clock_init(struct device_node *np)
...
> +	tegra_audio_clk_init(clk_base, pmc_base, tegra114_clks, &pll_a_params);

I think it's worth explaining in the commit description why an array of
not-remotely-audio-related clocks is being passed into an
audio-clock-initialization function.

I see now that it's because not all SoCs have the same set of clocks,
and this table is what tells the common audio code which clocks to
actually create for this SoC, but that wasn't obvious, and hence should
be explicitly described.
