From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 13/15] memory: tegra: Add Tegra114 memory controller hot resets
Date: Fri, 13 Apr 2018 14:33:52 +0300
Message-ID: <57ac9eca965eaddc04ab8f885b11cc37a6c0c8e6.1523301400.git.digetx@gmail.com>
References: <b063a7d44509189495825e73942329aca51e9e69.1523301400.git.digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b063a7d44509189495825e73942329aca51e9e69.1523301400.git.digetx@gmail.com>
In-Reply-To: <cover.1523301400.git.digetx@gmail.com>
References: <cover.1523301400.git.digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Define the table of memory controller hot resets for Tegra114.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra114.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/memory/tegra/tegra114.c b/drivers/memory/tegra/tegra114.c
index 7560b2f558a7..12528aa3062b 100644
--- a/drivers/memory/tegra/tegra114.c
+++ b/drivers/memory/tegra/tegra114.c
@@ -938,6 +938,36 @@ static const struct tegra_smmu_soc tegra114_smmu_soc = {
 	.num_asids = 4,
 };
 
+#define TEGRA114_MC_RESET(_name, _control, _status, _bit)	\
+	{							\
+		.name = #_name,					\
+		.id = TEGRA114_MC_RESET_##_name,		\
+		.control = _control,				\
+		.status = _status,				\
+		.bit = _bit,					\
+	}
+
+static const struct tegra_mc_reset tegra114_mc_resets[] = {
+	TEGRA114_MC_RESET(AFI,      0x200, 0x204,  0),
+	TEGRA114_MC_RESET(AVPC,     0x200, 0x204,  1),
+	TEGRA114_MC_RESET(DC,       0x200, 0x204,  2),
+	TEGRA114_MC_RESET(DCB,      0x200, 0x204,  3),
+	TEGRA114_MC_RESET(EPP,      0x200, 0x204,  4),
+	TEGRA114_MC_RESET(2D,       0x200, 0x204,  5),
+	TEGRA114_MC_RESET(HC,       0x200, 0x204,  6),
+	TEGRA114_MC_RESET(HDA,      0x200, 0x204,  7),
+	TEGRA114_MC_RESET(ISP,      0x200, 0x204,  8),
+	TEGRA114_MC_RESET(MPCORE,   0x200, 0x204,  9),
+	TEGRA114_MC_RESET(MPCORELP, 0x200, 0x204, 10),
+	TEGRA114_MC_RESET(MPE,      0x200, 0x204, 11),
+	TEGRA114_MC_RESET(3D,       0x200, 0x204, 12),
+	TEGRA114_MC_RESET(3D2,      0x200, 0x204, 13),
+	TEGRA114_MC_RESET(PPCS,     0x200, 0x204, 14),
+	TEGRA114_MC_RESET(SATA,     0x200, 0x204, 15),
+	TEGRA114_MC_RESET(VDE,      0x200, 0x204, 16),
+	TEGRA114_MC_RESET(VI,       0x200, 0x204, 17),
+};
+
 const struct tegra_mc_soc tegra114_mc_soc = {
 	.clients = tegra114_mc_clients,
 	.num_clients = ARRAY_SIZE(tegra114_mc_clients),
@@ -947,4 +977,7 @@ const struct tegra_mc_soc tegra114_mc_soc = {
 	.smmu = &tegra114_smmu_soc,
 	.intmask = MC_INT_INVALID_SMMU_PAGE | MC_INT_SECURITY_VIOLATION |
 		   MC_INT_DECERR_EMEM,
+	.reset_ops = &terga_mc_reset_ops_common,
+	.resets = tegra114_mc_resets,
+	.num_resets = ARRAY_SIZE(tegra114_mc_resets),
 };
-- 
2.17.0
