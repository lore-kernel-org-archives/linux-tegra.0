From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 3/3] clk: tegra: Implement Tegra124 shared/cbus clks
Date: Tue, 13 May 2014 17:06:56 +0300
Message-ID: <1399990023-30318-4-git-send-email-pdeschrijver@nvidia.com>
References: <1399990023-30318-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399990023-30318-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add shared and cbus clocks to the Tegra124 clock implementation.

Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra124.c         |   50 +++++++++++++++++++++
 include/dt-bindings/clock/tegra124-car.h |   70 +++++++++++++++++++++++++++++-
 2 files changed, 119 insertions(+), 1 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index cc37c34..4a160e5 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -950,6 +950,16 @@ static struct tegra_clk tegra124_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_clk_out_3_mux] = { .dt_id = TEGRA124_CLK_CLK_OUT_3_MUX, .present = true },
 	[tegra_clk_dsia_mux] = { .dt_id = TEGRA124_CLK_DSIA_MUX, .present = true },
 	[tegra_clk_dsib_mux] = { .dt_id = TEGRA124_CLK_DSIB_MUX, .present = true },
+	[tegra_clk_cap_c2bus] = { .dt_id = TEGRA124_CLK_CAP_C2BUS, .present = true },
+	[tegra_clk_cap_throttle_c2bus] = { .dt_id = TEGRA124_CLK_CAP_THROTTLE_C2BUS, .present = true },
+	[tegra_clk_floor_c2bus] = { .dt_id = TEGRA124_CLK_FLOOR_C2BUS, .present = true },
+	[tegra_clk_override_c2bus] = { .dt_id = TEGRA124_CLK_OVERRIDE_C2BUS, .present = true },
+	[tegra_clk_edp_c2bus] = { .dt_id = TEGRA124_CLK_EDP_C2BUS, .present = true },
+	[tegra_clk_battery_c2bus] = { .dt_id = TEGRA124_CLK_BATTERY_C2BUS, .present = true },
+	[tegra_clk_cap_profile_c2bus] = { .dt_id = TEGRA124_CLK_CAP_PROFILE_C2BUS, .present = true },
+	[tegra_clk_cap_c3bus] = { .dt_id = TEGRA124_CLK_CAP_C3BUS, .present = true },
+	[tegra_clk_cap_throttle_c3bus] = { .dt_id = TEGRA124_CLK_CAP_THROTTLE_C3BUS, .present = true },
+	[tegra_clk_override_c3bus] = { .dt_id = TEGRA124_CLK_OVERRIDE_C3BUS, .present = true },
 };
 
 static struct tegra_devclk devclks[] __initdata = {
@@ -1297,6 +1307,45 @@ static void __init tegra124_pll_init(void __iomem *clk_base,
 
 }
 
+static const char *cbus_parents[] = { "c2bus", "c3bus" };
+
+static __init void tegra124_shared_clk_init(void)
+{
+	struct clk *clk;
+
+	clk = clk_register_cbus("c2bus", "pll_c2", 0, "pll_p", 0,
+					700000000);
+	clk_register_clkdev(clk, "c2bus", NULL);
+	clks[TEGRA124_CLK_C2BUS] = clk;
+
+	clk = clk_register_cbus("c3bus", "pll_c3", 0, "pll_p", 0,
+					700000000);
+	clk_register_clkdev(clk, "c3bus", NULL);
+	clks[TEGRA124_CLK_C3BUS] = clk;
+
+	clk = clk_register_shared("msenc.cbus", &cbus_parents[0], 1, 0, 0,
+					"msenc");
+	clks[TEGRA124_CLK_MSENC_CBUS] = clk;
+
+	clk = clk_register_shared("vde.cbus", &cbus_parents[0], 1, 0, 0,
+					"vde");
+	clks[TEGRA124_CLK_VDE_CBUS] = clk;
+
+	clk = clk_register_shared("se.cbus", &cbus_parents[0], 1, 0, 0,
+					"se");
+	clks[TEGRA124_CLK_SE_CBUS] = clk;
+
+	clk = clk_register_shared("tsec.cbus", &cbus_parents[1], 1, 0, 0,
+					"tsec");
+	clks[TEGRA124_CLK_TSEC_CBUS] = clk;
+
+	clk = clk_register_shared("vic03.cbus", &cbus_parents[1], 1, 0, 0,
+					"vic03");
+	clks[TEGRA124_CLK_VIC03_CBUS] = clk;
+
+	tegra_shared_clk_init(tegra124_clks);
+}
+
 /* Tegra124 CPU clock and reset control functions */
 static void tegra124_wait_cpu_in_reset(u32 cpu)
 {
@@ -1414,6 +1463,7 @@ static void __init tegra124_clock_init(struct device_node *np)
 	tegra124_periph_clk_init(clk_base, pmc_base);
 	tegra_audio_clk_init(clk_base, pmc_base, tegra124_clks, &pll_a_params);
 	tegra_pmc_clk_init(pmc_base, tegra124_clks);
+	tegra124_shared_clk_init();
 
 	tegra_super_clk_gen4_init(clk_base, pmc_base, tegra124_clks,
 					&pll_x_params);
diff --git a/include/dt-bindings/clock/tegra124-car.h b/include/dt-bindings/clock/tegra124-car.h
index 433528a..943d485 100644
--- a/include/dt-bindings/clock/tegra124-car.h
+++ b/include/dt-bindings/clock/tegra124-car.h
@@ -336,6 +336,74 @@
 #define TEGRA124_CLK_DSIA_MUX 309
 #define TEGRA124_CLK_DSIB_MUX 310
 #define TEGRA124_CLK_SOR0_LVDS 311
-#define TEGRA124_CLK_CLK_MAX 312
+#define TEGRA124_CLK_C2BUS 401
+#define TEGRA124_CLK_C3BUS 402
+#define TEGRA124_CLK_GR3D_CBUS 403
+#define TEGRA124_CLK_GR2D_CBUS 404
+#define TEGRA124_CLK_EPP_CBUS 405
+#define TEGRA124_CLK_CAP_C2BUS 406
+#define TEGRA124_CLK_CAP_THROTTLE_C2BUS 407
+#define TEGRA124_CLK_FLOOR_C2BUS 408
+#define TEGRA124_CLK_OVERRIDE_C2BUS 409
+#define TEGRA124_CLK_EDP_C2BUS 410
+#define TEGRA124_CLK_BATTERY_C2BUS 411
+#define TEGRA124_CLK_CAP_PROFILE_C2BUS 412
+#define TEGRA124_CLK_MSENC_CBUS 413
+#define TEGRA124_CLK_TSEC_CBUS 414
+#define TEGRA124_CLK_VDE_CBUS 415
+#define TEGRA124_CLK_SE_CBUS 416
+#define TEGRA124_CLK_CAP_C3BUS 417
+#define TEGRA124_CLK_CAP_THROTTLE_C3BUS 418
+#define TEGRA124_CLK_OVERRIDE_C3BUS 419
+#define TEGRA124_CLK_AVP_SCLK 420
+#define TEGRA124_CLK_BSEA_SCLK 421
+#define TEGRA124_CLK_USBD_SCLK 422
+#define TEGRA124_CLK_USB1_SCLK 423
+#define TEGRA124_CLK_USB2_SCLK 424
+#define TEGRA124_CLK_USB3_SCLK 425
+#define TEGRA124_CLK_WAKE_SCLK 426
+#define TEGRA124_CLK_MON_AVP 427
+#define TEGRA124_CLK_CAP_SCLK 428
+#define TEGRA124_CLK_CAP_THROTTLE_SCLK 429
+#define TEGRA124_CLK_FLOOR_SCLK 430
+#define TEGRA124_CLK_OVERRIDE_SCLK 431
+#define TEGRA124_CLK_SBC1_SCLK 432
+#define TEGRA124_CLK_SBC2_SCLK 433
+#define TEGRA124_CLK_SBC3_SCLK 434
+#define TEGRA124_CLK_SBC4_SCLK 435
+#define TEGRA124_CLK_SBC5_SCLK 436
+#define TEGRA124_CLK_SBC6_SCLK 437
+#define TEGRA124_CLK_SBUS 438
+#define TEGRA124_CLK_EMC_MASTER 439
+#define TEGRA124_CLK_AVP_EMC 440
+#define TEGRA124_CLK_CPU_EMC 441
+#define TEGRA124_CLK_DISP1_EMC 442
+#define TEGRA124_CLK_DISP2_EMC 443
+#define TEGRA124_CLK_HDMI_EMC 444
+#define TEGRA124_CLK_USBD_EMC 445
+#define TEGRA124_CLK_USB1_EMC 446
+#define TEGRA124_CLK_USB2_EMC 447
+#define TEGRA124_CLK_USB3_EMC 448
+#define TEGRA124_CLK_MON_EMC 449
+#define TEGRA124_CLK_GR3D_EMC 450
+#define TEGRA124_CLK_GR2D_EMC 451
+#define TEGRA124_CLK_MSENC_EMC 452
+#define TEGRA124_CLK_TSEC_EMC 453
+#define TEGRA124_CLK_SDMMC4_EMC 454
+#define TEGRA124_CLK_CAMERA_EMC 455
+#define TEGRA124_CLK_ISO_EMC 456
+#define TEGRA124_CLK_FLOOR_EMC 457
+#define TEGRA124_CLK_CAP_EMC 458
+#define TEGRA124_CLK_CAP_THROTTLE_EMC 459
+#define TEGRA124_CLK_EDP_EMC 460
+#define TEGRA124_CLK_BATTERY_EMC 461
+#define TEGRA124_CLK_OVERRIDE_EMC 462
+#define TEGRA124_CLK_GK20A_EMC 463
+#define TEGRA124_CLK_VIC03_EMC 464
+#define TEGRA124_CLK_VIC03_CBUS 465
+#define TEGRA124_CLK_ISPA_EMC 466
+#define TEGRA124_CLK_ISPB_EMC 467
+#define TEGRA124_CLK_XUSB_EMC 468
+#define TEGRA124_CLK_CLK_MAX 469
 
 #endif	/* _DT_BINDINGS_CLOCK_TEGRA124_CAR_H */
-- 
1.7.7.rc0.72.g4b5ea.dirty
