From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 6/7] phy: tegra: xusb: Use nvmem API
Date: Fri, 30 Aug 2019 00:19:10 +0200
Message-ID: <20190829221911.24876-7-thierry.reding@gmail.com>
References: <20190829221911.24876-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190829221911.24876-1-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, Nagarjuna Kristam <nkristam@nvidia.com>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Instead of using the custom Tegra FUSE API to read the calibration fuses
for the UPHY, use the nvmem API. This makes the dependency between the
two devices more explicit and decouples the drivers from one another.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/phy/tegra/xusb-tegra124.c | 10 +++++-----
 drivers/phy/tegra/xusb-tegra186.c |  7 +++----
 drivers/phy/tegra/xusb-tegra210.c | 10 ++++++----
 3 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra124.c b/drivers/phy/tegra/xusb-tegra124.c
index 98d84920c676..f62905ea4ca5 100644
--- a/drivers/phy/tegra/xusb-tegra124.c
+++ b/drivers/phy/tegra/xusb-tegra124.c
@@ -7,6 +7,7 @@
 #include <linux/io.h>
 #include <linux/mailbox_client.h>
 #include <linux/module.h>
+#include <linux/nvmem-consumer.h>
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
@@ -14,8 +15,6 @@
 #include <linux/reset.h>
 #include <linux/slab.h>
 
-#include <soc/tegra/fuse.h>
-
 #include "xusb.h"
 
 #define FUSE_SKU_CALIB_HS_CURR_LEVEL_PADX_SHIFT(x) ((x) ? 15 : 0)
@@ -1653,13 +1652,14 @@ static const struct tegra_xusb_port_ops tegra124_usb3_port_ops = {
 };
 
 static int
-tegra124_xusb_read_fuse_calibration(struct tegra124_xusb_fuse_calibration *fuse)
+tegra124_xusb_read_fuse_calibration(struct tegra124_xusb_padctl *padctl)
 {
+	struct tegra124_xusb_fuse_calibration *fuse = &padctl->fuse;
 	unsigned int i;
 	int err;
 	u32 value;
 
-	err = tegra_fuse_readl(TEGRA_FUSE_SKU_CALIB_0, &value);
+	err = nvmem_cell_read_u32(padctl->base.dev, "calibration", &value);
 	if (err < 0)
 		return err;
 
@@ -1695,7 +1695,7 @@ tegra124_xusb_padctl_probe(struct device *dev,
 	padctl->base.dev = dev;
 	padctl->base.soc = soc;
 
-	err = tegra124_xusb_read_fuse_calibration(&padctl->fuse);
+	err = tegra124_xusb_read_fuse_calibration(padctl);
 	if (err < 0)
 		return ERR_PTR(err);
 
diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
index 6f3afaf9398f..0663ed00d748 100644
--- a/drivers/phy/tegra/xusb-tegra186.c
+++ b/drivers/phy/tegra/xusb-tegra186.c
@@ -6,6 +6,7 @@
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/nvmem-consumer.h>
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/regulator/consumer.h>
@@ -13,8 +14,6 @@
 #include <linux/clk.h>
 #include <linux/slab.h>
 
-#include <soc/tegra/fuse.h>
-
 #include "xusb.h"
 
 /* FUSE USB_CALIB registers */
@@ -800,7 +799,7 @@ tegra186_xusb_read_fuse_calibration(struct tegra186_xusb_padctl *padctl)
 	if (!level)
 		return -ENOMEM;
 
-	err = tegra_fuse_readl(TEGRA_FUSE_SKU_CALIB_0, &value);
+	err = nvmem_cell_read_u32(dev, "calibration", &value);
 	if (err) {
 		dev_err(dev, "failed to read calibration fuse: %d\n", err);
 		return err;
@@ -819,7 +818,7 @@ tegra186_xusb_read_fuse_calibration(struct tegra186_xusb_padctl *padctl)
 	padctl->calib.hs_term_range_adj = (value >> HS_TERM_RANGE_ADJ_SHIFT) &
 						HS_TERM_RANGE_ADJ_MASK;
 
-	err = tegra_fuse_readl(TEGRA_FUSE_USB_CALIB_EXT_0, &value);
+	err = nvmem_cell_read_u32(dev, "calibration-ext", &value);
 	if (err) {
 		dev_err(dev, "failed to read calibration fuse: %d\n", err);
 		return err;
diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
index 0c0df6897a3b..659b62867012 100644
--- a/drivers/phy/tegra/xusb-tegra210.c
+++ b/drivers/phy/tegra/xusb-tegra210.c
@@ -10,6 +10,7 @@
 #include <linux/io.h>
 #include <linux/mailbox_client.h>
 #include <linux/module.h>
+#include <linux/nvmem-consumer.h>
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
@@ -1946,13 +1947,14 @@ static const struct tegra_xusb_port_ops tegra210_usb3_port_ops = {
 };
 
 static int
-tegra210_xusb_read_fuse_calibration(struct tegra210_xusb_fuse_calibration *fuse)
+tegra210_xusb_read_fuse_calibration(struct tegra210_xusb_padctl *padctl)
 {
+	struct tegra210_xusb_fuse_calibration *fuse = &padctl->fuse;
 	unsigned int i;
 	u32 value;
 	int err;
 
-	err = tegra_fuse_readl(TEGRA_FUSE_SKU_CALIB_0, &value);
+	err = nvmem_cell_read_u32(padctl->base.dev, "calibration", &value);
 	if (err < 0)
 		return err;
 
@@ -1966,7 +1968,7 @@ tegra210_xusb_read_fuse_calibration(struct tegra210_xusb_fuse_calibration *fuse)
 		(value >> FUSE_SKU_CALIB_HS_TERM_RANGE_ADJ_SHIFT) &
 		FUSE_SKU_CALIB_HS_TERM_RANGE_ADJ_MASK;
 
-	err = tegra_fuse_readl(TEGRA_FUSE_USB_CALIB_EXT_0, &value);
+	err = nvmem_cell_read_u32(padctl->base.dev, "calibration-ext", &value);
 	if (err < 0)
 		return err;
 
@@ -1991,7 +1993,7 @@ tegra210_xusb_padctl_probe(struct device *dev,
 	padctl->base.dev = dev;
 	padctl->base.soc = soc;
 
-	err = tegra210_xusb_read_fuse_calibration(&padctl->fuse);
+	err = tegra210_xusb_read_fuse_calibration(padctl);
 	if (err < 0)
 		return ERR_PTR(err);
 
-- 
2.22.0
