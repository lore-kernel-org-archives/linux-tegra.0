From: Aapo Vienamo <avienamo@nvidia.com>
Subject: [PATCH v3 3/7] soc/tegra: pmc: Implement tegra_io_pad_is_powered()
Date: Thu, 12 Jul 2018 15:00:09 +0300
Message-ID: <1531396813-6581-4-git-send-email-avienamo@nvidia.com>
References: <1531396813-6581-1-git-send-email-avienamo@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1531396813-6581-1-git-send-email-avienamo@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>
Cc: Aapo Vienamo <avienamo@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Implement a function to query whether a pad is in deep power down mode.
This will is needed by the pinctrl callbacks.

Signed-off-by: Aapo Vienamo <avienamo@nvidia.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 393ca72..784c182 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1075,6 +1075,22 @@ int tegra_io_pad_power_disable(enum tegra_io_pad id)
 }
 EXPORT_SYMBOL(tegra_io_pad_power_disable);
 
+static int tegra_io_pad_is_powered(enum tegra_io_pad id)
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
+
 int tegra_io_pad_set_voltage(enum tegra_io_pad id,
 			     enum tegra_io_pad_voltage voltage)
 {
-- 
2.7.4
