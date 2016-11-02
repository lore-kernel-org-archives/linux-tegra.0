From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 2/3] soc/tegra: pmc: Add interface to get IO pad power status
Date: Wed, 2 Nov 2016 14:29:48 +0530
Message-ID: <1478077189-24426-3-git-send-email-ldewangan@nvidia.com>
References: <1478077189-24426-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478077189-24426-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: swarren@wwwdotorg.org, thierry.reding@gmail.com
Cc: gnurou@gmail.com, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add API to get the IO pad power status of the Tegra IO pads.
This will help client driver to get the current power status
of IO pads for handling IO pad power.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
Based on the branch
	(https://github.com/thierryreding/linux/tree/tegra186).
This was sent earlier but not applied so resending it as new patch after
rebasing it.

 drivers/soc/tegra/pmc.c | 22 ++++++++++++++++++++++
 include/soc/tegra/pmc.h |  6 ++++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index bb3715f..44546bd 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1063,6 +1063,28 @@ int tegra_io_pad_power_disable(enum tegra_io_pad id)
 }
 EXPORT_SYMBOL(tegra_io_pad_power_disable);
 
+int tegra_io_pad_power_get_status(enum tegra_io_pad id)
+{
+	const struct tegra_io_pad_soc *pad;
+	unsigned long status;
+	u32 value;
+	int bit;
+
+	pad = tegra_io_pad_find(pmc, id);
+	if (!pad)
+		return -ENOENT;
+
+	if (pad->dpd == UINT_MAX)
+		return -ENOTSUPP;
+
+	status = (pad->dpd < 32) ? IO_DPD_STATUS : IO_DPD2_STATUS;
+	bit = pad->dpd % 32;
+	value = tegra_pmc_readl(status);
+
+	return !!(value & BIT(bit));
+}
+EXPORT_SYMBOL(tegra_io_pad_power_get_status);
+
 int tegra_io_pad_set_voltage(enum tegra_io_pad id,
 			     enum tegra_io_pad_voltage voltage)
 {
diff --git a/include/soc/tegra/pmc.h b/include/soc/tegra/pmc.h
index 9c314a6..18cf172 100644
--- a/include/soc/tegra/pmc.h
+++ b/include/soc/tegra/pmc.h
@@ -152,6 +152,7 @@ int tegra_powergate_sequence_power_up(unsigned int id, struct clk *clk,
 
 int tegra_io_pad_power_enable(enum tegra_io_pad id);
 int tegra_io_pad_power_disable(enum tegra_io_pad id);
+int tegra_io_pad_power_get_status(enum tegra_io_pad id);
 int tegra_io_pad_set_voltage(enum tegra_io_pad id,
 			     enum tegra_io_pad_voltage voltage);
 int tegra_io_pad_get_voltage(enum tegra_io_pad id);
@@ -193,6 +194,11 @@ static inline int tegra_io_pad_power_disable(enum tegra_io_pad id)
 	return -ENOSYS;
 }
 
+static inline int tegra_io_pad_power_get_status(enum tegra_io_pad id)
+{
+	return -ENOSYS;
+}
+
 static inline int tegra_io_pad_set_voltage(enum tegra_io_pad id,
 					   enum tegra_io_pad_voltage voltage)
 {
-- 
2.1.4
