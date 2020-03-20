From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] soc/tegra: fuse: Add custom SoC attributes
Date: Fri, 20 Mar 2020 11:37:16 +0000
Message-ID: <20200320113716.6105-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add a custom SoC attribute for Tegra to expose the HIDREV register
contents to userspace via the sysfs. This register provides additional
details about the fabrication and versioning of the device. Exposing
this information is useful for identifying the exact device revision and
device type.

Please note that the fields in this register vary depending on the Tegra
generation and so instead of exposing the individual fields, just expose
the entire contents of the register. Details of the register fields can
be found in the Technical Reference Manual for each Tegra device.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/soc/tegra/fuse/fuse-tegra.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index 802717b9f6a3..217e326da232 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -300,6 +300,24 @@ static void tegra_enable_fuse_clk(void __iomem *base)
 	writel(reg, base + 0x14);
 }
 
+static ssize_t tegra_soc_hidrev_show(struct device *dev,
+				     struct device_attribute *attr,
+				     char *buf)
+{
+	return sprintf(buf, "%d\n", tegra_read_chipid());
+}
+
+static DEVICE_ATTR(hidrev, S_IRUGO, tegra_soc_hidrev_show,  NULL);
+
+static struct attribute *tegra_soc_attr[] = {
+	&dev_attr_hidrev.attr,
+	NULL,
+};
+
+static const struct attribute_group tegra_soc_attr_group = {
+	.attrs = tegra_soc_attr,
+};
+
 struct device * __init tegra_soc_device_register(void)
 {
 	struct soc_device_attribute *attr;
@@ -312,6 +330,7 @@ struct device * __init tegra_soc_device_register(void)
 	attr->family = kasprintf(GFP_KERNEL, "Tegra");
 	attr->revision = kasprintf(GFP_KERNEL, "%d", tegra_sku_info.revision);
 	attr->soc_id = kasprintf(GFP_KERNEL, "%u", tegra_get_chip_id());
+	attr->custom_attr_group = &tegra_soc_attr_group;
 
 	dev = soc_device_register(attr);
 	if (IS_ERR(dev)) {
-- 
2.17.1
