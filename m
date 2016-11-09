From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 2/4] soc/tegra: pmc: Add interface to get IO pad power status
Date: Wed, 9 Nov 2016 18:39:20 +0530
Message-ID: <1478696962-11831-3-git-send-email-ldewangan@nvidia.com>
References: <1478696962-11831-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478696962-11831-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add API to get the IO pad power status of the Tegra IO pads.
This will help client driver to get the current power status
of IO pads for handling IO pad power.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

---
Changes from V1:
 None
---
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
