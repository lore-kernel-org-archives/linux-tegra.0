From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 05/13] memory: tegra: Add per-SoC data for Tegra186
Date: Sun, 22 Dec 2019 15:10:27 +0100
Message-ID: <20191222141035.1649937-6-thierry.reding@gmail.com>
References: <20191222141035.1649937-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191222141035.1649937-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Instead of hard-coding the memory client table, use per-SoC data in
preparation for adding support for other SoCs.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/memory/tegra/tegra186.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index f72e89877295..ad5c353dba6e 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -6,15 +6,11 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 
 #include <dt-bindings/memory/tegra186-mc.h>
 
-struct tegra_mc {
-	struct device *dev;
-	void __iomem *regs;
-};
-
 struct tegra186_mc_client {
 	const char *name;
 	unsigned int sid;
@@ -24,10 +20,16 @@ struct tegra186_mc_client {
 	} regs;
 };
 
+struct tegra186_mc_soc {
+	const struct tegra186_mc_client *clients;
+	unsigned int num_clients;
+};
+
 struct tegra186_mc {
-	struct memory_controller base;
 	struct device *dev;
 	void __iomem *regs;
+
+	const struct tegra186_mc_soc *soc;
 };
 
 static const struct tegra186_mc_client tegra186_mc_clients[] = {
@@ -538,17 +540,24 @@ static const struct tegra186_mc_client tegra186_mc_clients[] = {
 	},
 };
 
+static const struct tegra186_mc_soc tegra186_mc_soc = {
+	.num_clients = ARRAY_SIZE(tegra186_mc_clients),
+	.clients = tegra186_mc_clients,
+};
+
 static int tegra186_mc_probe(struct platform_device *pdev)
 {
 	struct tegra186_mc *mc;
 	struct resource *res;
 	unsigned int i;
-	int err = 0;
+	int err;
 
 	mc = devm_kzalloc(&pdev->dev, sizeof(*mc), GFP_KERNEL);
 	if (!mc)
 		return -ENOMEM;
 
+	mc->soc = of_device_get_match_data(&pdev->dev);
+
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	mc->regs = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(mc->regs))
@@ -556,8 +565,8 @@ static int tegra186_mc_probe(struct platform_device *pdev)
 
 	mc->dev = &pdev->dev;
 
-	for (i = 0; i < ARRAY_SIZE(tegra186_mc_clients); i++) {
-		const struct tegra186_mc_client *client = &tegra186_mc_clients[i];
+	for (i = 0; i < mc->soc->num_clients; i++) {
+		const struct tegra186_mc_client *client = &mc->soc->clients[i];
 		u32 override, security;
 
 		override = readl(mc->regs + client->regs.override);
@@ -583,7 +592,7 @@ static int tegra186_mc_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id tegra186_mc_of_match[] = {
-	{ .compatible = "nvidia,tegra186-mc", },
+	{ .compatible = "nvidia,tegra186-mc", .data = &tegra186_mc_soc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, tegra186_mc_of_match);
-- 
2.24.1
