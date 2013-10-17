From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 02/15] clk: tegra: simplify periph clock data
Date: Thu, 17 Oct 2013 15:15:43 -0700
Message-ID: <CAL1qeaGg+XdCWSp4yjWTFxXjhj8a+_dFwpT+B_H+GQ_CWZ50-A@mail.gmail.com>
References: <1382013526-12800-1-git-send-email-pdeschrijver@nvidia.com>
	<1382013526-12800-3-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1382013526-12800-3-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Peter,

> @@ -2346,6 +2247,9 @@ static void __init tegra114_clock_init(struct device_node *np)
>         if (tegra114_osc_clk_init(clk_base) < 0)
>                 return;
>
> +       if (tegra_clk_set_periph_banks(5) < 0)

Maybe it would be better to have a #define for this (e.g.
TEGRAxxx_CLK_PERIPH_BANKS)?  Same goes for t20 and t30.

>  /* Global data of Tegra CPU CAR ops */
>  static struct tegra_cpu_car_ops dummy_car_ops;
>  struct tegra_cpu_car_ops *tegra_cpu_car_ops = &dummy_car_ops;
>
> +int *periph_clk_enb_refcnt;

This changes seems unrelated.  Perhaps it should go in the one that
makes the common periph_clk_enb_refcnt?

Thanks,
Andrew
