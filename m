From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v5 13/15] clk: tegra: introduce common gen4 super clock
Date: Fri, 18 Oct 2013 17:16:16 -0700
Message-ID: <CAL1qeaEpemA5ekC2qzNfQKOkjAiWU3oYp4kwmdup1s1dOjAUNA@mail.gmail.com>
References: <1382102719-5531-1-git-send-email-pdeschrijver@nvidia.com>
	<1382102719-5531-14-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1382102719-5531-14-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Peter,

> +#define PLL_BASE_LOCK BIT(27)
> +#define PLL_MISC_LOCK_ENABLE 18

I don't see these used anywhere.

> +static const char *cclk_lp_parents[] = { "clk_m", "pll_c", "clk_32k", "pll_m",
> +                                        "pll_p", "pll_p_out4", "unused",
> +                                        "unused", "pll_x", "pll_x_out0" };

nit: insert blank line here.

> +static void __init tegra_sclk_init(void __iomem *clk_base,
> +                               struct tegra_clk *tegra_clks)
> +{

Thanks,
Andrew
