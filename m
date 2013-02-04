From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] clocksource: tegra: move to of_clk_get
Date: Mon, 4 Feb 2013 15:40:30 +0200
Message-ID: <1359985230-11506-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, John Stultz <johnstul-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The new clockframework introduced DT IDs for each clock. To be able to remove
the device registrations, this driver needs to be updated to use the DT IDs.
Note that the actual removal of the clk_register_clkdev() calls will be done
in a later series.

Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra20.dtsi      |    2 ++
 arch/arm/boot/dts/tegra30.dtsi      |    2 ++
 drivers/clocksource/tegra20_timer.c |    4 ++--
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 63b0d81..6e41a4f 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -144,6 +144,7 @@
 			      0 1 0x04
 			      0 41 0x04
 			      0 42 0x04>;
+		clocks = <&tegra_car 5>;
 	};
 
 	tegra_car: clock {
@@ -308,6 +309,7 @@
 		compatible = "nvidia,tegra20-rtc";
 		reg = <0x7000e000 0x100>;
 		interrupts = <0 2 0x04>;
+		clocks = <&tegra_car 4>;
 	};
 
 	i2c@7000c000 {
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 313fa71..7bc07e6 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -147,6 +147,7 @@
 			      0 42 0x04
 			      0 121 0x04
 			      0 122 0x04>;
+		clocks = <&tegra_car 5>;
 	};
 
 	tegra_car: clock {
@@ -295,6 +296,7 @@
 		compatible = "nvidia,tegra30-rtc", "nvidia,tegra20-rtc";
 		reg = <0x7000e000 0x100>;
 		interrupts = <0 2 0x04>;
+		clocks = <&tegra_car 4>;
 	};
 
 	i2c@7000c000 {
diff --git a/drivers/clocksource/tegra20_timer.c b/drivers/clocksource/tegra20_timer.c
index 5bc1429..546c537 100644
--- a/drivers/clocksource/tegra20_timer.c
+++ b/drivers/clocksource/tegra20_timer.c
@@ -189,7 +189,7 @@ static void __init tegra20_init_timer(void)
 		BUG();
 	}
 
-	clk = clk_get_sys("timer", NULL);
+	clk = of_clk_get(np, 0);
 	if (IS_ERR(clk)) {
 		pr_warn("Unable to get timer clock. Assuming 12Mhz input clock.\n");
 		rate = 12000000;
@@ -216,7 +216,7 @@ static void __init tegra20_init_timer(void)
 	 * rtc registers are used by read_persistent_clock, keep the rtc clock
 	 * enabled
 	 */
-	clk = clk_get_sys("rtc-tegra", NULL);
+	clk = of_clk_get(np, 0);
 	if (IS_ERR(clk))
 		pr_warn("Unable to get rtc-tegra clock\n");
 	else
