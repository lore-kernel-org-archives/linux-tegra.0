From: Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V3 3/8] clk: tegra: Export functions for EMC clock scaling
Date: Fri, 10 May 2019 16:47:14 +0800
Message-ID: <20190510084719.18902-4-josephl@nvidia.com>
References: <20190510084719.18902-1-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190510084719.18902-1-josephl@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob
 Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Joseph Lo <josephl@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Export functions to allow accessing the CAR register required by EMC
clock scaling. These functions will be used to access the CAR register
as part of the scaling sequence.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
	t57478018; bh=emd3R6nSFwL5B+aWA2W+bJqcZ1Jhvwnayz1wGOPSA4M=;
	h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
	 Content-Transfer-Encoding:Content-Type;
	b=fW7ddx6p6BuGNLGA6jAL5AxsojqeQcOg9fZBqbA1Ze45XU3gt7tiL88s8g7gTftA+
	 NdruKRXPLS0r4iOgKqEUf3bmoBP0Kf+l0PQcJu55U5v55XnP6cuKrQw2cmbDaw/g2Z
	 a6DZrAIbUZzi3P3b764ZDmUlRD1sHAWWswZwG3kHwBP0TDOXNjAEVcp7NPm868VOvv
	 aJrdb6VblknwjNkE6OV7ktGB1ODge5YSAePDLNAplZBw+BFnogtESwvf0cFcYVbxCG
	 COh/UNKdlJuOM95IgbZiom9I8NiwuS07bA2WzudSgnMKbhNI6VlFgDu5A6JaPt3Irv
	 N4nuUT4+Ln3Fg=

Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
v3:
- split to 3 patches from the previous version
---
 drivers/clk/tegra/clk-tegra210.c | 36 ++++++++++++++++++++++++++++++++
 include/linux/clk/tegra.h        |  5 +++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 4bfa9bb698be..6d7bb53e9603 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -47,6 +47,7 @@
 #define CLK_SOURCE_LA 0x1f8
 #define CLK_SOURCE_SDMMC2 0x154
 #define CLK_SOURCE_SDMMC4 0x164
+#define CLK_SOURCE_EMC_DLL 0x664
 
 #define PLLC_BASE 0x80
 #define PLLC_OUT 0x84
@@ -234,6 +235,10 @@
 #define RST_DFLL_DVCO 0x2f4
 #define DVFS_DFLL_RESET_SHIFT 0
 
+#define CLK_RST_CONTROLLER_CLK_OUT_ENB_X_SET	0x284
+#define CLK_RST_CONTROLLER_CLK_OUT_ENB_X_CLR	0x288
+#define CLK_OUT_ENB_X_CLK_ENB_EMC_DLL		BIT(14)
+
 #define CLK_RST_CONTROLLER_RST_DEV_Y_SET 0x2a8
 #define CLK_RST_CONTROLLER_RST_DEV_Y_CLR 0x2ac
 
@@ -560,6 +565,37 @@ void tegra210_set_sata_pll_seq_sw(bool state)
 }
 EXPORT_SYMBOL_GPL(tegra210_set_sata_pll_seq_sw);
 
+void tegra210_clk_emc_dll_enable(bool flag)
+{
+	u32 offset = flag ? CLK_RST_CONTROLLER_CLK_OUT_ENB_X_SET :
+		     CLK_RST_CONTROLLER_CLK_OUT_ENB_X_CLR;
+
+	writel_relaxed(CLK_OUT_ENB_X_CLK_ENB_EMC_DLL, clk_base + offset);
+}
+EXPORT_SYMBOL_GPL(tegra210_clk_emc_dll_enable);
+
+void tegra210_clk_emc_dll_update_setting(u32 emc_dll_src_value)
+{
+	writel_relaxed(emc_dll_src_value, clk_base + CLK_SOURCE_EMC_DLL);
+}
+EXPORT_SYMBOL_GPL(tegra210_clk_emc_dll_update_setting);
+
+void tegra210_clk_emc_update_setting(u32 emc_src_value)
+{
+	writel_relaxed(emc_src_value, clk_base + CLK_SOURCE_EMC);
+}
+EXPORT_SYMBOL_GPL(tegra210_clk_emc_update_setting);
+
+u32 tegra210_clk_emc_get_setting(void)
+{
+	u32 val;
+
+	val = readl_relaxed(clk_base + CLK_SOURCE_EMC);
+
+	return val;
+}
+EXPORT_SYMBOL_GPL(tegra210_clk_emc_get_setting);
+
 static void tegra210_generic_mbist_war(struct tegra210_domain_mbist_war *mbist)
 {
 	u32 val;
diff --git a/include/linux/clk/tegra.h b/include/linux/clk/tegra.h
index afb9edfa5d58..b212c332b6e0 100644
--- a/include/linux/clk/tegra.h
+++ b/include/linux/clk/tegra.h
@@ -129,5 +129,10 @@ extern void tegra210_set_sata_pll_seq_sw(bool state);
 extern void tegra210_put_utmipll_in_iddq(void);
 extern void tegra210_put_utmipll_out_iddq(void);
 extern int tegra210_clk_handle_mbist_war(unsigned int id);
+extern void tegra210_clk_emc_dll_enable(bool flag);
+extern void tegra210_clk_emc_dll_update_setting(u32 emc_dll_src_value);
+extern void tegra210_clk_emc_update_setting(u32 emc_src_value);
+extern u32 tegra210_clk_emc_get_setting(void);
+
 
 #endif /* __LINUX_CLK_TEGRA_H_ */
-- 
2.21.0
