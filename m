From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 16/29] memory: tegra: Add interconnect nodes for Terga124 display controllers
Date: Mon, 18 Nov 2019 23:02:34 +0300
Message-ID: <20191118200247.3567-17-digetx@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191118200247.3567-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Add initial interconnect nodes that allow display controller driver
to perform memory bandwidth requests using interconnect API.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra124.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/memory/tegra/tegra124.c b/drivers/memory/tegra/tegra124.c
index 493b5dc3a4b3..dae6b366281f 100644
--- a/drivers/memory/tegra/tegra124.c
+++ b/drivers/memory/tegra/tegra124.c
@@ -6,6 +6,7 @@
 #include <linux/of.h>
 #include <linux/mm.h>
 
+#include <dt-bindings/interconnect/tegra-icc.h>
 #include <dt-bindings/memory/tegra124-mc.h>
 
 #include "mc.h"
@@ -1028,6 +1029,17 @@ static const unsigned long tegra124_mc_emem_regs[] = {
 	MC_EMEM_ARB_RING1_THROTTLE
 };
 
+#define TEGRA124_MC_ICC(_name)				\
+	{						\
+		.name = #_name,				\
+		.id = TEGRA_ICC_MC_##_name,		\
+	}
+
+static const struct tegra_mc_icc_node tegra124_mc_icc_nodes[] = {
+	TEGRA124_MC_ICC(DC),
+	TEGRA124_MC_ICC(DCB),
+};
+
 static const struct tegra_smmu_soc tegra124_smmu_soc = {
 	.clients = tegra124_mc_clients,
 	.num_clients = ARRAY_SIZE(tegra124_mc_clients),
@@ -1056,6 +1068,8 @@ const struct tegra_mc_soc tegra124_mc_soc = {
 	.reset_ops = &tegra_mc_reset_ops_common,
 	.resets = tegra124_mc_resets,
 	.num_resets = ARRAY_SIZE(tegra124_mc_resets),
+	.icc_nodes = tegra124_mc_icc_nodes,
+	.num_icc_nodes = ARRAY_SIZE(tegra124_mc_icc_nodes),
 };
 #endif /* CONFIG_ARCH_TEGRA_124_SOC */
 
@@ -1086,5 +1100,7 @@ const struct tegra_mc_soc tegra132_mc_soc = {
 	.reset_ops = &tegra_mc_reset_ops_common,
 	.resets = tegra124_mc_resets,
 	.num_resets = ARRAY_SIZE(tegra124_mc_resets),
+	.icc_nodes = tegra124_mc_icc_nodes,
+	.num_icc_nodes = ARRAY_SIZE(tegra124_mc_icc_nodes),
 };
 #endif /* CONFIG_ARCH_TEGRA_132_SOC */
-- 
2.23.0
