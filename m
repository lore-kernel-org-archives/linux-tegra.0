From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 14/15] memory: tegra: Add Tegra30 memory controller hot resets
Date: Fri, 13 Apr 2018 14:33:53 +0300
Message-ID: <a07f9ab772b486e411bd397da2c9f6f01f3b6227.1523301400.git.digetx@gmail.com>
References: <b063a7d44509189495825e73942329aca51e9e69.1523301400.git.digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b063a7d44509189495825e73942329aca51e9e69.1523301400.git.digetx@gmail.com>
In-Reply-To: <cover.1523301400.git.digetx@gmail.com>
References: <cover.1523301400.git.digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Define the table of memory controller hot resets for Tegra30.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra30.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/memory/tegra/tegra30.c b/drivers/memory/tegra/tegra30.c
index d2ba50ed0490..bee5314ed404 100644
--- a/drivers/memory/tegra/tegra30.c
+++ b/drivers/memory/tegra/tegra30.c
@@ -960,6 +960,36 @@ static const struct tegra_smmu_soc tegra30_smmu_soc = {
 	.num_asids = 4,
 };
 
+#define TEGRA30_MC_RESET(_name, _control, _status, _bit)	\
+	{							\
+		.name = #_name,					\
+		.id = TEGRA30_MC_RESET_##_name,			\
+		.control = _control,				\
+		.status = _status,				\
+		.bit = _bit,					\
+	}
+
+static const struct tegra_mc_reset tegra30_mc_resets[] = {
+	TEGRA30_MC_RESET(AFI,      0x200, 0x204,  0),
+	TEGRA30_MC_RESET(AVPC,     0x200, 0x204,  1),
+	TEGRA30_MC_RESET(DC,       0x200, 0x204,  2),
+	TEGRA30_MC_RESET(DCB,      0x200, 0x204,  3),
+	TEGRA30_MC_RESET(EPP,      0x200, 0x204,  4),
+	TEGRA30_MC_RESET(2D,       0x200, 0x204,  5),
+	TEGRA30_MC_RESET(HC,       0x200, 0x204,  6),
+	TEGRA30_MC_RESET(HDA,      0x200, 0x204,  7),
+	TEGRA30_MC_RESET(ISP,      0x200, 0x204,  8),
+	TEGRA30_MC_RESET(MPCORE,   0x200, 0x204,  9),
+	TEGRA30_MC_RESET(MPCORELP, 0x200, 0x204, 10),
+	TEGRA30_MC_RESET(MPE,      0x200, 0x204, 11),
+	TEGRA30_MC_RESET(3D,       0x200, 0x204, 12),
+	TEGRA30_MC_RESET(3D2,      0x200, 0x204, 13),
+	TEGRA30_MC_RESET(PPCS,     0x200, 0x204, 14),
+	TEGRA30_MC_RESET(SATA,     0x200, 0x204, 15),
+	TEGRA30_MC_RESET(VDE,      0x200, 0x204, 16),
+	TEGRA30_MC_RESET(VI,       0x200, 0x204, 17),
+};
+
 const struct tegra_mc_soc tegra30_mc_soc = {
 	.clients = tegra30_mc_clients,
 	.num_clients = ARRAY_SIZE(tegra30_mc_clients),
@@ -969,4 +999,7 @@ const struct tegra_mc_soc tegra30_mc_soc = {
 	.smmu = &tegra30_smmu_soc,
 	.intmask = MC_INT_INVALID_SMMU_PAGE | MC_INT_SECURITY_VIOLATION |
 		   MC_INT_DECERR_EMEM,
+	.reset_ops = &terga_mc_reset_ops_common,
+	.resets = tegra30_mc_resets,
+	.num_resets = ARRAY_SIZE(tegra30_mc_resets),
 };
-- 
2.17.0
