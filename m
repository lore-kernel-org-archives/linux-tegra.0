From: JC Kuo <jckuo@nvidia.com>
Subject: [PATCH v1 1/2] soc/tegra: fuse: Add Tegra194 support
Date: Fri, 3 Jan 2020 16:30:17 +0800
Message-ID: <20200103083018.10575-2-jckuo@nvidia.com>
References: <20200103083018.10575-1-jckuo@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200103083018.10575-1-jckuo@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, thierry.reding@gmail.com, robh@kernel.org, jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, JC Kuo <jckuo@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This commit adds Tegra194 fuse/apbmisc support.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
 drivers/soc/tegra/fuse/fuse-tegra.c    |  3 +++
 drivers/soc/tegra/fuse/fuse-tegra30.c  | 29 ++++++++++++++++++++++++++
 drivers/soc/tegra/fuse/fuse.h          |  4 ++++
 drivers/soc/tegra/fuse/tegra-apbmisc.c |  1 +
 4 files changed, 37 insertions(+)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index 606abbe55bba..802717b9f6a3 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -49,6 +49,9 @@ static struct tegra_fuse *fuse = &(struct tegra_fuse) {
 };
 
 static const struct of_device_id tegra_fuse_match[] = {
+#ifdef CONFIG_ARCH_TEGRA_194_SOC
+	{ .compatible = "nvidia,tegra194-efuse", .data = &tegra194_fuse_soc },
+#endif
 #ifdef CONFIG_ARCH_TEGRA_186_SOC
 	{ .compatible = "nvidia,tegra186-efuse", .data = &tegra186_fuse_soc },
 #endif
diff --git a/drivers/soc/tegra/fuse/fuse-tegra30.c b/drivers/soc/tegra/fuse/fuse-tegra30.c
index b8daaf5b7291..f68f4e1c215d 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra30.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra30.c
@@ -320,3 +320,32 @@ const struct tegra_fuse_soc tegra186_fuse_soc = {
 	.num_lookups = ARRAY_SIZE(tegra186_fuse_lookups),
 };
 #endif
+
+#if defined(CONFIG_ARCH_TEGRA_194_SOC)
+static const struct nvmem_cell_lookup tegra194_fuse_lookups[] = {
+	{
+		.nvmem_name = "fuse",
+		.cell_name = "xusb-pad-calibration",
+		.dev_id = "3520000.padctl",
+		.con_id = "calibration",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "xusb-pad-calibration-ext",
+		.dev_id = "3520000.padctl",
+		.con_id = "calibration-ext",
+	},
+};
+
+static const struct tegra_fuse_info tegra194_fuse_info = {
+	.read = tegra30_fuse_read,
+	.size = 0x300,
+	.spare = 0x280,
+};
+
+const struct tegra_fuse_soc tegra194_fuse_soc = {
+	.init = tegra30_fuse_init,
+	.info = &tegra194_fuse_info,
+	.lookups = tegra194_fuse_lookups,
+	.num_lookups = ARRAY_SIZE(tegra194_fuse_lookups),
+};
+#endif
diff --git a/drivers/soc/tegra/fuse/fuse.h b/drivers/soc/tegra/fuse/fuse.h
index 0f74c2c34af0..94a059e577a1 100644
--- a/drivers/soc/tegra/fuse/fuse.h
+++ b/drivers/soc/tegra/fuse/fuse.h
@@ -108,4 +108,8 @@ extern const struct tegra_fuse_soc tegra210_fuse_soc;
 extern const struct tegra_fuse_soc tegra186_fuse_soc;
 #endif
 
+#ifdef CONFIG_ARCH_TEGRA_194_SOC
+extern const struct tegra_fuse_soc tegra194_fuse_soc;
+#endif
+
 #endif
diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
index a2fd6ccd48f9..7e608f682391 100644
--- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
+++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
@@ -63,6 +63,7 @@ u32 tegra_read_ram_code(void)
 static const struct of_device_id apbmisc_match[] __initconst = {
 	{ .compatible = "nvidia,tegra20-apbmisc", },
 	{ .compatible = "nvidia,tegra186-misc", },
+	{ .compatible = "nvidia,tegra194-misc", },
 	{},
 };
 
-- 
2.17.1
