From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH v4 09/11] ARM: tegra: add support for warm reset GPIO
Date: Wed, 11 Feb 2015 16:06:41 +0100
Message-ID: <1423667220-1062-10-git-send-email-tomeu.vizoso@collabora.com>
References: <1423667220-1062-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423667220-1062-1-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org
Cc: Stephen Warren <swarren@wwwdotorg.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Simon Glass <sjg@chromium.org>, Dylan Reid <dgreid@chromium.org>, Andrew Bresticker <abrestic@chromium.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Paul Walmsley <paul@pwsan.com>, Eduardo Valentin <edubezval@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Andrew Bresticker <abrestic@chromium.org>

Allow for a warm reset GPIO to be passed to the PMC driver via DT
which will be used to reset the system instead of writing to PMC_CTRL.
The GPIO will be asserted at reset time and, if this fails to reset
the system, we'll fall back to using PMC_CTRL.

Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
[tomeu.vizoso@collabora.com: Rebased]
Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 .../bindings/arm/tegra/nvidia,tegra20-pmc.txt      |  1 +
 drivers/soc/tegra/pmc.c                            | 33 ++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
index 02c2700..ee5568f 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
@@ -34,6 +34,7 @@ Optional properties:
 - nvidia,combined-power-req : Boolean, combined power request for CPU & Core
 - nvidia,cpu-pwr-good-en : Boolean, CPU power good signal (from PMIC to PMC)
 			   is enabled.
+- nvidia,reset-gpio : GPIO that can be used to warm reset the system.
 
 Required properties when nvidia,suspend-mode is specified:
 - nvidia,cpu-pwr-good-time : CPU power good time in uS.
diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index c956395..effed0c 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -24,10 +24,12 @@
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/export.h>
+#include <linux/gpio.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_gpio.h>
 #include <linux/platform_device.h>
 #include <linux/reboot.h>
 #include <linux/reset.h>
@@ -127,6 +129,8 @@ struct tegra_pmc_soc {
  * @lp0_vec_phys: physical base address of the LP0 warm boot code
  * @lp0_vec_size: size of the LP0 warm boot code
  * @powergates_lock: mutex for power gate register access
+ * @reset_gpio: GPIO to assert to reset the system
+ * @reset_active_low: Reset GPIO is active-low
  */
 struct tegra_pmc {
 	struct device *dev;
@@ -149,6 +153,9 @@ struct tegra_pmc {
 	bool cpu_pwr_good_en;
 	u32 lp0_vec_phys;
 	u32 lp0_vec_size;
+	int reset_gpio;
+	bool reset_active_low;
+
 
 	struct mutex powergates_lock;
 };
@@ -386,6 +393,17 @@ void tegra_pmc_restart(enum reboot_mode mode, const char *cmd)
 {
 	u32 value;
 
+	/*
+	* If there's a reset GPIO, attempt to use that first and then fall
+	* back to PMC reset if that fails.
+	*/
+	if (gpio_is_valid(pmc->reset_gpio)) {
+		value = pmc->reset_active_low ? 0 : 1;
+		gpio_direction_output(pmc->reset_gpio, value);
+		udelay(100);
+		pr_err("GPIO reset failed; using PMC reset...\n");
+	}
+
 	value = tegra_pmc_readl(PMC_SCRATCH0);
 	value &= ~PMC_SCRATCH0_MODE_MASK;
 
@@ -629,6 +647,8 @@ void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
 static int tegra_pmc_parse_dt(struct tegra_pmc *pmc, struct device_node *np)
 {
 	u32 value, values[2];
+	enum of_gpio_flags flags;
+	int err;
 
 	if (of_property_read_u32(np, "nvidia,suspend-mode", &value)) {
 	} else {
@@ -695,6 +715,19 @@ static int tegra_pmc_parse_dt(struct tegra_pmc *pmc, struct device_node *np)
 	pmc->lp0_vec_phys = values[0];
 	pmc->lp0_vec_size = values[1];
 
+	pmc->reset_gpio = of_get_named_gpio_flags(np, "nvidia,reset-gpio",
+						  0, &flags);
+	if (gpio_is_valid(pmc->reset_gpio)) {
+		err = gpio_request_one(pmc->reset_gpio, GPIOF_OUT_INIT_HIGH,
+				       "soc-warm-reset");
+		if (err) {
+			pr_err("Failed to request reset GPIO: %d\n", err);
+			pmc->reset_gpio = -1;
+		}
+		if (flags & OF_GPIO_ACTIVE_LOW)
+			pmc->reset_active_low = true;
+	}
+
 	return 0;
 }
 
-- 
1.9.3
