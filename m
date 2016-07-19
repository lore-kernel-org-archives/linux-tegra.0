From: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC 1/6] clk: tegra: add TEGRA20_CLK_NOR to init table
Date: Tue, 19 Jul 2016 15:36:32 +0200
Message-ID: <1468935397-11926-2-git-send-email-mirza.krak@gmail.com>
References: <1468935397-11926-1-git-send-email-mirza.krak@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1468935397-11926-1-git-send-email-mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Add TEGRA20_CLK_NOR to init tabel and set a "sane" default rate.

Signed-off-by: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra20.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index 837e5cb..aefc044 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -1047,6 +1047,7 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA20_CLK_SDMMC3, TEGRA20_CLK_PLL_P, 48000000, 0 },
 	{ TEGRA20_CLK_SDMMC4, TEGRA20_CLK_PLL_P, 48000000, 0 },
 	{ TEGRA20_CLK_SPI, TEGRA20_CLK_PLL_P, 20000000, 0 },
+	{ TEGRA20_CLK_NOR, TEGRA20_CLK_PLL_P, 86500000, 0 },
 	{ TEGRA20_CLK_SBC1, TEGRA20_CLK_PLL_P, 100000000, 0 },
 	{ TEGRA20_CLK_SBC2, TEGRA20_CLK_PLL_P, 100000000, 0 },
 	{ TEGRA20_CLK_SBC3, TEGRA20_CLK_PLL_P, 100000000, 0 },
-- 
2.1.4
