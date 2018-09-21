From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 5/9] soc/tegra: pmc: Add initial Tegra194 wake events
Date: Fri, 21 Sep 2018 12:25:42 +0200
Message-ID: <20180921102546.12745-6-thierry.reding@gmail.com>
References: <20180921102546.12745-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180921102546.12745-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Tegra194 supports 96 wake events in total. Many of them are never used,
so only the most common ones (RTC alarm and power key) are currently
defined.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 42e7deb6de74..efe990985fe6 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -54,6 +54,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/pinctrl/pinctrl-tegra-io-pad.h>
 #include <dt-bindings/gpio/tegra186-gpio.h>
+#include <dt-bindings/gpio/tegra194-gpio.h>
 
 #define PMC_CNTRL			0x0
 #define  PMC_CNTRL_INTR_POLARITY	BIT(17) /* inverts INTR polarity */
@@ -2426,6 +2427,11 @@ static const struct tegra_io_pad_soc tegra194_io_pads[] = {
 	{ .id = TEGRA_IO_PAD_AUDIO_HV, .dpd = 61, .voltage = UINT_MAX },
 };
 
+static const struct tegra_wake_event tegra194_wake_events[] = {
+	TEGRA_WAKE_GPIO("power", 29, 1, TEGRA194_AON_GPIO(EE, 4)),
+	TEGRA_WAKE_IRQ("rtc", 73, 10),
+};
+
 static const struct tegra_pmc_soc tegra194_pmc_soc = {
 	.num_powergates = 0,
 	.powergates = NULL,
@@ -2438,6 +2444,8 @@ static const struct tegra_pmc_soc tegra194_pmc_soc = {
 	.regs = &tegra186_pmc_regs,
 	.init = NULL,
 	.setup_irq_polarity = tegra186_pmc_setup_irq_polarity,
+	.num_wake_events = ARRAY_SIZE(tegra194_wake_events),
+	.wake_events = tegra194_wake_events,
 };
 
 static const struct of_device_id tegra_pmc_match[] = {
-- 
2.19.0
