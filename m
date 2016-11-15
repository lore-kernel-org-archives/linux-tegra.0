From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] reset: Add Tegra BPMP reset driver
Date: Tue, 15 Nov 2016 17:17:49 +0100
Message-ID: <20161115161749.31221-1-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This driver uses the services provided by the BPMP firmware driver to
implement a reset driver based on the MRQ_RESET request.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Hi Philipp,

I'm looking for an Acked-by on this because there are complicated
dependencies between this and other branches in the Tegra tree, so I
think it would be easiest to merge through that.

Thanks,
Thierry

 drivers/reset/Kconfig            |  1 +
 drivers/reset/Makefile           |  1 +
 drivers/reset/tegra/Kconfig      |  3 ++
 drivers/reset/tegra/Makefile     |  1 +
 drivers/reset/tegra/reset-bpmp.c | 71 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 77 insertions(+)
 create mode 100644 drivers/reset/tegra/Kconfig
 create mode 100644 drivers/reset/tegra/Makefile
 create mode 100644 drivers/reset/tegra/reset-bpmp.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 06d9fa2f3bc0..172dc966a01f 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -94,5 +94,6 @@ config RESET_ZYNQ
 
 source "drivers/reset/sti/Kconfig"
 source "drivers/reset/hisilicon/Kconfig"
+source "drivers/reset/tegra/Kconfig"
 
 endif
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index bbe7026617fc..13b346e03d84 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -1,6 +1,7 @@
 obj-y += core.o
 obj-y += hisilicon/
 obj-$(CONFIG_ARCH_STI) += sti/
+obj-$(CONFIG_ARCH_TEGRA) += tegra/
 obj-$(CONFIG_RESET_ATH79) += reset-ath79.o
 obj-$(CONFIG_RESET_BERLIN) += reset-berlin.o
 obj-$(CONFIG_RESET_LPC18XX) += reset-lpc18xx.o
diff --git a/drivers/reset/tegra/Kconfig b/drivers/reset/tegra/Kconfig
new file mode 100644
index 000000000000..0ec57a7016e6
--- /dev/null
+++ b/drivers/reset/tegra/Kconfig
@@ -0,0 +1,3 @@
+config RESET_TEGRA_BPMP
+	def_bool y
+	depends on TEGRA_BPMP
diff --git a/drivers/reset/tegra/Makefile b/drivers/reset/tegra/Makefile
new file mode 100644
index 000000000000..fd943b1ae029
--- /dev/null
+++ b/drivers/reset/tegra/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_ARCH_TEGRA_186_SOC)	+= reset-bpmp.o
diff --git a/drivers/reset/tegra/reset-bpmp.c b/drivers/reset/tegra/reset-bpmp.c
new file mode 100644
index 000000000000..5daf2ee1a396
--- /dev/null
+++ b/drivers/reset/tegra/reset-bpmp.c
@@ -0,0 +1,71 @@
+/*
+ * Copyright (C) 2016 NVIDIA Corporation
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/reset-controller.h>
+
+#include <soc/tegra/bpmp.h>
+#include <soc/tegra/bpmp-abi.h>
+
+static struct tegra_bpmp *to_tegra_bpmp(struct reset_controller_dev *rstc)
+{
+	return container_of(rstc, struct tegra_bpmp, rstc);
+}
+
+static int tegra_bpmp_reset_common(struct reset_controller_dev *rstc,
+				   enum mrq_reset_commands command,
+				   unsigned int id)
+{
+	struct tegra_bpmp *bpmp = to_tegra_bpmp(rstc);
+	struct mrq_reset_request request;
+	struct tegra_bpmp_message msg;
+
+	memset(&request, 0, sizeof(request));
+	request.cmd = command;
+	request.reset_id = id;
+
+	memset(&msg, 0, sizeof(msg));
+	msg.mrq = MRQ_RESET;
+	msg.tx.data = &request;
+	msg.tx.size = sizeof(request);
+
+	return tegra_bpmp_transfer(bpmp, &msg);
+}
+
+static int tegra_bpmp_reset_module(struct reset_controller_dev *rstc,
+				   unsigned long id)
+{
+	return tegra_bpmp_reset_common(rstc, CMD_RESET_MODULE, id);
+}
+
+static int tegra_bpmp_reset_assert(struct reset_controller_dev *rstc,
+				   unsigned long id)
+{
+	return tegra_bpmp_reset_common(rstc, CMD_RESET_ASSERT, id);
+}
+
+static int tegra_bpmp_reset_deassert(struct reset_controller_dev *rstc,
+				     unsigned long id)
+{
+	return tegra_bpmp_reset_common(rstc, CMD_RESET_DEASSERT, id);
+}
+
+static const struct reset_control_ops tegra_bpmp_reset_ops = {
+	.reset = tegra_bpmp_reset_module,
+	.assert = tegra_bpmp_reset_assert,
+	.deassert = tegra_bpmp_reset_deassert,
+};
+
+int tegra_bpmp_init_resets(struct tegra_bpmp *bpmp)
+{
+	bpmp->rstc.ops = &tegra_bpmp_reset_ops;
+	bpmp->rstc.owner = THIS_MODULE;
+	bpmp->rstc.of_node = bpmp->dev->of_node;
+	bpmp->rstc.nr_resets = bpmp->soc->num_resets;
+
+	return devm_reset_controller_register(bpmp->dev, &bpmp->rstc);
+}
-- 
2.10.2
