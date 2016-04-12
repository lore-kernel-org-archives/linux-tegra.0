From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 3/7] soc/tegra: pmc: Add interface to get IO rail power status
Date: Tue, 12 Apr 2016 20:26:43 +0530
Message-ID: <1460473007-11535-4-git-send-email-ldewangan@nvidia.com>
References: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: swarren@wwwdotorg.org, thierry.reding@gmail.com, linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add API to get the IO rail power status of the Tegra IO pads.
This will help client driver to get the current power status
of IO pads for handling IO pad power.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 16 ++++++++++++++++
 include/soc/tegra/pmc.h |  6 ++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 762f4fa..0bc8219 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -613,6 +613,22 @@ error:
 }
 EXPORT_SYMBOL(tegra_io_rail_power_off);
 
+int tegra_io_rail_power_get_status(unsigned int id)
+{
+	unsigned long status, value;
+	unsigned int mask;
+
+	if ((id > 63) || (id == 30) || (id == 31))
+		return -EINVAL;
+
+	status = (id < 32) ? IO_DPD_STATUS : IO_DPD2_STATUS;
+	mask = BIT(id % 32);
+	value = tegra_pmc_readl(status);
+
+	return !!(value & mask);
+}
+EXPORT_SYMBOL(tegra_io_rail_power_get_status);
+
 #ifdef CONFIG_PM_SLEEP
 enum tegra_suspend_mode tegra_pmc_get_suspend_mode(void)
 {
diff --git a/include/soc/tegra/pmc.h b/include/soc/tegra/pmc.h
index 58fadc5..4f3db41 100644
--- a/include/soc/tegra/pmc.h
+++ b/include/soc/tegra/pmc.h
@@ -133,6 +133,7 @@ int tegra_powergate_sequence_power_up(unsigned int id, struct clk *clk,
 
 int tegra_io_rail_power_on(unsigned int id);
 int tegra_io_rail_power_off(unsigned int id);
+int tegra_io_rail_power_get_status(unsigned int id);
 #else
 static inline int tegra_powergate_is_powered(unsigned int id)
 {
@@ -170,6 +171,11 @@ static inline int tegra_io_rail_power_off(unsigned int id)
 {
 	return -ENOSYS;
 }
+
+static inline int tegra_io_rail_power_get_status(unsigned int id)
+{
+	return -ENOTSUP;
+}
 #endif /* CONFIG_ARCH_TEGRA */
 
 #endif /* __SOC_TEGRA_PMC_H__ */
-- 
2.1.4
