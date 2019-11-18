From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 15/29] memory: tegra: Add interconnect nodes for Terga30 display controllers
Date: Mon, 18 Nov 2019 23:02:33 +0300
Message-ID: <20191118200247.3567-16-digetx@gmail.com>
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
 drivers/memory/tegra/tegra30.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/memory/tegra/tegra30.c b/drivers/memory/tegra/tegra30.c
index fcdd812eed80..df0d550b07f8 100644
--- a/drivers/memory/tegra/tegra30.c
+++ b/drivers/memory/tegra/tegra30.c
@@ -6,6 +6,7 @@
 #include <linux/of.h>
 #include <linux/mm.h>
 
+#include <dt-bindings/interconnect/tegra-icc.h>
 #include <dt-bindings/memory/tegra30-mc.h>
 
 #include "mc.h"
@@ -1011,6 +1012,17 @@ static const struct tegra_mc_reset tegra30_mc_resets[] = {
 	TEGRA30_MC_RESET(VI,       0x200, 0x204, 17),
 };
 
+#define TEGRA30_MC_ICC(_name)				\
+	{						\
+		.name = #_name,				\
+		.id = TEGRA_ICC_MC_##_name,		\
+	}
+
+static const struct tegra_mc_icc_node tegra30_mc_icc_nodes[] = {
+	TEGRA30_MC_ICC(DC),
+	TEGRA30_MC_ICC(DCB),
+};
+
 const struct tegra_mc_soc tegra30_mc_soc = {
 	.clients = tegra30_mc_clients,
 	.num_clients = ARRAY_SIZE(tegra30_mc_clients),
@@ -1025,4 +1037,6 @@ const struct tegra_mc_soc tegra30_mc_soc = {
 	.reset_ops = &tegra_mc_reset_ops_common,
 	.resets = tegra30_mc_resets,
 	.num_resets = ARRAY_SIZE(tegra30_mc_resets),
+	.icc_nodes = tegra30_mc_icc_nodes,
+	.num_icc_nodes = ARRAY_SIZE(tegra30_mc_icc_nodes),
 };
-- 
2.23.0
