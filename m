From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 2/7] clocksource: Rename CLOCKSOURCE_OF_DECLARE
Date: Sat, 27 May 2017 11:58:43 +0200
Message-ID: <1495879129-28109-2-git-send-email-daniel.lezcano@linaro.org>
References: <1495879129-28109-1-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <1495879129-28109-1-git-send-email-daniel.lezcano@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: tglx@linutronix.de, daniel.lezcano@linaro.org
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:RALINK MIPS ARCHITECTURE" <linux-mips@linux-mips.org>, Baruch Siach <baruch@tkos.co.il>, Heiko Stuebner <heiko@sntech.de>, Neil Armstrong <narmstrong@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Santosh Shilimkar <ssantosh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, "moderated list:ARM/OXNAS platform support" <linux-oxnas@lists.tuxfamily.org>, Patrice Chotard <patrice.chotard@st.com>, Eric Anholt <eric@anholt.net>, Thierry Reding <thierry.reding@gmail.com>, Ingo Molnar <mingo@kernel.org>, "open list:ARM/STI ARCHITECTURE" <kernel@stlinux.com>, Alexandre Courbot <gnurou@gmail.com>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>, Alexander Shiyan <shc>
List-Id: linux-tegra@vger.kernel.org

The CLOCKSOUCE_OF_DECLARE macro is used widely for the timers to declare the
clocksource at early stage. However, this macro is also used to initialize
the clockevent if any, or the clockevent only.

It was originally suggested to declare another macro to initialize a
clockevent, so in order to separate the two entities even they belong to the
same IP. This was not accepted because of the impact on the DT where splitting
a clocksource/clockevent definition does not make sense as it is a Linux
concept not a hardware description.

On the other side, the clocksource has not interrupt declared while the
clockevent has, so it is easy from the driver to know if the description is
for a clockevent or a clocksource, IOW it could be implemented at the driver
level.

So instead of dealing with a named clocksource macro, let's use a more generic
one: TIMER_OF_DECLARE.

The patch has not functional changes.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 arch/arm/kernel/smp_twd.c                 |  6 +++---
 arch/microblaze/kernel/timer.c            |  2 +-
 arch/mips/ralink/cevt-rt3352.c            |  2 +-
 arch/nios2/kernel/time.c                  |  2 +-
 drivers/clocksource/arc_timer.c           |  6 +++---
 drivers/clocksource/arm_arch_timer.c      |  6 +++---
 drivers/clocksource/arm_global_timer.c    |  2 +-
 drivers/clocksource/armv7m_systick.c      |  2 +-
 drivers/clocksource/asm9260_timer.c       |  2 +-
 drivers/clocksource/bcm2835_timer.c       |  2 +-
 drivers/clocksource/bcm_kona_timer.c      |  4 ++--
 drivers/clocksource/cadence_ttc_timer.c   |  2 +-
 drivers/clocksource/clksrc-dbx500-prcmu.c |  2 +-
 drivers/clocksource/clksrc_st_lpc.c       |  2 +-
 drivers/clocksource/clps711x-timer.c      |  2 +-
 drivers/clocksource/dw_apb_timer_of.c     |  8 ++++----
 drivers/clocksource/exynos_mct.c          |  4 ++--
 drivers/clocksource/fsl_ftm_timer.c       |  2 +-
 drivers/clocksource/h8300_timer16.c       |  2 +-
 drivers/clocksource/h8300_timer8.c        |  2 +-
 drivers/clocksource/h8300_tpu.c           |  2 +-
 drivers/clocksource/jcore-pit.c           |  2 +-
 drivers/clocksource/meson6_timer.c        |  2 +-
 drivers/clocksource/mips-gic-timer.c      |  2 +-
 drivers/clocksource/mps2-timer.c          |  2 +-
 drivers/clocksource/mtk_timer.c           |  2 +-
 drivers/clocksource/mxs_timer.c           |  2 +-
 drivers/clocksource/nomadik-mtu.c         |  2 +-
 drivers/clocksource/pxa_timer.c           |  2 +-
 drivers/clocksource/qcom-timer.c          |  4 ++--
 drivers/clocksource/renesas-ostm.c        |  2 +-
 drivers/clocksource/rockchip_timer.c      |  4 ++--
 drivers/clocksource/samsung_pwm_timer.c   |  8 ++++----
 drivers/clocksource/sun4i_timer.c         |  2 +-
 drivers/clocksource/tango_xtal.c          |  2 +-
 drivers/clocksource/tegra20_timer.c       |  4 ++--
 drivers/clocksource/time-armada-370-xp.c  |  6 +++---
 drivers/clocksource/time-efm32.c          |  4 ++--
 drivers/clocksource/time-lpc32xx.c        |  2 +-
 drivers/clocksource/time-orion.c          |  2 +-
 drivers/clocksource/time-pistachio.c      |  2 +-
 drivers/clocksource/timer-atlas7.c        |  2 +-
 drivers/clocksource/timer-atmel-pit.c     |  2 +-
 drivers/clocksource/timer-atmel-st.c      |  2 +-
 drivers/clocksource/timer-digicolor.c     |  2 +-
 drivers/clocksource/timer-fttmr010.c      | 10 +++++-----
 drivers/clocksource/timer-imx-gpt.c       | 24 ++++++++++++------------
 drivers/clocksource/timer-integrator-ap.c |  2 +-
 drivers/clocksource/timer-keystone.c      |  2 +-
 drivers/clocksource/timer-nps.c           |  6 +++---
 drivers/clocksource/timer-oxnas-rps.c     |  4 ++--
 drivers/clocksource/timer-prima2.c        |  2 +-
 drivers/clocksource/timer-sp804.c         |  4 ++--
 drivers/clocksource/timer-stm32.c         |  2 +-
 drivers/clocksource/timer-sun5i.c         |  4 ++--
 drivers/clocksource/timer-ti-32k.c        |  2 +-
 drivers/clocksource/timer-u300.c          |  2 +-
 drivers/clocksource/versatile.c           |  4 ++--
 drivers/clocksource/vf_pit_timer.c        |  2 +-
 drivers/clocksource/vt8500_timer.c        |  2 +-
 drivers/clocksource/zevio-timer.c         |  2 +-
 include/linux/clocksource.h               |  2 +-
 62 files changed, 103 insertions(+), 103 deletions(-)

diff --git a/arch/arm/kernel/smp_twd.c b/arch/arm/kernel/smp_twd.c
index 895ae51..b30eafe 100644
--- a/arch/arm/kernel/smp_twd.c
+++ b/arch/arm/kernel/smp_twd.c
@@ -403,7 +403,7 @@ static int __init twd_local_timer_of_register(struct device_node *np)
 	WARN(err, "twd_local_timer_of_register failed (%d)\n", err);
 	return err;
 }
-CLOCKSOURCE_OF_DECLARE(arm_twd_a9, "arm,cortex-a9-twd-timer", twd_local_timer_of_register);
-CLOCKSOURCE_OF_DECLARE(arm_twd_a5, "arm,cortex-a5-twd-timer", twd_local_timer_of_register);
-CLOCKSOURCE_OF_DECLARE(arm_twd_11mp, "arm,arm11mp-twd-timer", twd_local_timer_of_register);
+TIMER_OF_DECLARE(arm_twd_a9, "arm,cortex-a9-twd-timer", twd_local_timer_of_register);
+TIMER_OF_DECLARE(arm_twd_a5, "arm,cortex-a5-twd-timer", twd_local_timer_of_register);
+TIMER_OF_DECLARE(arm_twd_11mp, "arm,arm11mp-twd-timer", twd_local_timer_of_register);
 #endif
diff --git a/arch/microblaze/kernel/timer.c b/arch/microblaze/kernel/timer.c
index 9990661..873a1cc 100644
--- a/arch/microblaze/kernel/timer.c
+++ b/arch/microblaze/kernel/timer.c
@@ -333,5 +333,5 @@ static int __init xilinx_timer_init(struct device_node *timer)
 	return 0;
 }
 
-CLOCKSOURCE_OF_DECLARE(xilinx_timer, "xlnx,xps-timer-1.00.a",
+TIMER_OF_DECLARE(xilinx_timer, "xlnx,xps-timer-1.00.a",
 		       xilinx_timer_init);
diff --git a/arch/mips/ralink/cevt-rt3352.c b/arch/mips/ralink/cevt-rt3352.c
index b8a1376..92f284d 100644
--- a/arch/mips/ralink/cevt-rt3352.c
+++ b/arch/mips/ralink/cevt-rt3352.c
@@ -152,4 +152,4 @@ static int __init ralink_systick_init(struct device_node *np)
 	return 0;
 }
 
-CLOCKSOURCE_OF_DECLARE(systick, "ralink,cevt-systick", ralink_systick_init);
+TIMER_OF_DECLARE(systick, "ralink,cevt-systick", ralink_systick_init);
diff --git a/arch/nios2/kernel/time.c b/arch/nios2/kernel/time.c
index 6e2bdc9..2954b66 100644
--- a/arch/nios2/kernel/time.c
+++ b/arch/nios2/kernel/time.c
@@ -353,4 +353,4 @@ void __init time_init(void)
 	clocksource_probe();
 }
 
-CLOCKSOURCE_OF_DECLARE(nios2_timer, ALTR_TIMER_COMPATIBLE, nios2_time_init);
+TIMER_OF_DECLARE(nios2_timer, ALTR_TIMER_COMPATIBLE, nios2_time_init);
diff --git a/drivers/clocksource/arc_timer.c b/drivers/clocksource/arc_timer.c
index 2164973..4927355 100644
--- a/drivers/clocksource/arc_timer.c
+++ b/drivers/clocksource/arc_timer.c
@@ -99,7 +99,7 @@ static int __init arc_cs_setup_gfrc(struct device_node *node)
 
 	return clocksource_register_hz(&arc_counter_gfrc, arc_timer_freq);
 }
-CLOCKSOURCE_OF_DECLARE(arc_gfrc, "snps,archs-timer-gfrc", arc_cs_setup_gfrc);
+TIMER_OF_DECLARE(arc_gfrc, "snps,archs-timer-gfrc", arc_cs_setup_gfrc);
 
 #define AUX_RTC_CTRL	0x103
 #define AUX_RTC_LOW	0x104
@@ -158,7 +158,7 @@ static int __init arc_cs_setup_rtc(struct device_node *node)
 
 	return clocksource_register_hz(&arc_counter_rtc, arc_timer_freq);
 }
-CLOCKSOURCE_OF_DECLARE(arc_rtc, "snps,archs-timer-rtc", arc_cs_setup_rtc);
+TIMER_OF_DECLARE(arc_rtc, "snps,archs-timer-rtc", arc_cs_setup_rtc);
 
 #endif
 
@@ -333,4 +333,4 @@ static int __init arc_of_timer_init(struct device_node *np)
 
 	return ret;
 }
-CLOCKSOURCE_OF_DECLARE(arc_clkevt, "snps,arc-timer", arc_of_timer_init);
+TIMER_OF_DECLARE(arc_clkevt, "snps,arc-timer", arc_of_timer_init);
diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
index a1fb918..9a41958 100644
--- a/drivers/clocksource/arm_arch_timer.c
+++ b/drivers/clocksource/arm_arch_timer.c
@@ -1194,8 +1194,8 @@ static int __init arch_timer_of_init(struct device_node *np)
 
 	return arch_timer_common_init();
 }
-CLOCKSOURCE_OF_DECLARE(armv7_arch_timer, "arm,armv7-timer", arch_timer_of_init);
-CLOCKSOURCE_OF_DECLARE(armv8_arch_timer, "arm,armv8-timer", arch_timer_of_init);
+TIMER_OF_DECLARE(armv7_arch_timer, "arm,armv7-timer", arch_timer_of_init);
+TIMER_OF_DECLARE(armv8_arch_timer, "arm,armv8-timer", arch_timer_of_init);
 
 static u32 __init
 arch_timer_mem_frame_get_cntfrq(struct arch_timer_mem_frame *frame)
@@ -1382,7 +1382,7 @@ static int __init arch_timer_mem_of_init(struct device_node *np)
 	kfree(timer_mem);
 	return ret;
 }
-CLOCKSOURCE_OF_DECLARE(armv7_arch_timer_mem, "arm,armv7-timer-mem",
+TIMER_OF_DECLARE(armv7_arch_timer_mem, "arm,armv7-timer-mem",
 		       arch_timer_mem_of_init);
 
 #ifdef CONFIG_ACPI_GTDT
diff --git a/drivers/clocksource/arm_global_timer.c b/drivers/clocksource/arm_global_timer.c
index 123ed20..095bb96 100644
--- a/drivers/clocksource/arm_global_timer.c
+++ b/drivers/clocksource/arm_global_timer.c
@@ -339,5 +339,5 @@ static int __init global_timer_of_register(struct device_node *np)
 }
 
 /* Only tested on r2p2 and r3p0  */
-CLOCKSOURCE_OF_DECLARE(arm_gt, "arm,cortex-a9-global-timer",
+TIMER_OF_DECLARE(arm_gt, "arm,cortex-a9-global-timer",
 			global_timer_of_register);
diff --git a/drivers/clocksource/armv7m_systick.c b/drivers/clocksource/armv7m_systick.c
index a315491..ac046d6 100644
--- a/drivers/clocksource/armv7m_systick.c
+++ b/drivers/clocksource/armv7m_systick.c
@@ -82,5 +82,5 @@ static int __init system_timer_of_register(struct device_node *np)
 	return ret;
 }
 
-CLOCKSOURCE_OF_DECLARE(arm_systick, "arm,armv7m-systick",
+TIMER_OF_DECLARE(arm_systick, "arm,armv7m-systick",
 			system_timer_of_register);
diff --git a/drivers/clocksource/asm9260_timer.c b/drivers/clocksource/asm9260_timer.c
index c678083..38cd2fe 100644
--- a/drivers/clocksource/asm9260_timer.c
+++ b/drivers/clocksource/asm9260_timer.c
@@ -238,5 +238,5 @@ static int __init asm9260_timer_init(struct device_node *np)
 
 	return 0;
 }
-CLOCKSOURCE_OF_DECLARE(asm9260_timer, "alphascale,asm9260-timer",
+TIMER_OF_DECLARE(asm9260_timer, "alphascale,asm9260-timer",
 		asm9260_timer_init);
diff --git a/drivers/clocksource/bcm2835_timer.c b/drivers/clocksource/bcm2835_timer.c
index dce4430..82828d3 100644
--- a/drivers/clocksource/bcm2835_timer.c
+++ b/drivers/clocksource/bcm2835_timer.c
@@ -148,5 +148,5 @@ static int __init bcm2835_timer_init(struct device_node *node)
 	iounmap(base);
 	return ret;
 }
-CLOCKSOURCE_OF_DECLARE(bcm2835, "brcm,bcm2835-system-timer",
+TIMER_OF_DECLARE(bcm2835, "brcm,bcm2835-system-timer",
 			bcm2835_timer_init);
diff --git a/drivers/clocksource/bcm_kona_timer.c b/drivers/clocksource/bcm_kona_timer.c
index fda5e147..5c40be9 100644
--- a/drivers/clocksource/bcm_kona_timer.c
+++ b/drivers/clocksource/bcm_kona_timer.c
@@ -198,9 +198,9 @@ static int __init kona_timer_init(struct device_node *node)
 	return 0;
 }
 
-CLOCKSOURCE_OF_DECLARE(brcm_kona, "brcm,kona-timer", kona_timer_init);
+TIMER_OF_DECLARE(brcm_kona, "brcm,kona-timer", kona_timer_init);
 /*
  * bcm,kona-timer is deprecated by brcm,kona-timer
  * being kept here for driver compatibility
  */
-CLOCKSOURCE_OF_DECLARE(bcm_kona, "bcm,kona-timer", kona_timer_init);
+TIMER_OF_DECLARE(bcm_kona, "bcm,kona-timer", kona_timer_init);
diff --git a/drivers/clocksource/cadence_ttc_timer.c b/drivers/clocksource/cadence_ttc_timer.c
index 44e5e95..a144dfc 100644
--- a/drivers/clocksource/cadence_ttc_timer.c
+++ b/drivers/clocksource/cadence_ttc_timer.c
@@ -539,4 +539,4 @@ static int __init ttc_timer_init(struct device_node *timer)
 	return 0;
 }
 
-CLOCKSOURCE_OF_DECLARE(ttc, "cdns,ttc", ttc_timer_init);
+TIMER_OF_DECLARE(ttc, "cdns,ttc", ttc_timer_init);
diff --git a/drivers/clocksource/clksrc-dbx500-prcmu.c b/drivers/clocksource/clksrc-dbx500-prcmu.c
index c69e277..c1b96dc 100644
--- a/drivers/clocksource/clksrc-dbx500-prcmu.c
+++ b/drivers/clocksource/clksrc-dbx500-prcmu.c
@@ -86,5 +86,5 @@ static int __init clksrc_dbx500_prcmu_init(struct device_node *node)
 #endif
 	return clocksource_register_hz(&clocksource_dbx500_prcmu, RATE_32K);
 }
-CLOCKSOURCE_OF_DECLARE(dbx500_prcmu, "stericsson,db8500-prcmu-timer-4",
+TIMER_OF_DECLARE(dbx500_prcmu, "stericsson,db8500-prcmu-timer-4",
 		       clksrc_dbx500_prcmu_init);
diff --git a/drivers/clocksource/clksrc_st_lpc.c b/drivers/clocksource/clksrc_st_lpc.c
index 03cc492..a1d01eb 100644
--- a/drivers/clocksource/clksrc_st_lpc.c
+++ b/drivers/clocksource/clksrc_st_lpc.c
@@ -132,4 +132,4 @@ static int __init st_clksrc_of_register(struct device_node *np)
 
 	return ret;
 }
-CLOCKSOURCE_OF_DECLARE(ddata, "st,stih407-lpc", st_clksrc_of_register);
+TIMER_OF_DECLARE(ddata, "st,stih407-lpc", st_clksrc_of_register);
diff --git a/drivers/clocksource/clps711x-timer.c b/drivers/clocksource/clps711x-timer.c
index 24db6d6..fc9e025 100644
--- a/drivers/clocksource/clps711x-timer.c
+++ b/drivers/clocksource/clps711x-timer.c
@@ -119,5 +119,5 @@ static int __init clps711x_timer_init(struct device_node *np)
 		return -EINVAL;
 	}
 }
-CLOCKSOURCE_OF_DECLARE(clps711x, "cirrus,ep7209-timer", clps711x_timer_init);
+TIMER_OF_DECLARE(clps711x, "cirrus,ep7209-timer", clps711x_timer_init);
 #endif
diff --git a/drivers/clocksource/dw_apb_timer_of.c b/drivers/clocksource/dw_apb_timer_of.c
index aee6c0d..69866cd 100644
--- a/drivers/clocksource/dw_apb_timer_of.c
+++ b/drivers/clocksource/dw_apb_timer_of.c
@@ -167,7 +167,7 @@ static int __init dw_apb_timer_init(struct device_node *timer)
 
 	return 0;
 }
-CLOCKSOURCE_OF_DECLARE(pc3x2_timer, "picochip,pc3x2-timer", dw_apb_timer_init);
-CLOCKSOURCE_OF_DECLARE(apb_timer_osc, "snps,dw-apb-timer-osc", dw_apb_timer_init);
-CLOCKSOURCE_OF_DECLARE(apb_timer_sp, "snps,dw-apb-timer-sp", dw_apb_timer_init);
-CLOCKSOURCE_OF_DECLARE(apb_timer, "snps,dw-apb-timer", dw_apb_timer_init);
+TIMER_OF_DECLARE(pc3x2_timer, "picochip,pc3x2-timer", dw_apb_timer_init);
+TIMER_OF_DECLARE(apb_timer_osc, "snps,dw-apb-timer-osc", dw_apb_timer_init);
+TIMER_OF_DECLARE(apb_timer_sp, "snps,dw-apb-timer-sp", dw_apb_timer_init);
+TIMER_OF_DECLARE(apb_timer, "snps,dw-apb-timer", dw_apb_timer_init);
diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index 670ff0f..7a244b6 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -610,5 +610,5 @@ static int __init mct_init_ppi(struct device_node *np)
 {
 	return mct_init_dt(np, MCT_INT_PPI);
 }
-CLOCKSOURCE_OF_DECLARE(exynos4210, "samsung,exynos4210-mct", mct_init_spi);
-CLOCKSOURCE_OF_DECLARE(exynos4412, "samsung,exynos4412-mct", mct_init_ppi);
+TIMER_OF_DECLARE(exynos4210, "samsung,exynos4210-mct", mct_init_spi);
+TIMER_OF_DECLARE(exynos4412, "samsung,exynos4412-mct", mct_init_ppi);
diff --git a/drivers/clocksource/fsl_ftm_timer.c b/drivers/clocksource/fsl_ftm_timer.c
index 738515b..3121e2d 100644
--- a/drivers/clocksource/fsl_ftm_timer.c
+++ b/drivers/clocksource/fsl_ftm_timer.c
@@ -369,4 +369,4 @@ static int __init ftm_timer_init(struct device_node *np)
 	kfree(priv);
 	return ret;
 }
-CLOCKSOURCE_OF_DECLARE(flextimer, "fsl,ftm-timer", ftm_timer_init);
+TIMER_OF_DECLARE(flextimer, "fsl,ftm-timer", ftm_timer_init);
diff --git a/drivers/clocksource/h8300_timer16.c b/drivers/clocksource/h8300_timer16.c
index 5b27fb9..dfbd4f8 100644
--- a/drivers/clocksource/h8300_timer16.c
+++ b/drivers/clocksource/h8300_timer16.c
@@ -187,5 +187,5 @@ static int __init h8300_16timer_init(struct device_node *node)
 	return ret;
 }
 
-CLOCKSOURCE_OF_DECLARE(h8300_16bit, "renesas,16bit-timer",
+TIMER_OF_DECLARE(h8300_16bit, "renesas,16bit-timer",
 			   h8300_16timer_init);
diff --git a/drivers/clocksource/h8300_timer8.c b/drivers/clocksource/h8300_timer8.c
index 804c489..f6ffb0c 100644
--- a/drivers/clocksource/h8300_timer8.c
+++ b/drivers/clocksource/h8300_timer8.c
@@ -207,4 +207,4 @@ static int __init h8300_8timer_init(struct device_node *node)
 	return ret;
 }
 
-CLOCKSOURCE_OF_DECLARE(h8300_8bit, "renesas,8bit-timer", h8300_8timer_init);
+TIMER_OF_DECLARE(h8300_8bit, "renesas,8bit-timer", h8300_8timer_init);
diff --git a/drivers/clocksource/h8300_tpu.c b/drivers/clocksource/h8300_tpu.c
index 72e1cf2..45a8d17 100644
--- a/drivers/clocksource/h8300_tpu.c
+++ b/drivers/clocksource/h8300_tpu.c
@@ -154,4 +154,4 @@ static int __init h8300_tpu_init(struct device_node *node)
 	return ret;
 }
 
-CLOCKSOURCE_OF_DECLARE(h8300_tpu, "renesas,tpu", h8300_tpu_init);
+TIMER_OF_DECLARE(h8300_tpu, "renesas,tpu", h8300_tpu_init);
diff --git a/drivers/clocksource/jcore-pit.c b/drivers/clocksource/jcore-pit.c
index 7c61226..5d3d88e0f 100644
--- a/drivers/clocksource/jcore-pit.c
+++ b/drivers/clocksource/jcore-pit.c
@@ -246,4 +246,4 @@ static int __init jcore_pit_init(struct device_node *node)
 	return 0;
 }
 
-CLOCKSOURCE_OF_DECLARE(jcore_pit, "jcore,pit", jcore_pit_init);
+TIMER_OF_DECLARE(jcore_pit, "jcore,pit", jcore_pit_init);
diff --git a/drivers/clocksource/meson6_timer.c b/drivers/clocksource/meson6_timer.c
index 39d21f6..92f2099 100644
--- a/drivers/clocksource/meson6_timer.c
+++ b/drivers/clocksource/meson6_timer.c
@@ -174,5 +174,5 @@ static int __init meson6_timer_init(struct device_node *node)
 					1, 0xfffe);
 	return 0;
 }
-CLOCKSOURCE_OF_DECLARE(meson6, "amlogic,meson6-timer",
+TIMER_OF_DECLARE(meson6, "amlogic,meson6-timer",
 		       meson6_timer_init);
diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
index 3f52ee2..e31e083 100644
--- a/drivers/clocksource/mips-gic-timer.c
+++ b/drivers/clocksource/mips-gic-timer.c
@@ -200,5 +200,5 @@ static int __init gic_clocksource_of_init(struct device_node *node)
 
 	return 0;
 }
-CLOCKSOURCE_OF_DECLARE(mips_gic_timer, "mti,gic-timer",
+TIMER_OF_DECLARE(mips_gic_timer, "mti,gic-timer",
 		       gic_clocksource_of_init);
diff --git a/drivers/clocksource/mps2-timer.c b/drivers/clocksource/mps2-timer.c
index 3e4431e..aa4d63af 100644
--- a/drivers/clocksource/mps2-timer.c
+++ b/drivers/clocksource/mps2-timer.c
@@ -274,4 +274,4 @@ static int __init mps2_timer_init(struct device_node *np)
 	return 0;
 }
 
-CLOCKSOURCE_OF_DECLARE(mps2_timer, "arm,mps2-timer", mps2_timer_init);
+TIMER_OF_DECLARE(mps2_timer, "arm,mps2-timer", mps2_timer_init);
diff --git a/drivers/clocksource/mtk_timer.c b/drivers/clocksource/mtk_timer.c
index 9065949..f9b724f 100644
--- a/drivers/clocksource/mtk_timer.c
+++ b/drivers/clocksource/mtk_timer.c
@@ -265,4 +265,4 @@ static int __init mtk_timer_init(struct device_node *node)
 
 	return -EINVAL;
 }
-CLOCKSOURCE_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_timer_init);
+TIMER_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_timer_init);
diff --git a/drivers/clocksource/mxs_timer.c b/drivers/clocksource/mxs_timer.c
index 99b77af..a03434e 100644
--- a/drivers/clocksource/mxs_timer.c
+++ b/drivers/clocksource/mxs_timer.c
@@ -293,4 +293,4 @@ static int __init mxs_timer_init(struct device_node *np)
 
 	return setup_irq(irq, &mxs_timer_irq);
 }
-CLOCKSOURCE_OF_DECLARE(mxs, "fsl,timrot", mxs_timer_init);
+TIMER_OF_DECLARE(mxs, "fsl,timrot", mxs_timer_init);
diff --git a/drivers/clocksource/nomadik-mtu.c b/drivers/clocksource/nomadik-mtu.c
index 7d44de3..8e4ddb9 100644
--- a/drivers/clocksource/nomadik-mtu.c
+++ b/drivers/clocksource/nomadik-mtu.c
@@ -284,5 +284,5 @@ static int __init nmdk_timer_of_init(struct device_node *node)
 
 	return nmdk_timer_init(base, irq, pclk, clk);
 }
-CLOCKSOURCE_OF_DECLARE(nomadik_mtu, "st,nomadik-mtu",
+TIMER_OF_DECLARE(nomadik_mtu, "st,nomadik-mtu",
 		       nmdk_timer_of_init);
diff --git a/drivers/clocksource/pxa_timer.c b/drivers/clocksource/pxa_timer.c
index a10fa667..08cd6eaf 100644
--- a/drivers/clocksource/pxa_timer.c
+++ b/drivers/clocksource/pxa_timer.c
@@ -216,7 +216,7 @@ static int __init pxa_timer_dt_init(struct device_node *np)
 
 	return pxa_timer_common_init(irq, clk_get_rate(clk));
 }
-CLOCKSOURCE_OF_DECLARE(pxa_timer, "marvell,pxa-timer", pxa_timer_dt_init);
+TIMER_OF_DECLARE(pxa_timer, "marvell,pxa-timer", pxa_timer_dt_init);
 
 /*
  * Legacy timer init for non device-tree boards.
diff --git a/drivers/clocksource/qcom-timer.c b/drivers/clocksource/qcom-timer.c
index ee358cd..89816f8 100644
--- a/drivers/clocksource/qcom-timer.c
+++ b/drivers/clocksource/qcom-timer.c
@@ -254,5 +254,5 @@ static int __init msm_dt_timer_init(struct device_node *np)
 
 	return msm_timer_init(freq, 32, irq, !!percpu_offset);
 }
-CLOCKSOURCE_OF_DECLARE(kpss_timer, "qcom,kpss-timer", msm_dt_timer_init);
-CLOCKSOURCE_OF_DECLARE(scss_timer, "qcom,scss-timer", msm_dt_timer_init);
+TIMER_OF_DECLARE(kpss_timer, "qcom,kpss-timer", msm_dt_timer_init);
+TIMER_OF_DECLARE(scss_timer, "qcom,scss-timer", msm_dt_timer_init);
diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource/renesas-ostm.c
index c76f576..6cffd7c 100644
--- a/drivers/clocksource/renesas-ostm.c
+++ b/drivers/clocksource/renesas-ostm.c
@@ -262,4 +262,4 @@ static int __init ostm_init(struct device_node *np)
 	return 0;
 }
 
-CLOCKSOURCE_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
+TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
diff --git a/drivers/clocksource/rockchip_timer.c b/drivers/clocksource/rockchip_timer.c
index 49c02be..c27f4c8 100644
--- a/drivers/clocksource/rockchip_timer.c
+++ b/drivers/clocksource/rockchip_timer.c
@@ -303,5 +303,5 @@ static int __init rk_timer_init(struct device_node *np)
 	return -EINVAL;
 }
 
-CLOCKSOURCE_OF_DECLARE(rk3288_timer, "rockchip,rk3288-timer", rk_timer_init);
-CLOCKSOURCE_OF_DECLARE(rk3399_timer, "rockchip,rk3399-timer", rk_timer_init);
+TIMER_OF_DECLARE(rk3288_timer, "rockchip,rk3288-timer", rk_timer_init);
+TIMER_OF_DECLARE(rk3399_timer, "rockchip,rk3399-timer", rk_timer_init);
diff --git a/drivers/clocksource/samsung_pwm_timer.c b/drivers/clocksource/samsung_pwm_timer.c
index a68e653..21cd72c 100644
--- a/drivers/clocksource/samsung_pwm_timer.c
+++ b/drivers/clocksource/samsung_pwm_timer.c
@@ -466,7 +466,7 @@ static int __init s3c2410_pwm_clocksource_init(struct device_node *np)
 {
 	return samsung_pwm_alloc(np, &s3c24xx_variant);
 }
-CLOCKSOURCE_OF_DECLARE(s3c2410_pwm, "samsung,s3c2410-pwm", s3c2410_pwm_clocksource_init);
+TIMER_OF_DECLARE(s3c2410_pwm, "samsung,s3c2410-pwm", s3c2410_pwm_clocksource_init);
 
 static const struct samsung_pwm_variant s3c64xx_variant = {
 	.bits		= 32,
@@ -479,7 +479,7 @@ static int __init s3c64xx_pwm_clocksource_init(struct device_node *np)
 {
 	return samsung_pwm_alloc(np, &s3c64xx_variant);
 }
-CLOCKSOURCE_OF_DECLARE(s3c6400_pwm, "samsung,s3c6400-pwm", s3c64xx_pwm_clocksource_init);
+TIMER_OF_DECLARE(s3c6400_pwm, "samsung,s3c6400-pwm", s3c64xx_pwm_clocksource_init);
 
 static const struct samsung_pwm_variant s5p64x0_variant = {
 	.bits		= 32,
@@ -492,7 +492,7 @@ static int __init s5p64x0_pwm_clocksource_init(struct device_node *np)
 {
 	return samsung_pwm_alloc(np, &s5p64x0_variant);
 }
-CLOCKSOURCE_OF_DECLARE(s5p6440_pwm, "samsung,s5p6440-pwm", s5p64x0_pwm_clocksource_init);
+TIMER_OF_DECLARE(s5p6440_pwm, "samsung,s5p6440-pwm", s5p64x0_pwm_clocksource_init);
 
 static const struct samsung_pwm_variant s5p_variant = {
 	.bits		= 32,
@@ -505,5 +505,5 @@ static int __init s5p_pwm_clocksource_init(struct device_node *np)
 {
 	return samsung_pwm_alloc(np, &s5p_variant);
 }
-CLOCKSOURCE_OF_DECLARE(s5pc100_pwm, "samsung,s5pc100-pwm", s5p_pwm_clocksource_init);
+TIMER_OF_DECLARE(s5pc100_pwm, "samsung,s5pc100-pwm", s5p_pwm_clocksource_init);
 #endif
diff --git a/drivers/clocksource/sun4i_timer.c b/drivers/clocksource/sun4i_timer.c
index 4452d5c..3e4bc64 100644
--- a/drivers/clocksource/sun4i_timer.c
+++ b/drivers/clocksource/sun4i_timer.c
@@ -233,5 +233,5 @@ static int __init sun4i_timer_init(struct device_node *node)
 
 	return ret;
 }
-CLOCKSOURCE_OF_DECLARE(sun4i, "allwinner,sun4i-a10-timer",
+TIMER_OF_DECLARE(sun4i, "allwinner,sun4i-a10-timer",
 		       sun4i_timer_init);
diff --git a/drivers/clocksource/tango_xtal.c b/drivers/clocksource/tango_xtal.c
index 12fcef8..c4e1c2e 100644
--- a/drivers/clocksource/tango_xtal.c
+++ b/drivers/clocksource/tango_xtal.c
@@ -53,4 +53,4 @@ static int __init tango_clocksource_init(struct device_node *np)
 	return 0;
 }
 
-CLOCKSOURCE_OF_DECLARE(tango, "sigma,tick-counter", tango_clocksource_init);
+TIMER_OF_DECLARE(tango, "sigma,tick-counter", tango_clocksource_init);
diff --git a/drivers/clocksource/tegra20_timer.c b/drivers/clocksource/tegra20_timer.c
index b9990b9..c337a81 100644
--- a/drivers/clocksource/tegra20_timer.c
+++ b/drivers/clocksource/tegra20_timer.c
@@ -237,7 +237,7 @@ static int __init tegra20_init_timer(struct device_node *np)
 
 	return 0;
 }
-CLOCKSOURCE_OF_DECLARE(tegra20_timer, "nvidia,tegra20-timer", tegra20_init_timer);
+TIMER_OF_DECLARE(tegra20_timer, "nvidia,tegra20-timer", tegra20_init_timer);
 
 static int __init tegra20_init_rtc(struct device_node *np)
 {
@@ -261,4 +261,4 @@ static int __init tegra20_init_rtc(struct device_node *np)
 
 	return register_persistent_clock(NULL, tegra_read_persistent_clock64);
 }
-CLOCKSOURCE_OF_DECLARE(tegra20_rtc, "nvidia,tegra20-rtc", tegra20_init_rtc);
+TIMER_OF_DECLARE(tegra20_rtc, "nvidia,tegra20-rtc", tegra20_init_rtc);
diff --git a/drivers/clocksource/time-armada-370-xp.c b/drivers/clocksource/time-armada-370-xp.c
index aea4380..edf1a46 100644
--- a/drivers/clocksource/time-armada-370-xp.c
+++ b/drivers/clocksource/time-armada-370-xp.c
@@ -351,7 +351,7 @@ static int __init armada_xp_timer_init(struct device_node *np)
 
 	return armada_370_xp_timer_common_init(np);
 }
-CLOCKSOURCE_OF_DECLARE(armada_xp, "marvell,armada-xp-timer",
+TIMER_OF_DECLARE(armada_xp, "marvell,armada-xp-timer",
 		       armada_xp_timer_init);
 
 static int __init armada_375_timer_init(struct device_node *np)
@@ -389,7 +389,7 @@ static int __init armada_375_timer_init(struct device_node *np)
 
 	return armada_370_xp_timer_common_init(np);
 }
-CLOCKSOURCE_OF_DECLARE(armada_375, "marvell,armada-375-timer",
+TIMER_OF_DECLARE(armada_375, "marvell,armada-375-timer",
 		       armada_375_timer_init);
 
 static int __init armada_370_timer_init(struct device_node *np)
@@ -412,5 +412,5 @@ static int __init armada_370_timer_init(struct device_node *np)
 
 	return armada_370_xp_timer_common_init(np);
 }
-CLOCKSOURCE_OF_DECLARE(armada_370, "marvell,armada-370-timer",
+TIMER_OF_DECLARE(armada_370, "marvell,armada-370-timer",
 		       armada_370_timer_init);
diff --git a/drivers/clocksource/time-efm32.c b/drivers/clocksource/time-efm32.c
index ce0f97b..257e810 100644
--- a/drivers/clocksource/time-efm32.c
+++ b/drivers/clocksource/time-efm32.c
@@ -283,5 +283,5 @@ static int __init efm32_timer_init(struct device_node *np)
 
 	return ret;
 }
-CLOCKSOURCE_OF_DECLARE(efm32compat, "efm32,timer", efm32_timer_init);
-CLOCKSOURCE_OF_DECLARE(efm32, "energymicro,efm32-timer", efm32_timer_init);
+TIMER_OF_DECLARE(efm32compat, "efm32,timer", efm32_timer_init);
+TIMER_OF_DECLARE(efm32, "energymicro,efm32-timer", efm32_timer_init);
diff --git a/drivers/clocksource/time-lpc32xx.c b/drivers/clocksource/time-lpc32xx.c
index 9649cfd..d51a62a 100644
--- a/drivers/clocksource/time-lpc32xx.c
+++ b/drivers/clocksource/time-lpc32xx.c
@@ -311,4 +311,4 @@ static int __init lpc32xx_timer_init(struct device_node *np)
 
 	return ret;
 }
-CLOCKSOURCE_OF_DECLARE(lpc32xx_timer, "nxp,lpc3220-timer", lpc32xx_timer_init);
+TIMER_OF_DECLARE(lpc32xx_timer, "nxp,lpc3220-timer", lpc32xx_timer_init);
diff --git a/drivers/clocksource/time-orion.c b/drivers/clocksource/time-orion.c
index b9b97f6..1220206 100644
--- a/drivers/clocksource/time-orion.c
+++ b/drivers/clocksource/time-orion.c
@@ -189,4 +189,4 @@ static int __init orion_timer_init(struct device_node *np)
 
 	return 0;
 }
-CLOCKSOURCE_OF_DECLARE(orion_timer, "marvell,orion-timer", orion_timer_init);
+TIMER_OF_DECLARE(orion_timer, "marvell,orion-timer", orion_timer_init);
diff --git a/drivers/clocksource/time-pistachio.c b/drivers/clocksource/time-pistachio.c
index 3710e4d..a2dd85d 100644
--- a/drivers/clocksource/time-pistachio.c
+++ b/drivers/clocksource/time-pistachio.c
@@ -214,5 +214,5 @@ static int __init pistachio_clksrc_of_init(struct device_node *node)
 	sched_clock_register(pistachio_read_sched_clock, 32, rate);
 	return clocksource_register_hz(&pcs_gpt.cs, rate);
 }
-CLOCKSOURCE_OF_DECLARE(pistachio_gptimer, "img,pistachio-gptimer",
+TIMER_OF_DECLARE(pistachio_gptimer, "img,pistachio-gptimer",
 		       pistachio_clksrc_of_init);
diff --git a/drivers/clocksource/timer-atlas7.c b/drivers/clocksource/timer-atlas7.c
index 50300ee..62c4bbc 100644
--- a/drivers/clocksource/timer-atlas7.c
+++ b/drivers/clocksource/timer-atlas7.c
@@ -283,4 +283,4 @@ static int __init sirfsoc_of_timer_init(struct device_node *np)
 
 	return sirfsoc_atlas7_timer_init(np);
 }
-CLOCKSOURCE_OF_DECLARE(sirfsoc_atlas7_timer, "sirf,atlas7-tick", sirfsoc_of_timer_init);
+TIMER_OF_DECLARE(sirfsoc_atlas7_timer, "sirf,atlas7-tick", sirfsoc_of_timer_init);
diff --git a/drivers/clocksource/timer-atmel-pit.c b/drivers/clocksource/timer-atmel-pit.c
index cc11235..ec8a437 100644
--- a/drivers/clocksource/timer-atmel-pit.c
+++ b/drivers/clocksource/timer-atmel-pit.c
@@ -255,5 +255,5 @@ static int __init at91sam926x_pit_dt_init(struct device_node *node)
 
 	return 0;
 }
-CLOCKSOURCE_OF_DECLARE(at91sam926x_pit, "atmel,at91sam9260-pit",
+TIMER_OF_DECLARE(at91sam926x_pit, "atmel,at91sam9260-pit",
 		       at91sam926x_pit_dt_init);
diff --git a/drivers/clocksource/timer-atmel-st.c b/drivers/clocksource/timer-atmel-st.c
index be4ac76..d2e660f 100644
--- a/drivers/clocksource/timer-atmel-st.c
+++ b/drivers/clocksource/timer-atmel-st.c
@@ -260,5 +260,5 @@ static int __init atmel_st_timer_init(struct device_node *node)
 	/* register clocksource */
 	return clocksource_register_hz(&clk32k, sclk_rate);
 }
-CLOCKSOURCE_OF_DECLARE(atmel_st_timer, "atmel,at91rm9200-st",
+TIMER_OF_DECLARE(atmel_st_timer, "atmel,at91rm9200-st",
 		       atmel_st_timer_init);
diff --git a/drivers/clocksource/timer-digicolor.c b/drivers/clocksource/timer-digicolor.c
index 94a161e..1e984a4 100644
--- a/drivers/clocksource/timer-digicolor.c
+++ b/drivers/clocksource/timer-digicolor.c
@@ -203,5 +203,5 @@ static int __init digicolor_timer_init(struct device_node *node)
 
 	return 0;
 }
-CLOCKSOURCE_OF_DECLARE(conexant_digicolor, "cnxt,cx92755-timer",
+TIMER_OF_DECLARE(conexant_digicolor, "cnxt,cx92755-timer",
 		       digicolor_timer_init);
diff --git a/drivers/clocksource/timer-fttmr010.c b/drivers/clocksource/timer-fttmr010.c
index d96190e..a21020c 100644
--- a/drivers/clocksource/timer-fttmr010.c
+++ b/drivers/clocksource/timer-fttmr010.c
@@ -364,8 +364,8 @@ static __init int fttmr010_timer_init(struct device_node *np)
 	return fttmr010_common_init(np, false);
 }
 
-CLOCKSOURCE_OF_DECLARE(fttmr010, "faraday,fttmr010", fttmr010_timer_init);
-CLOCKSOURCE_OF_DECLARE(gemini, "cortina,gemini-timer", fttmr010_timer_init);
-CLOCKSOURCE_OF_DECLARE(moxart, "moxa,moxart-timer", fttmr010_timer_init);
-CLOCKSOURCE_OF_DECLARE(ast2400, "aspeed,ast2400-timer", aspeed_timer_init);
-CLOCKSOURCE_OF_DECLARE(ast2500, "aspeed,ast2500-timer", aspeed_timer_init);
+TIMER_OF_DECLARE(fttmr010, "faraday,fttmr010", fttmr010_timer_init);
+TIMER_OF_DECLARE(gemini, "cortina,gemini-timer", fttmr010_timer_init);
+TIMER_OF_DECLARE(moxart, "moxa,moxart-timer", fttmr010_timer_init);
+TIMER_OF_DECLARE(ast2400, "aspeed,ast2400-timer", aspeed_timer_init);
+TIMER_OF_DECLARE(ast2500, "aspeed,ast2500-timer", aspeed_timer_init);
diff --git a/drivers/clocksource/timer-imx-gpt.c b/drivers/clocksource/timer-imx-gpt.c
index f595460..6ec6d79 100644
--- a/drivers/clocksource/timer-imx-gpt.c
+++ b/drivers/clocksource/timer-imx-gpt.c
@@ -545,15 +545,15 @@ static int __init imx6dl_timer_init_dt(struct device_node *np)
 	return mxc_timer_init_dt(np, GPT_TYPE_IMX6DL);
 }
 
-CLOCKSOURCE_OF_DECLARE(imx1_timer, "fsl,imx1-gpt", imx1_timer_init_dt);
-CLOCKSOURCE_OF_DECLARE(imx21_timer, "fsl,imx21-gpt", imx21_timer_init_dt);
-CLOCKSOURCE_OF_DECLARE(imx27_timer, "fsl,imx27-gpt", imx21_timer_init_dt);
-CLOCKSOURCE_OF_DECLARE(imx31_timer, "fsl,imx31-gpt", imx31_timer_init_dt);
-CLOCKSOURCE_OF_DECLARE(imx25_timer, "fsl,imx25-gpt", imx31_timer_init_dt);
-CLOCKSOURCE_OF_DECLARE(imx50_timer, "fsl,imx50-gpt", imx31_timer_init_dt);
-CLOCKSOURCE_OF_DECLARE(imx51_timer, "fsl,imx51-gpt", imx31_timer_init_dt);
-CLOCKSOURCE_OF_DECLARE(imx53_timer, "fsl,imx53-gpt", imx31_timer_init_dt);
-CLOCKSOURCE_OF_DECLARE(imx6q_timer, "fsl,imx6q-gpt", imx31_timer_init_dt);
-CLOCKSOURCE_OF_DECLARE(imx6dl_timer, "fsl,imx6dl-gpt", imx6dl_timer_init_dt);
-CLOCKSOURCE_OF_DECLARE(imx6sl_timer, "fsl,imx6sl-gpt", imx6dl_timer_init_dt);
-CLOCKSOURCE_OF_DECLARE(imx6sx_timer, "fsl,imx6sx-gpt", imx6dl_timer_init_dt);
+TIMER_OF_DECLARE(imx1_timer, "fsl,imx1-gpt", imx1_timer_init_dt);
+TIMER_OF_DECLARE(imx21_timer, "fsl,imx21-gpt", imx21_timer_init_dt);
+TIMER_OF_DECLARE(imx27_timer, "fsl,imx27-gpt", imx21_timer_init_dt);
+TIMER_OF_DECLARE(imx31_timer, "fsl,imx31-gpt", imx31_timer_init_dt);
+TIMER_OF_DECLARE(imx25_timer, "fsl,imx25-gpt", imx31_timer_init_dt);
+TIMER_OF_DECLARE(imx50_timer, "fsl,imx50-gpt", imx31_timer_init_dt);
+TIMER_OF_DECLARE(imx51_timer, "fsl,imx51-gpt", imx31_timer_init_dt);
+TIMER_OF_DECLARE(imx53_timer, "fsl,imx53-gpt", imx31_timer_init_dt);
+TIMER_OF_DECLARE(imx6q_timer, "fsl,imx6q-gpt", imx31_timer_init_dt);
+TIMER_OF_DECLARE(imx6dl_timer, "fsl,imx6dl-gpt", imx6dl_timer_init_dt);
+TIMER_OF_DECLARE(imx6sl_timer, "fsl,imx6sl-gpt", imx6dl_timer_init_dt);
+TIMER_OF_DECLARE(imx6sx_timer, "fsl,imx6sx-gpt", imx6dl_timer_init_dt);
diff --git a/drivers/clocksource/timer-integrator-ap.c b/drivers/clocksource/timer-integrator-ap.c
index 04ad306..2ff64d9 100644
--- a/drivers/clocksource/timer-integrator-ap.c
+++ b/drivers/clocksource/timer-integrator-ap.c
@@ -232,5 +232,5 @@ static int __init integrator_ap_timer_init_of(struct device_node *node)
 	return 0;
 }
 
-CLOCKSOURCE_OF_DECLARE(integrator_ap_timer, "arm,integrator-timer",
+TIMER_OF_DECLARE(integrator_ap_timer, "arm,integrator-timer",
 		       integrator_ap_timer_init_of);
diff --git a/drivers/clocksource/timer-keystone.c b/drivers/clocksource/timer-keystone.c
index ab68a47..0eee032 100644
--- a/drivers/clocksource/timer-keystone.c
+++ b/drivers/clocksource/timer-keystone.c
@@ -226,5 +226,5 @@ static int __init keystone_timer_init(struct device_node *np)
 	return error;
 }
 
-CLOCKSOURCE_OF_DECLARE(keystone_timer, "ti,keystone-timer",
+TIMER_OF_DECLARE(keystone_timer, "ti,keystone-timer",
 			   keystone_timer_init);
diff --git a/drivers/clocksource/timer-nps.c b/drivers/clocksource/timer-nps.c
index e74ea17..7b6bb0d 100644
--- a/drivers/clocksource/timer-nps.c
+++ b/drivers/clocksource/timer-nps.c
@@ -110,9 +110,9 @@ static int __init nps_setup_clocksource(struct device_node *node)
 	return ret;
 }
 
-CLOCKSOURCE_OF_DECLARE(ezchip_nps400_clksrc, "ezchip,nps400-timer",
+TIMER_OF_DECLARE(ezchip_nps400_clksrc, "ezchip,nps400-timer",
 		       nps_setup_clocksource);
-CLOCKSOURCE_OF_DECLARE(ezchip_nps400_clk_src, "ezchip,nps400-timer1",
+TIMER_OF_DECLARE(ezchip_nps400_clk_src, "ezchip,nps400-timer1",
 		       nps_setup_clocksource);
 
 #ifdef CONFIG_EZNPS_MTM_EXT
@@ -279,6 +279,6 @@ static int __init nps_setup_clockevent(struct device_node *node)
 	return 0;
 }
 
-CLOCKSOURCE_OF_DECLARE(ezchip_nps400_clk_evt, "ezchip,nps400-timer0",
+TIMER_OF_DECLARE(ezchip_nps400_clk_evt, "ezchip,nps400-timer0",
 		       nps_setup_clockevent);
 #endif /* CONFIG_EZNPS_MTM_EXT */
diff --git a/drivers/clocksource/timer-oxnas-rps.c b/drivers/clocksource/timer-oxnas-rps.c
index d630bf4..eed6fef 100644
--- a/drivers/clocksource/timer-oxnas-rps.c
+++ b/drivers/clocksource/timer-oxnas-rps.c
@@ -293,7 +293,7 @@ static int __init oxnas_rps_timer_init(struct device_node *np)
 	return ret;
 }
 
-CLOCKSOURCE_OF_DECLARE(ox810se_rps,
+TIMER_OF_DECLARE(ox810se_rps,
 		       "oxsemi,ox810se-rps-timer", oxnas_rps_timer_init);
-CLOCKSOURCE_OF_DECLARE(ox820_rps,
+TIMER_OF_DECLARE(ox820_rps,
 		       "oxsemi,ox820se-rps-timer", oxnas_rps_timer_init);
diff --git a/drivers/clocksource/timer-prima2.c b/drivers/clocksource/timer-prima2.c
index b4122ed..20ff33b 100644
--- a/drivers/clocksource/timer-prima2.c
+++ b/drivers/clocksource/timer-prima2.c
@@ -245,5 +245,5 @@ static int __init sirfsoc_prima2_timer_init(struct device_node *np)
 
 	return 0;
 }
-CLOCKSOURCE_OF_DECLARE(sirfsoc_prima2_timer,
+TIMER_OF_DECLARE(sirfsoc_prima2_timer,
 	"sirf,prima2-tick", sirfsoc_prima2_timer_init);
diff --git a/drivers/clocksource/timer-sp804.c b/drivers/clocksource/timer-sp804.c
index 2d575a8c..3ac9dec 100644
--- a/drivers/clocksource/timer-sp804.c
+++ b/drivers/clocksource/timer-sp804.c
@@ -287,7 +287,7 @@ static int __init sp804_of_init(struct device_node *np)
 	iounmap(base);
 	return ret;
 }
-CLOCKSOURCE_OF_DECLARE(sp804, "arm,sp804", sp804_of_init);
+TIMER_OF_DECLARE(sp804, "arm,sp804", sp804_of_init);
 
 static int __init integrator_cp_of_init(struct device_node *np)
 {
@@ -335,4 +335,4 @@ static int __init integrator_cp_of_init(struct device_node *np)
 	iounmap(base);
 	return ret;
 }
-CLOCKSOURCE_OF_DECLARE(intcp, "arm,integrator-cp-timer", integrator_cp_of_init);
+TIMER_OF_DECLARE(intcp, "arm,integrator-cp-timer", integrator_cp_of_init);
diff --git a/drivers/clocksource/timer-stm32.c b/drivers/clocksource/timer-stm32.c
index 1b2574c..174d1243 100644
--- a/drivers/clocksource/timer-stm32.c
+++ b/drivers/clocksource/timer-stm32.c
@@ -187,4 +187,4 @@ static int __init stm32_clockevent_init(struct device_node *np)
 	return ret;
 }
 
-CLOCKSOURCE_OF_DECLARE(stm32, "st,stm32-timer", stm32_clockevent_init);
+TIMER_OF_DECLARE(stm32, "st,stm32-timer", stm32_clockevent_init);
diff --git a/drivers/clocksource/timer-sun5i.c b/drivers/clocksource/timer-sun5i.c
index 2e9c830..a4ebc8f 100644
--- a/drivers/clocksource/timer-sun5i.c
+++ b/drivers/clocksource/timer-sun5i.c
@@ -358,7 +358,7 @@ static int __init sun5i_timer_init(struct device_node *node)
 
 	return sun5i_setup_clockevent(node, timer_base, clk, irq);
 }
-CLOCKSOURCE_OF_DECLARE(sun5i_a13, "allwinner,sun5i-a13-hstimer",
+TIMER_OF_DECLARE(sun5i_a13, "allwinner,sun5i-a13-hstimer",
 			   sun5i_timer_init);
-CLOCKSOURCE_OF_DECLARE(sun7i_a20, "allwinner,sun7i-a20-hstimer",
+TIMER_OF_DECLARE(sun7i_a20, "allwinner,sun7i-a20-hstimer",
 			   sun5i_timer_init);
diff --git a/drivers/clocksource/timer-ti-32k.c b/drivers/clocksource/timer-ti-32k.c
index 6240677..880a861 100644
--- a/drivers/clocksource/timer-ti-32k.c
+++ b/drivers/clocksource/timer-ti-32k.c
@@ -124,5 +124,5 @@ static int __init ti_32k_timer_init(struct device_node *np)
 
 	return 0;
 }
-CLOCKSOURCE_OF_DECLARE(ti_32k_timer, "ti,omap-counter32k",
+TIMER_OF_DECLARE(ti_32k_timer, "ti,omap-counter32k",
 		ti_32k_timer_init);
diff --git a/drivers/clocksource/timer-u300.c b/drivers/clocksource/timer-u300.c
index 704e40c..be34b11 100644
--- a/drivers/clocksource/timer-u300.c
+++ b/drivers/clocksource/timer-u300.c
@@ -458,5 +458,5 @@ static int __init u300_timer_init_of(struct device_node *np)
 	return 0;
 }
 
-CLOCKSOURCE_OF_DECLARE(u300_timer, "stericsson,u300-apptimer",
+TIMER_OF_DECLARE(u300_timer, "stericsson,u300-apptimer",
 		       u300_timer_init_of);
diff --git a/drivers/clocksource/versatile.c b/drivers/clocksource/versatile.c
index 220b490..39725d3 100644
--- a/drivers/clocksource/versatile.c
+++ b/drivers/clocksource/versatile.c
@@ -38,7 +38,7 @@ static int __init versatile_sched_clock_init(struct device_node *node)
 
 	return 0;
 }
-CLOCKSOURCE_OF_DECLARE(vexpress, "arm,vexpress-sysreg",
+TIMER_OF_DECLARE(vexpress, "arm,vexpress-sysreg",
 		       versatile_sched_clock_init);
-CLOCKSOURCE_OF_DECLARE(versatile, "arm,versatile-sysreg",
+TIMER_OF_DECLARE(versatile, "arm,versatile-sysreg",
 		       versatile_sched_clock_init);
diff --git a/drivers/clocksource/vf_pit_timer.c b/drivers/clocksource/vf_pit_timer.c
index e0849e2..0f92089 100644
--- a/drivers/clocksource/vf_pit_timer.c
+++ b/drivers/clocksource/vf_pit_timer.c
@@ -201,4 +201,4 @@ static int __init pit_timer_init(struct device_node *np)
 
 	return pit_clockevent_init(clk_rate, irq);
 }
-CLOCKSOURCE_OF_DECLARE(vf610, "fsl,vf610-pit", pit_timer_init);
+TIMER_OF_DECLARE(vf610, "fsl,vf610-pit", pit_timer_init);
diff --git a/drivers/clocksource/vt8500_timer.c b/drivers/clocksource/vt8500_timer.c
index d02b510..e0f7489 100644
--- a/drivers/clocksource/vt8500_timer.c
+++ b/drivers/clocksource/vt8500_timer.c
@@ -165,4 +165,4 @@ static int __init vt8500_timer_init(struct device_node *np)
 	return 0;
 }
 
-CLOCKSOURCE_OF_DECLARE(vt8500, "via,vt8500-timer", vt8500_timer_init);
+TIMER_OF_DECLARE(vt8500, "via,vt8500-timer", vt8500_timer_init);
diff --git a/drivers/clocksource/zevio-timer.c b/drivers/clocksource/zevio-timer.c
index 9a53f5e..a6a0338 100644
--- a/drivers/clocksource/zevio-timer.c
+++ b/drivers/clocksource/zevio-timer.c
@@ -215,4 +215,4 @@ static int __init zevio_timer_init(struct device_node *node)
 	return zevio_timer_add(node);
 }
 
-CLOCKSOURCE_OF_DECLARE(zevio_timer, "lsi,zevio-timer", zevio_timer_init);
+TIMER_OF_DECLARE(zevio_timer, "lsi,zevio-timer", zevio_timer_init);
diff --git a/include/linux/clocksource.h b/include/linux/clocksource.h
index f2b10d9..a86b65f 100644
--- a/include/linux/clocksource.h
+++ b/include/linux/clocksource.h
@@ -249,7 +249,7 @@ extern int clocksource_mmio_init(void __iomem *, const char *,
 
 extern int clocksource_i8253_init(void);
 
-#define CLOCKSOURCE_OF_DECLARE(name, compat, fn) \
+#define TIMER_OF_DECLARE(name, compat, fn) \
 	OF_DECLARE_1_RET(clksrc, name, compat, fn)
 
 #ifdef CONFIG_CLKSRC_PROBE
-- 
2.7.4
