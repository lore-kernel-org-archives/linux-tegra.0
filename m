From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 7/9] soc/tegra: fuse: Add Tegra234 support
Date: Thu, 16 Jul 2020 16:18:54 +0200
Message-ID: <20200716141856.544718-8-thierry.reding@gmail.com>
References: <20200716141856.544718-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200716141856.544718-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add support for FUSE block found on the Tegra234 SoC, which is largely
similar to the IP found on previous generations.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/soc/tegra/fuse/fuse-tegra.c    |  6 +++++-
 drivers/soc/tegra/fuse/fuse-tegra30.c  | 30 ++++++++++++++++++++++++++
 drivers/soc/tegra/fuse/fuse.h          | 10 ++++++++-
 drivers/soc/tegra/fuse/tegra-apbmisc.c |  1 +
 include/soc/tegra/fuse.h               |  1 +
 5 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index 7e6b6ee59120..94b60a692b51 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -49,6 +49,9 @@ static struct tegra_fuse *fuse = &(struct tegra_fuse) {
 };
 
 static const struct of_device_id tegra_fuse_match[] = {
+#ifdef CONFIG_ARCH_TEGRA_234_SOC
+	{ .compatible = "nvidia,tegra234-efuse", .data = &tegra234_fuse_soc },
+#endif
 #ifdef CONFIG_ARCH_TEGRA_194_SOC
 	{ .compatible = "nvidia,tegra194-efuse", .data = &tegra194_fuse_soc },
 #endif
@@ -326,7 +329,8 @@ const struct attribute_group tegra_soc_attr_group = {
 	.attrs = tegra_soc_attr,
 };
 
-#ifdef CONFIG_ARCH_TEGRA_194_SOC
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
+    IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC)
 static ssize_t platform_show(struct device *dev, struct device_attribute *attr,
 			     char *buf)
 {
diff --git a/drivers/soc/tegra/fuse/fuse-tegra30.c b/drivers/soc/tegra/fuse/fuse-tegra30.c
index 85accef41fa1..9ea7f0168457 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra30.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra30.c
@@ -356,3 +356,33 @@ const struct tegra_fuse_soc tegra194_fuse_soc = {
 	.soc_attr_group = &tegra194_soc_attr_group,
 };
 #endif
+
+#if defined(CONFIG_ARCH_TEGRA_234_SOC)
+static const struct nvmem_cell_lookup tegra234_fuse_lookups[] = {
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
+static const struct tegra_fuse_info tegra234_fuse_info = {
+	.read = tegra30_fuse_read,
+	.size = 0x300,
+	.spare = 0x280,
+};
+
+const struct tegra_fuse_soc tegra234_fuse_soc = {
+	.init = tegra30_fuse_init,
+	.info = &tegra234_fuse_info,
+	.lookups = tegra234_fuse_lookups,
+	.num_lookups = ARRAY_SIZE(tegra234_fuse_lookups),
+	.soc_attr_group = &tegra194_soc_attr_group,
+};
+#endif
diff --git a/drivers/soc/tegra/fuse/fuse.h b/drivers/soc/tegra/fuse/fuse.h
index 9d4fc315a007..e057a58e2060 100644
--- a/drivers/soc/tegra/fuse/fuse.h
+++ b/drivers/soc/tegra/fuse/fuse.h
@@ -115,9 +115,17 @@ extern const struct tegra_fuse_soc tegra210_fuse_soc;
 extern const struct tegra_fuse_soc tegra186_fuse_soc;
 #endif
 
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
+    IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC)
+extern const struct attribute_group tegra194_soc_attr_group;
+#endif
+
 #ifdef CONFIG_ARCH_TEGRA_194_SOC
 extern const struct tegra_fuse_soc tegra194_fuse_soc;
-extern const struct attribute_group tegra194_soc_attr_group;
+#endif
+
+#ifdef CONFIG_ARCH_TEGRA_234_SOC
+extern const struct tegra_fuse_soc tegra234_fuse_soc;
 #endif
 
 #endif
diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
index be6b7fc169ca..6aeac5ea2d70 100644
--- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
+++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
@@ -56,6 +56,7 @@ bool tegra_is_silicon(void)
 {
 	switch (tegra_get_chip_id()) {
 	case TEGRA194:
+	case TEGRA234:
 		if (tegra_get_platform() == 0)
 			return true;
 
diff --git a/include/soc/tegra/fuse.h b/include/soc/tegra/fuse.h
index a9db917a1d06..c702bd2911bc 100644
--- a/include/soc/tegra/fuse.h
+++ b/include/soc/tegra/fuse.h
@@ -14,6 +14,7 @@
 #define TEGRA210	0x21
 #define TEGRA186	0x18
 #define TEGRA194	0x19
+#define TEGRA234	0x23
 
 #define TEGRA_FUSE_SKU_CALIB_0	0xf0
 #define TEGRA30_FUSE_SATA_CALIB	0x124
-- 
2.27.0
