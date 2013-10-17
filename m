From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v4 00/15] Introduce common infra for tegra clocks
Date: Thu, 17 Oct 2013 09:58:41 -0600
Message-ID: <52600931.1020803@wwwdotorg.org>
References: <1382013674-12901-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1382013674-12901-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/17/2013 06:41 AM, Peter De Schrijver wrote:
> This patchset introduces common infrastructure for clocks which exist=
 in
> several Tegra SoCs. We also also move Tegra20, Tegra30 and Tegra114 t=
o
> this new infrastructure.

This series, and the other series "[PATCH v3 0/7] Tegra124 clock suppor=
t",

Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Patch 1 in this series also (or the whole lot if you want),
Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

There are some ifdef issues though, which should be fixed before
actually applying this:

tegra_defconfig builds fine.

tegra_defconfig minus CONFIG_ARCH_TEGRA_114_SOC yields:

> drivers/clk/tegra/clk-pll.c:1734:12: error: =91clk_pll_iddq_enable=92=
 undeclared here (not in a function)
> drivers/clk/tegra/clk-pll.c:1735:13: error: =91clk_pll_iddq_disable=92=
 undeclared here (not in a function)
> drivers/clk/tegra/clk-pll.c:1737:16: error: =91clk_pll_ramp_round_rat=
e=92 undeclared here (not in a function)
> drivers/clk/tegra/clk-pll.c:1738:14: error: =91clk_pllxc_set_rate=92 =
undeclared here (not in a function)
> drivers/clk/tegra/clk-pll.c: In function =91tegra_clk_register_pllss=92=
:
> drivers/clk/tegra/clk-pll.c:1781:2: error: implicit declaration of fu=
nction =91_clip_vco_min=92 [-Werror=3Dimplicit-function-declaration]
> drivers/clk/tegra/clk-pll.c:1785:2: error: implicit declaration of fu=
nction =91_pll_fixed_mdiv=92 [-Werror=3Dimplicit-function-declaration]

(Thanks for Aaron Plattner for pointing that out)

Can you please double-check all 15 valid combinations of
CONFIG_ARCH_TEGRA_xx_SOC to make sure they all build.
