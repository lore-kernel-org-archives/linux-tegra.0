From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: [PATCH] clocksource: put nodes passed to CLOCKSOURCE_OF_DECLARE callbacks centrally
Date: Tue,  1 Oct 2013 11:00:53 +0200
Message-ID: <1380618053-11159-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: kernel@pengutronix.de, Thomas Gleixner <tglx@linutronix.de>, Stephen Warren <swarren@wwwdotorg.org>, Tony Prisk <linux@prisktech.co.nz>, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, Bryan Huntsman <bryanh@codeaurora.org>, Daniel Walker <dwalker@fifo99.com>, David Brown <davidb@codeaurora.org>
List-Id: linux-tegra@vger.kernel.org

Instead of letting each driver call of_node_put do it centrally in the
loop that also calls the CLOCKSOURCE_OF_DECLARE callbacks. This is less
prone to error and also moves getting and putting the references into t=
he
same function.

Consequently all respective of_node_put calls in drivers are removed.

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---
 arch/arm/mach-msm/timer.c             | 1 -
 drivers/clocksource/clksrc-of.c       | 1 +
 drivers/clocksource/dw_apb_timer_of.c | 2 --
 drivers/clocksource/tegra20_timer.c   | 4 ----
 drivers/clocksource/vt8500_timer.c    | 2 --
 5 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/arch/arm/mach-msm/timer.c b/arch/arm/mach-msm/timer.c
index 696fb73..1e9c338 100644
--- a/arch/arm/mach-msm/timer.c
+++ b/arch/arm/mach-msm/timer.c
@@ -274,7 +274,6 @@ static void __init msm_dt_timer_init(struct device_=
node *np)
 		pr_err("Unknown frequency\n");
 		return;
 	}
-	of_node_put(np);
=20
 	event_base =3D base + 0x4;
 	sts_base =3D base + 0x88;
diff --git a/drivers/clocksource/clksrc-of.c b/drivers/clocksource/clks=
rc-of.c
index 37f5325..8b2ed14 100644
--- a/drivers/clocksource/clksrc-of.c
+++ b/drivers/clocksource/clksrc-of.c
@@ -32,5 +32,6 @@ void __init clocksource_of_init(void)
 	for_each_matching_node_and_match(np, __clksrc_of_table, &match) {
 		init_func =3D match->data;
 		init_func(np);
+		of_node_put(np);
 	}
 }
diff --git a/drivers/clocksource/dw_apb_timer_of.c b/drivers/clocksourc=
e/dw_apb_timer_of.c
index 4cbae4f..294aeb7 100644
--- a/drivers/clocksource/dw_apb_timer_of.c
+++ b/drivers/clocksource/dw_apb_timer_of.c
@@ -138,12 +138,10 @@ static void __init dw_apb_timer_init(struct devic=
e_node *timer)
 	case 0:
 		pr_debug("%s: found clockevent timer\n", __func__);
 		add_clockevent(timer);
-		of_node_put(timer);
 		break;
 	case 1:
 		pr_debug("%s: found clocksource timer\n", __func__);
 		add_clocksource(timer);
-		of_node_put(timer);
 		init_sched_clock();
 		break;
 	default:
diff --git a/drivers/clocksource/tegra20_timer.c b/drivers/clocksource/=
tegra20_timer.c
index 9396170..fc173a6 100644
--- a/drivers/clocksource/tegra20_timer.c
+++ b/drivers/clocksource/tegra20_timer.c
@@ -181,8 +181,6 @@ static void __init tegra20_init_timer(struct device=
_node *np)
 		rate =3D clk_get_rate(clk);
 	}
=20
-	of_node_put(np);
-
 	switch (rate) {
 	case 12000000:
 		timer_writel(0x000b, TIMERUS_USEC_CFG);
@@ -241,8 +239,6 @@ static void __init tegra20_init_rtc(struct device_n=
ode *np)
 	else
 		clk_prepare_enable(clk);
=20
-	of_node_put(np);
-
 	register_persistent_clock(NULL, tegra_read_persistent_clock);
 }
 CLOCKSOURCE_OF_DECLARE(tegra20_rtc, "nvidia,tegra20-rtc", tegra20_init=
_rtc);
diff --git a/drivers/clocksource/vt8500_timer.c b/drivers/clocksource/v=
t8500_timer.c
index 64f553f..ad3c0e8 100644
--- a/drivers/clocksource/vt8500_timer.c
+++ b/drivers/clocksource/vt8500_timer.c
@@ -137,14 +137,12 @@ static void __init vt8500_timer_init(struct devic=
e_node *np)
 	if (!regbase) {
 		pr_err("%s: Missing iobase description in Device Tree\n",
 								__func__);
-		of_node_put(np);
 		return;
 	}
 	timer_irq =3D irq_of_parse_and_map(np, 0);
 	if (!timer_irq) {
 		pr_err("%s: Missing irq description in Device Tree\n",
 								__func__);
-		of_node_put(np);
 		return;
 	}
=20
--=20
1.8.4.rc3
