From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 09/13] memory: tegra: Only include support for enabled SoCs
Date: Sun, 22 Dec 2019 15:10:31 +0100
Message-ID: <20191222141035.1649937-10-thierry.reding@gmail.com>
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

The memory client tables can be fairly large and they can easily be
omitted if support for the corresponding SoC is not enabled.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/memory/tegra/tegra186-emc.c | 2 ++
 drivers/memory/tegra/tegra186.c     | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/memory/tegra/tegra186-emc.c b/drivers/memory/tegra/tegra186-emc.c
index a3f275a7b4d6..812a4e152dcb 100644
--- a/drivers/memory/tegra/tegra186-emc.c
+++ b/drivers/memory/tegra/tegra186-emc.c
@@ -267,7 +267,9 @@ static int tegra186_emc_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id tegra186_emc_of_match[] = {
+#if defined(CONFIG_ARCH_TEGRA186_SOC)
 	{ .compatible = "nvidia,tegra186-emc" },
+#endif
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, tegra186_emc_of_match);
diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index a727f0925276..9c9a2f54b6fc 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -9,7 +9,9 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 
+#if defined(CONFIG_ARCH_TEGRA_186_SOC)
 #include <dt-bindings/memory/tegra186-mc.h>
+#endif
 
 struct tegra186_mc_client {
 	const char *name;
@@ -58,6 +60,7 @@ static void tegra186_mc_program_sid(struct tegra186_mc *mc)
 	}
 }
 
+#if defined(CONFIG_ARCH_TEGRA_186_SOC)
 static const struct tegra186_mc_client tegra186_mc_clients[] = {
 	{
 		.name = "ptcr",
@@ -570,6 +573,7 @@ static const struct tegra186_mc_soc tegra186_mc_soc = {
 	.num_clients = ARRAY_SIZE(tegra186_mc_clients),
 	.clients = tegra186_mc_clients,
 };
+#endif
 
 static int tegra186_mc_probe(struct platform_device *pdev)
 {
@@ -615,7 +619,9 @@ static int tegra186_mc_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id tegra186_mc_of_match[] = {
+#if defined(CONFIG_ARCH_TEGRA_186_SOC)
 	{ .compatible = "nvidia,tegra186-mc", .data = &tegra186_mc_soc },
+#endif
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, tegra186_mc_of_match);
-- 
2.24.1
