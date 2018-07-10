From: Aapo Vienamo <avienamo@nvidia.com>
Subject: [PATCH 3/6] soc/tegra: pmc: Implement tegra_io_pad_is_powered()
Date: Tue, 10 Jul 2018 15:47:56 +0300
Message-ID: <1531226879-11802-4-git-send-email-avienamo@nvidia.com>
References: <1531226879-11802-1-git-send-email-avienamo@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1531226879-11802-1-git-send-email-avienamo@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>
Cc: Aapo Vienamo <avienamo@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Implement a function to query whether a pad is in deep power down mode.

Signed-off-by: Aapo Vienamo <avienamo@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 17 +++++++++++++++++
 include/soc/tegra/pmc.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 83b39cd..3f5b69fd 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1075,6 +1075,23 @@ int tegra_io_pad_power_disable(enum tegra_io_pad id)
 }
 EXPORT_SYMBOL(tegra_io_pad_power_disable);
 
+int tegra_io_pad_is_powered(enum tegra_io_pad id)
+{
+	unsigned long request, status;
+	u32 mask;
+	u32 value;
+	int err;
+
+	err = tegra_io_pad_get_dpd_register_bit(id, &request, &status, &mask);
+	if (err)
+		return err;
+
+	value = tegra_pmc_readl(status);
+
+	return !(value & mask);
+}
+EXPORT_SYMBOL(tegra_io_pad_is_powered);
+
 int tegra_io_pad_set_voltage(enum tegra_io_pad id,
 			     enum tegra_io_pad_voltage voltage)
 {
diff --git a/include/soc/tegra/pmc.h b/include/soc/tegra/pmc.h
index c32bf91..f88c6e2 100644
--- a/include/soc/tegra/pmc.h
+++ b/include/soc/tegra/pmc.h
@@ -162,6 +162,7 @@ int tegra_powergate_sequence_power_up(unsigned int id, struct clk *clk,
 
 int tegra_io_pad_power_enable(enum tegra_io_pad id);
 int tegra_io_pad_power_disable(enum tegra_io_pad id);
+int tegra_io_pad_is_powered(enum tegra_io_pad id);
 int tegra_io_pad_set_voltage(enum tegra_io_pad id,
 			     enum tegra_io_pad_voltage voltage);
 int tegra_io_pad_get_voltage(enum tegra_io_pad id);
-- 
2.7.4
