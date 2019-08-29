From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 4/7] soc/tegra: fuse: Register cell lookups for compatibility
Date: Fri, 30 Aug 2019 00:19:08 +0200
Message-ID: <20190829221911.24876-5-thierry.reding@gmail.com>
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

Typically nvmem cells would be stored in device tree. However, for
compatibility with device trees that don't contain nvmem cell
definitions, register lookups for cells currently used by consumers.
This allows the consumers to use the same API to query cells from the
device tree or using the legacy mechanism.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/fuse/fuse-tegra.c   |   9 ++
 drivers/soc/tegra/fuse/fuse-tegra30.c | 154 ++++++++++++++++++++++++++
 drivers/soc/tegra/fuse/fuse.h         |   5 +
 3 files changed, 168 insertions(+)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index c6c6a7746046..6a0e25103e1c 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -420,6 +420,15 @@ static int __init tegra_init_fuse(void)
 	pr_debug("Tegra CPU Speedo ID %d, SoC Speedo ID %d\n",
 		 tegra_sku_info.cpu_speedo_id, tegra_sku_info.soc_speedo_id);
 
+	if (fuse->soc->lookups) {
+		size_t size = sizeof(*fuse->lookups) * fuse->soc->num_lookups;
+
+		fuse->lookups = kmemdup(fuse->soc->lookups, size, GFP_KERNEL);
+		if (!fuse->lookups)
+			return -ENOMEM;
+
+		nvmem_add_cell_lookups(fuse->lookups, fuse->soc->num_lookups);
+	}
 
 	return 0;
 }
diff --git a/drivers/soc/tegra/fuse/fuse-tegra30.c b/drivers/soc/tegra/fuse/fuse-tegra30.c
index be9424a87173..b8daaf5b7291 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra30.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra30.c
@@ -8,6 +8,7 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/nvmem-consumer.h>
 #include <linux/of_device.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
@@ -127,6 +128,70 @@ const struct tegra_fuse_soc tegra114_fuse_soc = {
 #endif
 
 #if defined(CONFIG_ARCH_TEGRA_124_SOC) || defined(CONFIG_ARCH_TEGRA_132_SOC)
+static const struct nvmem_cell_lookup tegra124_fuse_lookups[] = {
+	{
+		.nvmem_name = "fuse",
+		.cell_name = "xusb-pad-calibration",
+		.dev_id = "7009f000.padctl",
+		.con_id = "calibration",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "sata-calibration",
+		.dev_id = "70020000.sata",
+		.con_id = "calibration",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "tsensor-common",
+		.dev_id = "700e2000.thermal-sensor",
+		.con_id = "common",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "tsensor-realignment",
+		.dev_id = "700e2000.thermal-sensor",
+		.con_id = "realignment",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "tsensor-cpu0",
+		.dev_id = "700e2000.thermal-sensor",
+		.con_id = "cpu0",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "tsensor-cpu1",
+		.dev_id = "700e2000.thermal-sensor",
+		.con_id = "cpu1",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "tsensor-cpu2",
+		.dev_id = "700e2000.thermal-sensor",
+		.con_id = "cpu2",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "tsensor-cpu3",
+		.dev_id = "700e2000.thermal-sensor",
+		.con_id = "cpu3",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "tsensor-mem0",
+		.dev_id = "700e2000.thermal-sensor",
+		.con_id = "mem0",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "tsensor-mem1",
+		.dev_id = "700e2000.thermal-sensor",
+		.con_id = "mem1",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "tsensor-gpu",
+		.dev_id = "700e2000.thermal-sensor",
+		.con_id = "gpu",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "tsensor-pllx",
+		.dev_id = "700e2000.thermal-sensor",
+		.con_id = "pllx",
+	},
+};
+
 static const struct tegra_fuse_info tegra124_fuse_info = {
 	.read = tegra30_fuse_read,
 	.size = 0x300,
@@ -137,10 +202,81 @@ const struct tegra_fuse_soc tegra124_fuse_soc = {
 	.init = tegra30_fuse_init,
 	.speedo_init = tegra124_init_speedo_data,
 	.info = &tegra124_fuse_info,
+	.lookups = tegra124_fuse_lookups,
+	.num_lookups = ARRAY_SIZE(tegra124_fuse_lookups),
 };
 #endif
 
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
+static const struct nvmem_cell_lookup tegra210_fuse_lookups[] = {
+	{
+		.nvmem_name = "fuse",
+		.cell_name = "tsensor-cpu1",
+		.dev_id = "700e2000.thermal-sensor",
+		.con_id = "cpu1",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "tsensor-cpu2",
+		.dev_id = "700e2000.thermal-sensor",
+		.con_id = "cpu2",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "tsensor-cpu0",
+		.dev_id = "700e2000.thermal-sensor",
+		.con_id = "cpu0",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "xusb-pad-calibration",
+		.dev_id = "7009f000.padctl",
+		.con_id = "calibration",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "tsensor-cpu3",
+		.dev_id = "700e2000.thermal-sensor",
+		.con_id = "cpu3",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "sata-calibration",
+		.dev_id = "70020000.sata",
+		.con_id = "calibration",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "tsensor-gpu",
+		.dev_id = "700e2000.thermal-sensor",
+		.con_id = "gpu",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "tsensor-mem0",
+		.dev_id = "700e2000.thermal-sensor",
+		.con_id = "mem0",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "tsensor-mem1",
+		.dev_id = "700e2000.thermal-sensor",
+		.con_id = "mem1",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "tsensor-pllx",
+		.dev_id = "700e2000.thermal-sensor",
+		.con_id = "pllx",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "tsensor-common",
+		.dev_id = "700e2000.thermal-sensor",
+		.con_id = "common",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "gpu-calibration",
+		.dev_id = "57000000.gpu",
+		.con_id = "calibration",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "xusb-pad-calibration-ext",
+		.dev_id = "7009f000.padctl",
+		.con_id = "calibration-ext",
+	},
+};
+
 static const struct tegra_fuse_info tegra210_fuse_info = {
 	.read = tegra30_fuse_read,
 	.size = 0x300,
@@ -151,10 +287,26 @@ const struct tegra_fuse_soc tegra210_fuse_soc = {
 	.init = tegra30_fuse_init,
 	.speedo_init = tegra210_init_speedo_data,
 	.info = &tegra210_fuse_info,
+	.lookups = tegra210_fuse_lookups,
+	.num_lookups = ARRAY_SIZE(tegra210_fuse_lookups),
 };
 #endif
 
 #if defined(CONFIG_ARCH_TEGRA_186_SOC)
+static const struct nvmem_cell_lookup tegra186_fuse_lookups[] = {
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
 static const struct tegra_fuse_info tegra186_fuse_info = {
 	.read = tegra30_fuse_read,
 	.size = 0x300,
@@ -164,5 +316,7 @@ static const struct tegra_fuse_info tegra186_fuse_info = {
 const struct tegra_fuse_soc tegra186_fuse_soc = {
 	.init = tegra30_fuse_init,
 	.info = &tegra186_fuse_info,
+	.lookups = tegra186_fuse_lookups,
+	.num_lookups = ARRAY_SIZE(tegra186_fuse_lookups),
 };
 #endif
diff --git a/drivers/soc/tegra/fuse/fuse.h b/drivers/soc/tegra/fuse/fuse.h
index 32bf6c070ae7..0f74c2c34af0 100644
--- a/drivers/soc/tegra/fuse/fuse.h
+++ b/drivers/soc/tegra/fuse/fuse.h
@@ -13,6 +13,7 @@
 #include <linux/dmaengine.h>
 #include <linux/types.h>
 
+struct nvmem_cell_lookup;
 struct nvmem_device;
 struct tegra_fuse;
 
@@ -28,6 +29,9 @@ struct tegra_fuse_soc {
 	int (*probe)(struct tegra_fuse *fuse);
 
 	const struct tegra_fuse_info *info;
+
+	const struct nvmem_cell_lookup *lookups;
+	unsigned int num_lookups;
 };
 
 struct tegra_fuse {
@@ -51,6 +55,7 @@ struct tegra_fuse {
 	} apbdma;
 
 	struct nvmem_device *nvmem;
+	struct nvmem_cell_lookup *lookups;
 };
 
 void tegra_init_revision(void);
-- 
2.22.0
