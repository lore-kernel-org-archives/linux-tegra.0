From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 03/15] clk: tegra: common periph_clk_enb_refcnt and clks
Date: Thu, 17 Oct 2013 15:26:20 -0700
Message-ID: <CAL1qeaFrm50m0a3csY=04MNQENM_DY5fgBrq5bdsm8dHnLj1gA@mail.gmail.com>
References: <1382013526-12800-1-git-send-email-pdeschrijver@nvidia.com>
	<1382013526-12800-4-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1382013526-12800-4-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Peter,

>  static void __init tegra30_clock_init(struct device_node *np)
>  {
>         struct device_node *node;
> -       int i;
>
>         clk_base = of_iomap(np, 0);
>         if (!clk_base) {
> @@ -1916,8 +1910,11 @@ static void __init tegra30_clock_init(struct device_node *np)
>                 BUG();
>         }
>
> -       if (tegra_clk_set_periph_banks(5) < 0)
> +       clks = tegra_clk_init(clk_max, 5);
> +       if (!clks) {
> +               WARN_ON(1);

Really minor nit: it seems strange that we WARN here for t30, but not
for t114 or t20.

Thanks,
Andrew
