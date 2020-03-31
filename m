From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 1/3] soc/tegra: fuse: Add custom SoC attributes
Date: Tue, 31 Mar 2020 11:33:39 +0100
Message-ID: <20200331103341.19571-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add a custom SoC attribute for Tegra to expose the HIDREV register
fields to userspace via the sysfs. This register provides additional
details about the type of device (eg, silicon, FPGA, etc) as well as
revision. Exposing this information is useful for identifying the
exact device revision and device type.

For Tegra devices up until Tegra186, the majorrev and minorrev fields of
the HIDREV register are used to determine the device revision and device
type. For Tegra194, the majorrev and minorrev fields only determine the
revision. Starting with Tegra194, there is an additional field,
pre_si_platform (which occupies bits 20-23), that now determines device
type. Therefore, for all Tegra devices, add a custom SoC attribute for
the majorrev and minorrev fields and for Tegra194 add an additional
attribute for the pre_si_platform field.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/soc/tegra/fuse/fuse-tegra.c    | 51 ++++++++++++++++++++++++++
 drivers/soc/tegra/fuse/fuse-tegra20.c  |  1 +
 drivers/soc/tegra/fuse/fuse-tegra30.c  |  6 +++
 drivers/soc/tegra/fuse/fuse.h          |  8 ++++
 drivers/soc/tegra/fuse/tegra-apbmisc.c | 10 +++++
 5 files changed, 76 insertions(+)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index 802717b9f6a3..639734dca5df 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -300,6 +300,56 @@ static void tegra_enable_fuse_clk(void __iomem *base)
 	writel(reg, base + 0x14);
 }
 
+static ssize_t tegra_soc_majorrev_show(struct device *dev,
+				       struct device_attribute *attr,
+				       char *buf)
+{
+	return sprintf(buf, "%d\n", tegra_get_major_rev());
+}
+
+static DEVICE_ATTR(majorrev, S_IRUGO, tegra_soc_majorrev_show,  NULL);
+
+static ssize_t tegra_soc_minorrev_show(struct device *dev,
+				       struct device_attribute *attr,
+				       char *buf)
+{
+	return sprintf(buf, "%d\n", tegra_get_minor_rev());
+}
+
+static DEVICE_ATTR(minorrev, S_IRUGO, tegra_soc_minorrev_show,  NULL);
+
+static struct attribute *tegra_soc_attr[] = {
+	&dev_attr_majorrev.attr,
+	&dev_attr_minorrev.attr,
+	NULL,
+};
+
+const struct attribute_group tegra_soc_attr_group = {
+	.attrs = tegra_soc_attr,
+};
+
+#ifdef CONFIG_ARCH_TEGRA_194_SOC
+static ssize_t tegra_soc_pre_si_plat_show(struct device *dev,
+					  struct device_attribute *attr,
+					  char *buf)
+{
+	return sprintf(buf, "%d\n", (tegra_read_chipid() >> 20) & 0xf);
+}
+
+static DEVICE_ATTR(pre_si_platform, S_IRUGO, tegra_soc_pre_si_plat_show,  NULL);
+
+static struct attribute *tegra194_soc_attr[] = {
+	&dev_attr_majorrev.attr,
+	&dev_attr_minorrev.attr,
+	&dev_attr_pre_si_platform.attr,
+	NULL,
+};
+
+const struct attribute_group tegra194_soc_attr_group = {
+	.attrs = tegra194_soc_attr,
+};
+#endif
+
 struct device * __init tegra_soc_device_register(void)
 {
 	struct soc_device_attribute *attr;
@@ -312,6 +362,7 @@ struct device * __init tegra_soc_device_register(void)
 	attr->family = kasprintf(GFP_KERNEL, "Tegra");
 	attr->revision = kasprintf(GFP_KERNEL, "%d", tegra_sku_info.revision);
 	attr->soc_id = kasprintf(GFP_KERNEL, "%u", tegra_get_chip_id());
+	attr->custom_attr_group = fuse->soc->soc_attr_group;
 
 	dev = soc_device_register(attr);
 	if (IS_ERR(dev)) {
diff --git a/drivers/soc/tegra/fuse/fuse-tegra20.c b/drivers/soc/tegra/fuse/fuse-tegra20.c
index d4aef9c4a94c..16aaa28573ac 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra20.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra20.c
@@ -164,4 +164,5 @@ const struct tegra_fuse_soc tegra20_fuse_soc = {
 	.speedo_init = tegra20_init_speedo_data,
 	.probe = tegra20_fuse_probe,
 	.info = &tegra20_fuse_info,
+	.soc_attr_group = &tegra_soc_attr_group,
 };
diff --git a/drivers/soc/tegra/fuse/fuse-tegra30.c b/drivers/soc/tegra/fuse/fuse-tegra30.c
index e6037f900fb7..85accef41fa1 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra30.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra30.c
@@ -111,6 +111,7 @@ const struct tegra_fuse_soc tegra30_fuse_soc = {
 	.init = tegra30_fuse_init,
 	.speedo_init = tegra30_init_speedo_data,
 	.info = &tegra30_fuse_info,
+	.soc_attr_group = &tegra_soc_attr_group,
 };
 #endif
 
@@ -125,6 +126,7 @@ const struct tegra_fuse_soc tegra114_fuse_soc = {
 	.init = tegra30_fuse_init,
 	.speedo_init = tegra114_init_speedo_data,
 	.info = &tegra114_fuse_info,
+	.soc_attr_group = &tegra_soc_attr_group,
 };
 #endif
 
@@ -205,6 +207,7 @@ const struct tegra_fuse_soc tegra124_fuse_soc = {
 	.info = &tegra124_fuse_info,
 	.lookups = tegra124_fuse_lookups,
 	.num_lookups = ARRAY_SIZE(tegra124_fuse_lookups),
+	.soc_attr_group = &tegra_soc_attr_group,
 };
 #endif
 
@@ -290,6 +293,7 @@ const struct tegra_fuse_soc tegra210_fuse_soc = {
 	.info = &tegra210_fuse_info,
 	.lookups = tegra210_fuse_lookups,
 	.num_lookups = ARRAY_SIZE(tegra210_fuse_lookups),
+	.soc_attr_group = &tegra_soc_attr_group,
 };
 #endif
 
@@ -319,6 +323,7 @@ const struct tegra_fuse_soc tegra186_fuse_soc = {
 	.info = &tegra186_fuse_info,
 	.lookups = tegra186_fuse_lookups,
 	.num_lookups = ARRAY_SIZE(tegra186_fuse_lookups),
+	.soc_attr_group = &tegra_soc_attr_group,
 };
 #endif
 
@@ -348,5 +353,6 @@ const struct tegra_fuse_soc tegra194_fuse_soc = {
 	.info = &tegra194_fuse_info,
 	.lookups = tegra194_fuse_lookups,
 	.num_lookups = ARRAY_SIZE(tegra194_fuse_lookups),
+	.soc_attr_group = &tegra194_soc_attr_group,
 };
 #endif
diff --git a/drivers/soc/tegra/fuse/fuse.h b/drivers/soc/tegra/fuse/fuse.h
index 94a059e577a1..9d4fc315a007 100644
--- a/drivers/soc/tegra/fuse/fuse.h
+++ b/drivers/soc/tegra/fuse/fuse.h
@@ -32,6 +32,8 @@ struct tegra_fuse_soc {
 
 	const struct nvmem_cell_lookup *lookups;
 	unsigned int num_lookups;
+
+	const struct attribute_group *soc_attr_group;
 };
 
 struct tegra_fuse {
@@ -64,6 +66,11 @@ void tegra_init_apbmisc(void);
 bool __init tegra_fuse_read_spare(unsigned int spare);
 u32 __init tegra_fuse_read_early(unsigned int offset);
 
+u8 tegra_get_major_rev(void);
+u8 tegra_get_minor_rev(void);
+
+extern const struct attribute_group tegra_soc_attr_group;
+
 #ifdef CONFIG_ARCH_TEGRA_2x_SOC
 void tegra20_init_speedo_data(struct tegra_sku_info *sku_info);
 #endif
@@ -110,6 +117,7 @@ extern const struct tegra_fuse_soc tegra186_fuse_soc;
 
 #ifdef CONFIG_ARCH_TEGRA_194_SOC
 extern const struct tegra_fuse_soc tegra194_fuse_soc;
+extern const struct attribute_group tegra194_soc_attr_group;
 #endif
 
 #endif
diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
index 089d9340564b..44a154ca16b5 100644
--- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
+++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
@@ -37,6 +37,16 @@ u8 tegra_get_chip_id(void)
 	return (tegra_read_chipid() >> 8) & 0xff;
 }
 
+u8 tegra_get_major_rev(void)
+{
+	return (tegra_read_chipid() >> 4) & 0xf;
+}
+
+u8 tegra_get_minor_rev(void)
+{
+	return (tegra_read_chipid() >> 16) & 0xf;
+}
+
 u32 tegra_read_straps(void)
 {
 	WARN(!chipid, "Tegra ABP MISC not yet available\n");
-- 
2.17.1
