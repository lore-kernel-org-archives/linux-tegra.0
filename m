From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 2/2] memory: tegra: Introduce memory client hot reset API
Date: Wed, 13 Dec 2017 06:12:31 +0300
Message-ID: <b9cafa40656c384f47772488d0c1cb7ea1555cc7.1513134137.git.digetx@gmail.com>
References: <1b8256265365e9b6dd431aeaf96f2ee9d39f484b.1513134137.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1b8256265365e9b6dd431aeaf96f2ee9d39f484b.1513134137.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <1b8256265365e9b6dd431aeaf96f2ee9d39f484b.1513134137.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <1b8256265365e9b6dd431aeaf96f2ee9d39f484b.1513134137.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

In order to reset busy HW properly, memory controller needs to be
involved, otherwise it possible to get corrupted memory if HW was reset
during DMA. Introduce memory client 'hot reset' API that will be used
for resetting busy HW. The primary users are memory clients related to
video (decoder/encoder/camera) and graphics (2d/3d).

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/memory/tegra/mc.c       | 172 ++++++++++++++++++++++++++++++++++++++++
 drivers/memory/tegra/tegra114.c |  25 ++++++
 drivers/memory/tegra/tegra124.c |  32 ++++++++
 drivers/memory/tegra/tegra20.c  |  23 ++++++
 drivers/memory/tegra/tegra210.c |  27 +++++++
 drivers/memory/tegra/tegra30.c  |  25 ++++++
 include/soc/tegra/mc.h          |  60 ++++++++++++++
 7 files changed, 364 insertions(+)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 187a9005351b..510519028728 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -7,11 +7,13 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/sort.h>
 
@@ -81,6 +83,139 @@ static const struct of_device_id tegra_mc_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tegra_mc_of_match);
 
+static int terga_mc_flush_dma(struct tegra_mc *mc, unsigned int id)
+{
+	unsigned int hw_id = mc->soc->modules[id].hw_id;
+	u32 val, reg_poll = mc->soc->reg_client_flush_status;
+	int retries = 3;
+
+	/* block clients DMA requests */
+	if (mc->soc->tegra20) {
+		val = mc_readl(mc, mc->soc->reg_client_ctrl) & ~BIT(hw_id);
+		mc_writel(mc, val, mc->soc->reg_client_ctrl);
+	} else {
+		val = mc_readl(mc, mc->soc->reg_client_ctrl) | BIT(hw_id);
+		mc_writel(mc, val, mc->soc->reg_client_ctrl);
+	}
+
+	/* wait for completion of the outstanding DMA requests */
+	if (mc->soc->tegra20) {
+		while (mc_readl(mc, reg_poll + hw_id * sizeof(u32)) != 0) {
+			if (!retries--)
+				return -EBUSY;
+
+			usleep_range(1000, 2000);
+		}
+	} else {
+		while ((mc_readl(mc, reg_poll) & BIT(hw_id)) == 0) {
+			if (!retries--)
+				return -EBUSY;
+
+			usleep_range(1000, 2000);
+		}
+	}
+
+	return 0;
+}
+
+static int terga_mc_unblock_dma(struct tegra_mc *mc, unsigned int id)
+{
+	unsigned int hw_id = mc->soc->modules[id].hw_id;
+	u32 val;
+
+	if (mc->soc->tegra20) {
+		val = mc_readl(mc, mc->soc->reg_client_ctrl) | BIT(hw_id);
+		mc_writel(mc, val, mc->soc->reg_client_ctrl);
+	} else {
+		val = mc_readl(mc, mc->soc->reg_client_ctrl) & ~BIT(hw_id);
+		mc_writel(mc, val, mc->soc->reg_client_ctrl);
+	}
+
+	return 0;
+}
+
+static int terga_mc_hotreset_assert(struct tegra_mc *mc, unsigned int id)
+{
+	unsigned int hw_id = mc->soc->modules[id].hw_id;
+	u32 val;
+
+	if (mc->soc->tegra20) {
+		val = mc_readl(mc, mc->soc->reg_client_hotresetn) & ~BIT(hw_id);
+		mc_writel(mc, val, mc->soc->reg_client_hotresetn);
+	}
+
+	return 0;
+}
+
+static int terga_mc_hotreset_deassert(struct tegra_mc *mc, unsigned int id)
+{
+	unsigned int hw_id = mc->soc->modules[id].hw_id;
+	u32 val;
+
+	if (mc->soc->tegra20) {
+		val = mc_readl(mc, mc->soc->reg_client_hotresetn) | BIT(hw_id);
+		mc_writel(mc, val, mc->soc->reg_client_hotresetn);
+	}
+
+	return 0;
+}
+
+static int tegra_mc_hot_reset(struct tegra_mc *mc, unsigned int id,
+			      struct reset_control *rst)
+{
+	int err;
+
+	/*
+	 * Block clients DMA requests and wait for completion of the
+	 * outstanding requests.
+	 */
+	err = terga_mc_flush_dma(mc, id);
+	if (err) {
+		dev_err(mc->dev, "Failed to flush DMA: %d\n", err);
+		return err;
+	}
+
+	/* put in reset HW that corresponds to the memory client */
+	err = reset_control_assert(rst);
+	if (err) {
+		dev_err(mc->dev, "Failed to assert HW reset: %d\n", err);
+		return err;
+	}
+
+	/* clear the client requests sitting before arbitration */
+	err = terga_mc_hotreset_assert(mc, id);
+	if (err) {
+		dev_err(mc->dev, "Failed to hot reset client: %d\n", err);
+		return err;
+	}
+
+	/* make sure that reset is propagated */
+	usleep_range(4000, 6000);
+
+	/* take out client from hot reset */
+	err = terga_mc_hotreset_deassert(mc, id);
+	if (err) {
+		dev_err(mc->dev, "Failed to deassert hot reset: %d\n", err);
+		return err;
+	}
+
+	/* take out from reset corresponding clients HW */
+	err = reset_control_deassert(rst);
+	if (err) {
+		dev_err(mc->dev, "Failed to deassert HW reset: %d\n", err);
+		return err;
+	}
+
+	/* allow new DMA requests to proceed to arbitration */
+	err = terga_mc_unblock_dma(mc, id);
+	if (err) {
+		dev_err(mc->dev, "Failed to unblock client: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
 static int tegra_mc_setup_latency_allowance(struct tegra_mc *mc)
 {
 	unsigned long long tick;
@@ -416,6 +551,7 @@ static int tegra_mc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	platform_set_drvdata(pdev, mc);
+	mutex_init(&mc->lock);
 	mc->soc = match->data;
 	mc->dev = &pdev->dev;
 
@@ -499,6 +635,42 @@ static struct platform_driver tegra_mc_driver = {
 	.probe = tegra_mc_probe,
 };
 
+static int tegra_mc_match(struct device *dev, void *data)
+{
+	return of_match_node(tegra_mc_of_match, dev->of_node) != NULL;
+}
+
+static struct tegra_mc *tegra_mc_find_device(void)
+{
+	struct device *dev;
+
+	dev = driver_find_device(&tegra_mc_driver.driver, NULL, NULL,
+				 tegra_mc_match);
+	if (!dev)
+		return NULL;
+
+	return dev_get_drvdata(dev);
+}
+
+int tegra_memory_client_hotreset(unsigned int id, struct reset_control *rst)
+{
+	struct tegra_mc *mc;
+	int ret;
+
+	mc = tegra_mc_find_device();
+	if (!mc)
+		return -ENODEV;
+
+	if (id >= mc->soc->num_modules || !mc->soc->modules[id].valid)
+		return -EINVAL;
+
+	mutex_lock(&mc->lock);
+	ret = tegra_mc_hot_reset(mc, id, rst);
+	mutex_unlock(&mc->lock);
+
+	return ret;
+}
+
 static int tegra_mc_init(void)
 {
 	return platform_driver_register(&tegra_mc_driver);
diff --git a/drivers/memory/tegra/tegra114.c b/drivers/memory/tegra/tegra114.c
index ba8fff3d66a6..c90325bd0c75 100644
--- a/drivers/memory/tegra/tegra114.c
+++ b/drivers/memory/tegra/tegra114.c
@@ -923,6 +923,27 @@ static const struct tegra_smmu_soc tegra114_smmu_soc = {
 	.num_asids = 4,
 };
 
+static const struct tegra_mc_module tegra114_mc_modules[] = {
+	[TEGRA_MEMORY_CLIENT_AFI]	= { .hw_id =  0, .valid = true },
+	[TEGRA_MEMORY_CLIENT_AVP]	= { .hw_id =  1, .valid = true },
+	[TEGRA_MEMORY_CLIENT_DC]	= { .hw_id =  2, .valid = true },
+	[TEGRA_MEMORY_CLIENT_DCB]	= { .hw_id =  3, .valid = true },
+	[TEGRA_MEMORY_CLIENT_EPP]	= { .hw_id =  4, .valid = true },
+	[TEGRA_MEMORY_CLIENT_2D]	= { .hw_id =  5, .valid = true },
+	[TEGRA_MEMORY_CLIENT_HOST1X]	= { .hw_id =  6, .valid = true },
+	[TEGRA_MEMORY_CLIENT_HDA]	= { .hw_id =  7, .valid = true },
+	[TEGRA_MEMORY_CLIENT_ISP]	= { .hw_id =  8, .valid = true },
+	[TEGRA_MEMORY_CLIENT_MPCORE]	= { .hw_id =  9, .valid = true },
+	[TEGRA_MEMORY_CLIENT_MPCORELP]	= { .hw_id = 10, .valid = true },
+	[TEGRA_MEMORY_CLIENT_MPE]	= { .hw_id = 11, .valid = true },
+	[TEGRA_MEMORY_CLIENT_3D0]	= { .hw_id = 12, .valid = true },
+	[TEGRA_MEMORY_CLIENT_3D1]	= { .hw_id = 13, .valid = true },
+	[TEGRA_MEMORY_CLIENT_PPCS]	= { .hw_id = 14, .valid = true },
+	[TEGRA_MEMORY_CLIENT_SATA]	= { .hw_id = 15, .valid = true },
+	[TEGRA_MEMORY_CLIENT_VDE]	= { .hw_id = 16, .valid = true },
+	[TEGRA_MEMORY_CLIENT_VI]	= { .hw_id = 17, .valid = true },
+};
+
 const struct tegra_mc_soc tegra114_mc_soc = {
 	.clients = tegra114_mc_clients,
 	.num_clients = ARRAY_SIZE(tegra114_mc_clients),
@@ -930,4 +951,8 @@ const struct tegra_mc_soc tegra114_mc_soc = {
 	.atom_size = 32,
 	.client_id_mask = 0x7f,
 	.smmu = &tegra114_smmu_soc,
+	.modules = tegra114_mc_modules,
+	.num_modules = ARRAY_SIZE(tegra114_mc_modules),
+	.reg_client_ctrl = 0x200,
+	.reg_client_flush_status = 0x204,
 };
diff --git a/drivers/memory/tegra/tegra124.c b/drivers/memory/tegra/tegra124.c
index 5a58e440f4a7..722251c365e9 100644
--- a/drivers/memory/tegra/tegra124.c
+++ b/drivers/memory/tegra/tegra124.c
@@ -999,6 +999,30 @@ static const struct tegra_smmu_swgroup tegra124_swgroups[] = {
 	{ .name = "vi",        .swgroup = TEGRA_SWGROUP_VI,        .reg = 0x280 },
 };
 
+static const struct tegra_mc_module tegra124_mc_modules[] = {
+	[TEGRA_MEMORY_CLIENT_AFI]	= { .hw_id =  0, .valid = true },
+	[TEGRA_MEMORY_CLIENT_AVP]	= { .hw_id =  1, .valid = true },
+	[TEGRA_MEMORY_CLIENT_DC]	= { .hw_id =  2, .valid = true },
+	[TEGRA_MEMORY_CLIENT_DCB]	= { .hw_id =  3, .valid = true },
+	[TEGRA_MEMORY_CLIENT_HOST1X]	= { .hw_id =  6, .valid = true },
+	[TEGRA_MEMORY_CLIENT_HDA]	= { .hw_id =  7, .valid = true },
+	[TEGRA_MEMORY_CLIENT_ISP2]	= { .hw_id =  8, .valid = true },
+	[TEGRA_MEMORY_CLIENT_MPCORE]	= { .hw_id =  9, .valid = true },
+	[TEGRA_MEMORY_CLIENT_MPCORELP]	= { .hw_id = 10, .valid = true },
+	[TEGRA_MEMORY_CLIENT_MSENC]	= { .hw_id = 11, .valid = true },
+	[TEGRA_MEMORY_CLIENT_PPCS]	= { .hw_id = 14, .valid = true },
+	[TEGRA_MEMORY_CLIENT_SATA]	= { .hw_id = 15, .valid = true },
+	[TEGRA_MEMORY_CLIENT_VDE]	= { .hw_id = 16, .valid = true },
+	[TEGRA_MEMORY_CLIENT_VI]	= { .hw_id = 17, .valid = true },
+	[TEGRA_MEMORY_CLIENT_VIC]	= { .hw_id = 18, .valid = true },
+	[TEGRA_MEMORY_CLIENT_XUSB_HOST]	= { .hw_id = 19, .valid = true },
+	[TEGRA_MEMORY_CLIENT_XUSB_DEV]	= { .hw_id = 20, .valid = true },
+	[TEGRA_MEMORY_CLIENT_TSEC]	= { .hw_id = 22, .valid = true },
+	[TEGRA_MEMORY_CLIENT_SDMMC1]	= { .hw_id = 29, .valid = true },
+	[TEGRA_MEMORY_CLIENT_SDMMC2]	= { .hw_id = 30, .valid = true },
+	[TEGRA_MEMORY_CLIENT_SDMMC3]	= { .hw_id = 31, .valid = true },
+};
+
 #ifdef CONFIG_ARCH_TEGRA_124_SOC
 static const struct tegra_smmu_soc tegra124_smmu_soc = {
 	.clients = tegra124_mc_clients,
@@ -1020,6 +1044,10 @@ const struct tegra_mc_soc tegra124_mc_soc = {
 	.smmu = &tegra124_smmu_soc,
 	.emem_regs = tegra124_mc_emem_regs,
 	.num_emem_regs = ARRAY_SIZE(tegra124_mc_emem_regs),
+	.modules = tegra124_mc_modules,
+	.num_modules = ARRAY_SIZE(tegra124_mc_modules),
+	.reg_client_ctrl = 0x200,
+	.reg_client_flush_status = 0x204,
 };
 #endif /* CONFIG_ARCH_TEGRA_124_SOC */
 
@@ -1042,5 +1070,9 @@ const struct tegra_mc_soc tegra132_mc_soc = {
 	.atom_size = 32,
 	.client_id_mask = 0x7f,
 	.smmu = &tegra132_smmu_soc,
+	.modules = tegra124_mc_modules,
+	.num_modules = ARRAY_SIZE(tegra124_mc_modules),
+	.reg_client_ctrl = 0x200,
+	.reg_client_flush_status = 0x204,
 };
 #endif /* CONFIG_ARCH_TEGRA_132_SOC */
diff --git a/drivers/memory/tegra/tegra20.c b/drivers/memory/tegra/tegra20.c
index 81a082bdba19..4825013b948a 100644
--- a/drivers/memory/tegra/tegra20.c
+++ b/drivers/memory/tegra/tegra20.c
@@ -63,10 +63,33 @@ static const struct tegra_mc_client tegra20_mc_clients[] = {
 	{ .name = "vdetpmw" },
 };
 
+static const struct tegra_mc_module tegra20_mc_modules[] = {
+	[TEGRA_MEMORY_CLIENT_AVP]	= { .hw_id =  0, .valid = true },
+	[TEGRA_MEMORY_CLIENT_DC]	= { .hw_id =  1, .valid = true },
+	[TEGRA_MEMORY_CLIENT_DCB]	= { .hw_id =  2, .valid = true },
+	[TEGRA_MEMORY_CLIENT_EPP]	= { .hw_id =  3, .valid = true },
+	[TEGRA_MEMORY_CLIENT_2D]	= { .hw_id =  4, .valid = true },
+	[TEGRA_MEMORY_CLIENT_HOST1X]	= { .hw_id =  5, .valid = true },
+	[TEGRA_MEMORY_CLIENT_ISP]	= { .hw_id =  6, .valid = true },
+	[TEGRA_MEMORY_CLIENT_MPCORE]	= { .hw_id =  7, .valid = true },
+	[TEGRA_MEMORY_CLIENT_MPEA]	= { .hw_id =  8, .valid = true },
+	[TEGRA_MEMORY_CLIENT_MPEB]	= { .hw_id =  9, .valid = true },
+	[TEGRA_MEMORY_CLIENT_MPEC]	= { .hw_id = 10, .valid = true },
+	[TEGRA_MEMORY_CLIENT_3D]	= { .hw_id = 11, .valid = true },
+	[TEGRA_MEMORY_CLIENT_PPCS]	= { .hw_id = 12, .valid = true },
+	[TEGRA_MEMORY_CLIENT_VDE]	= { .hw_id = 13, .valid = true },
+	[TEGRA_MEMORY_CLIENT_VI]	= { .hw_id = 14, .valid = true },
+};
+
 const struct tegra_mc_soc tegra20_mc_soc = {
 	.clients = tegra20_mc_clients,
 	.num_clients = ARRAY_SIZE(tegra20_mc_clients),
 	.num_address_bits = 32,
 	.client_id_mask = 0x3f,
 	.tegra20 = true,
+	.modules = tegra20_mc_modules,
+	.num_modules = ARRAY_SIZE(tegra20_mc_modules),
+	.reg_client_ctrl = 0x100,
+	.reg_client_hotresetn = 0x104,
+	.reg_client_flush_status = 0x140,
 };
diff --git a/drivers/memory/tegra/tegra210.c b/drivers/memory/tegra/tegra210.c
index 5e144abe4c18..58f0b816cf0e 100644
--- a/drivers/memory/tegra/tegra210.c
+++ b/drivers/memory/tegra/tegra210.c
@@ -1059,6 +1059,29 @@ static const struct tegra_smmu_swgroup tegra210_swgroups[] = {
 	{ .name = "tsecb",     .swgroup = TEGRA_SWGROUP_TSECB,     .reg = 0xad4 },
 };
 
+static const struct tegra_mc_module tegra210_mc_modules[] = {
+	[TEGRA_MEMORY_CLIENT_AFI]	= { .hw_id =  0, .valid = true },
+	[TEGRA_MEMORY_CLIENT_AVP]	= { .hw_id =  1, .valid = true },
+	[TEGRA_MEMORY_CLIENT_DC]	= { .hw_id =  2, .valid = true },
+	[TEGRA_MEMORY_CLIENT_DCB]	= { .hw_id =  3, .valid = true },
+	[TEGRA_MEMORY_CLIENT_HOST1X]	= { .hw_id =  6, .valid = true },
+	[TEGRA_MEMORY_CLIENT_HDA]	= { .hw_id =  7, .valid = true },
+	[TEGRA_MEMORY_CLIENT_ISP2]	= { .hw_id =  8, .valid = true },
+	[TEGRA_MEMORY_CLIENT_MPCORE]	= { .hw_id =  9, .valid = true },
+	[TEGRA_MEMORY_CLIENT_MPCORELP]	= { .hw_id = 10, .valid = true },
+	[TEGRA_MEMORY_CLIENT_NVENC]	= { .hw_id = 11, .valid = true },
+	[TEGRA_MEMORY_CLIENT_PPCS]	= { .hw_id = 14, .valid = true },
+	[TEGRA_MEMORY_CLIENT_SATA]	= { .hw_id = 15, .valid = true },
+	[TEGRA_MEMORY_CLIENT_VI]	= { .hw_id = 17, .valid = true },
+	[TEGRA_MEMORY_CLIENT_VIC]	= { .hw_id = 18, .valid = true },
+	[TEGRA_MEMORY_CLIENT_XUSB_HOST]	= { .hw_id = 19, .valid = true },
+	[TEGRA_MEMORY_CLIENT_XUSB_DEV]	= { .hw_id = 20, .valid = true },
+	[TEGRA_MEMORY_CLIENT_TSEC]	= { .hw_id = 22, .valid = true },
+	[TEGRA_MEMORY_CLIENT_SDMMC1]	= { .hw_id = 29, .valid = true },
+	[TEGRA_MEMORY_CLIENT_SDMMC2]	= { .hw_id = 30, .valid = true },
+	[TEGRA_MEMORY_CLIENT_SDMMC3]	= { .hw_id = 31, .valid = true },
+};
+
 static const struct tegra_smmu_soc tegra210_smmu_soc = {
 	.clients = tegra210_mc_clients,
 	.num_clients = ARRAY_SIZE(tegra210_mc_clients),
@@ -1077,4 +1100,8 @@ const struct tegra_mc_soc tegra210_mc_soc = {
 	.atom_size = 64,
 	.client_id_mask = 0xff,
 	.smmu = &tegra210_smmu_soc,
+	.modules = tegra210_mc_modules,
+	.num_modules = ARRAY_SIZE(tegra210_mc_modules),
+	.reg_client_ctrl = 0x200,
+	.reg_client_flush_status = 0x204,
 };
diff --git a/drivers/memory/tegra/tegra30.c b/drivers/memory/tegra/tegra30.c
index b44737840e70..5a129919fa11 100644
--- a/drivers/memory/tegra/tegra30.c
+++ b/drivers/memory/tegra/tegra30.c
@@ -945,6 +945,27 @@ static const struct tegra_smmu_soc tegra30_smmu_soc = {
 	.num_asids = 4,
 };
 
+static const struct tegra_mc_module tegra30_mc_modules[] = {
+	[TEGRA_MEMORY_CLIENT_AFI]	= { .hw_id =  0, .valid = true },
+	[TEGRA_MEMORY_CLIENT_AVP]	= { .hw_id =  1, .valid = true },
+	[TEGRA_MEMORY_CLIENT_DC]	= { .hw_id =  2, .valid = true },
+	[TEGRA_MEMORY_CLIENT_DCB]	= { .hw_id =  3, .valid = true },
+	[TEGRA_MEMORY_CLIENT_EPP]	= { .hw_id =  4, .valid = true },
+	[TEGRA_MEMORY_CLIENT_2D]	= { .hw_id =  5, .valid = true },
+	[TEGRA_MEMORY_CLIENT_HOST1X]	= { .hw_id =  6, .valid = true },
+	[TEGRA_MEMORY_CLIENT_HDA]	= { .hw_id =  7, .valid = true },
+	[TEGRA_MEMORY_CLIENT_ISP]	= { .hw_id =  8, .valid = true },
+	[TEGRA_MEMORY_CLIENT_MPCORE]	= { .hw_id =  9, .valid = true },
+	[TEGRA_MEMORY_CLIENT_MPCORELP]	= { .hw_id = 10, .valid = true },
+	[TEGRA_MEMORY_CLIENT_MPE]	= { .hw_id = 11, .valid = true },
+	[TEGRA_MEMORY_CLIENT_3D0]	= { .hw_id = 12, .valid = true },
+	[TEGRA_MEMORY_CLIENT_3D1]	= { .hw_id = 13, .valid = true },
+	[TEGRA_MEMORY_CLIENT_PPCS]	= { .hw_id = 14, .valid = true },
+	[TEGRA_MEMORY_CLIENT_SATA]	= { .hw_id = 15, .valid = true },
+	[TEGRA_MEMORY_CLIENT_VDE]	= { .hw_id = 16, .valid = true },
+	[TEGRA_MEMORY_CLIENT_VI]	= { .hw_id = 17, .valid = true },
+};
+
 const struct tegra_mc_soc tegra30_mc_soc = {
 	.clients = tegra30_mc_clients,
 	.num_clients = ARRAY_SIZE(tegra30_mc_clients),
@@ -952,4 +973,8 @@ const struct tegra_mc_soc tegra30_mc_soc = {
 	.atom_size = 16,
 	.client_id_mask = 0x7f,
 	.smmu = &tegra30_smmu_soc,
+	.modules = tegra30_mc_modules,
+	.num_modules = ARRAY_SIZE(tegra30_mc_modules),
+	.reg_client_ctrl = 0x200,
+	.reg_client_flush_status = 0x204,
 };
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index 858904c09d7d..41ffccc43afc 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -9,11 +9,13 @@
 #ifndef __SOC_TEGRA_MC_H__
 #define __SOC_TEGRA_MC_H__
 
+#include <linux/mutex.h>
 #include <linux/types.h>
 
 struct clk;
 struct device;
 struct page;
+struct reset_control;
 
 struct tegra_smmu_enable {
 	unsigned int reg;
@@ -86,6 +88,11 @@ static inline void tegra_smmu_remove(struct tegra_smmu *smmu)
 }
 #endif
 
+struct tegra_mc_module {
+	unsigned int hw_id;
+	bool valid;
+};
+
 struct tegra_mc_soc {
 	const struct tegra_mc_client *clients;
 	unsigned int num_clients;
@@ -101,6 +108,13 @@ struct tegra_mc_soc {
 	const struct tegra_smmu_soc *smmu;
 
 	bool tegra20;
+
+	const struct tegra_mc_module *modules;
+	unsigned int num_modules;
+
+	u32 reg_client_ctrl;
+	u32 reg_client_hotresetn;
+	u32 reg_client_flush_status;
 };
 
 struct tegra_mc {
@@ -115,9 +129,55 @@ struct tegra_mc {
 
 	struct tegra_mc_timing *timings;
 	unsigned int num_timings;
+
+	struct mutex lock;
 };
 
 void tegra_mc_write_emem_configuration(struct tegra_mc *mc, unsigned long rate);
 unsigned int tegra_mc_get_emem_device_count(struct tegra_mc *mc);
 
+#define TEGRA_MEMORY_CLIENT_AVP		0
+#define TEGRA_MEMORY_CLIENT_DC		1
+#define TEGRA_MEMORY_CLIENT_DCB		2
+#define TEGRA_MEMORY_CLIENT_EPP		3
+#define TEGRA_MEMORY_CLIENT_2D		4
+#define TEGRA_MEMORY_CLIENT_HOST1X	5
+#define TEGRA_MEMORY_CLIENT_ISP		6
+#define TEGRA_MEMORY_CLIENT_MPCORE	7
+#define TEGRA_MEMORY_CLIENT_MPCORELP	8
+#define TEGRA_MEMORY_CLIENT_MPEA	9
+#define TEGRA_MEMORY_CLIENT_MPEB	10
+#define TEGRA_MEMORY_CLIENT_MPEC	11
+#define TEGRA_MEMORY_CLIENT_3D		12
+#define TEGRA_MEMORY_CLIENT_3D1		13
+#define TEGRA_MEMORY_CLIENT_PPCS	14
+#define TEGRA_MEMORY_CLIENT_VDE		15
+#define TEGRA_MEMORY_CLIENT_VI		16
+#define TEGRA_MEMORY_CLIENT_AFI		17
+#define TEGRA_MEMORY_CLIENT_HDA		18
+#define TEGRA_MEMORY_CLIENT_SATA	19
+#define TEGRA_MEMORY_CLIENT_MSENC	20
+#define TEGRA_MEMORY_CLIENT_VIC		21
+#define TEGRA_MEMORY_CLIENT_XUSB_HOST	22
+#define TEGRA_MEMORY_CLIENT_XUSB_DEV	23
+#define TEGRA_MEMORY_CLIENT_TSEC	24
+#define TEGRA_MEMORY_CLIENT_SDMMC1	25
+#define TEGRA_MEMORY_CLIENT_SDMMC2	26
+#define TEGRA_MEMORY_CLIENT_SDMMC3	27
+#define TEGRA_MEMORY_CLIENT_MAX		TEGRA_MEMORY_CLIENT_SDMMC3
+
+#define TEGRA_MEMORY_CLIENT_3D0		TEGRA_MEMORY_CLIENT_3D
+#define TEGRA_MEMORY_CLIENT_MPE		TEGRA_MEMORY_CLIENT_MPEA
+#define TEGRA_MEMORY_CLIENT_NVENC	TEGRA_MEMORY_CLIENT_MSENC
+#define TEGRA_MEMORY_CLIENT_ISP2	TEGRA_MEMORY_CLIENT_ISP
+
+#ifdef CONFIG_ARCH_TEGRA
+int tegra_memory_client_hotreset(unsigned int id, struct reset_control *rst);
+#else
+int tegra_memory_client_hotreset(unsigned int id, struct reset_control *rst)
+{
+	return -ENOSYS;
+}
+#endif /* CONFIG_ARCH_TEGRA */
+
 #endif /* __SOC_TEGRA_MC_H__ */
-- 
2.15.1
