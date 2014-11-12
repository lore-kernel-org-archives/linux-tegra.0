From: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH v4 03/13] soc/tegra: Add ram code reader helper
Date: Wed, 12 Nov 2014 08:56:26 +0100
Message-ID: <1415779051-26410-4-git-send-email-tomeu.vizoso@collabora.com>
References: <1415779051-26410-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415779051-26410-1-git-send-email-tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, mikko.perttunen-/1wQRMveznE@public.gmane.org, acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Needed for the EMC and MC drivers to know what timings from the DT to use.

Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>

---

v4: Replace magic number with PMC_STRAPPING_OPT_A_RAM_CODE_SHIFT
---
 drivers/soc/tegra/fuse/tegra-apbmisc.c | 19 +++++++++++++++++++
 include/soc/tegra/fuse.h               |  1 +
 2 files changed, 20 insertions(+)

diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
index 3bf5aba..dc96a62 100644
--- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
+++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
@@ -28,8 +28,13 @@
 #define APBMISC_SIZE	0x64
 #define FUSE_SKU_INFO	0x10
 
+#define PMC_STRAPPING_OPT_A_RAM_CODE_SHIFT	4
+#define PMC_STRAPPING_OPT_A_RAM_CODE_MASK_LONG	(0xf << PMC_STRAPPING_OPT_A_RAM_CODE_SHIFT)
+#define PMC_STRAPPING_OPT_A_RAM_CODE_MASK_SHORT	(0x3 << PMC_STRAPPING_OPT_A_RAM_CODE_SHIFT)
+
 static void __iomem *apbmisc_base;
 static void __iomem *strapping_base;
+static bool          long_ram_code;
 
 u32 tegra_read_chipid(void)
 {
@@ -54,6 +59,18 @@ u32 tegra_read_straps(void)
 		return 0;
 }
 
+u32 tegra_read_ram_code(void)
+{
+	u32 straps = tegra_read_straps();
+
+	if (long_ram_code)
+		straps &= PMC_STRAPPING_OPT_A_RAM_CODE_MASK_LONG;
+	else
+		straps &= PMC_STRAPPING_OPT_A_RAM_CODE_MASK_SHORT;
+
+	return straps >> PMC_STRAPPING_OPT_A_RAM_CODE_SHIFT;
+}
+
 static const struct of_device_id apbmisc_match[] __initconst = {
 	{ .compatible = "nvidia,tegra20-apbmisc", },
 	{},
@@ -112,4 +129,6 @@ void __init tegra_init_apbmisc(void)
 	strapping_base = of_iomap(np, 1);
 	if (!strapping_base)
 		pr_err("ioremap tegra strapping_base failed\n");
+
+	long_ram_code = of_property_read_bool(np, "nvidia,long-ram-code");
 }
diff --git a/include/soc/tegra/fuse.h b/include/soc/tegra/fuse.h
index 8e12494..4ad6fd9 100644
--- a/include/soc/tegra/fuse.h
+++ b/include/soc/tegra/fuse.h
@@ -55,6 +55,7 @@ struct tegra_sku_info {
 };
 
 u32 tegra_read_straps(void);
+u32 tegra_read_ram_code(void);
 u32 tegra_read_chipid(void);
 int tegra_fuse_readl(unsigned long offset, u32 *value);
 
-- 
1.9.3
