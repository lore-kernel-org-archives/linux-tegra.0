From: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] memory: tegra: mc: add support for a variable-size client
 ID bitfield
Date: Thu, 4 Jun 2015 19:33:48 +0000 (UTC)
Message-ID: <alpine.DEB.2.02.1506041924320.12316@utopia.booyaka.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


Recent versions of the Tegra MC hardware extend the size of the client
ID bitfield in the MC_ERR_STATUS register by one bit.  While one could
simply extend the bitfield for older hardware, that would allow data
from reserved bits into the driver code, which is generally a bad idea
on principle.  So this patch instead passes in the
MC_ERR_STATUS_CLIENT_MASK from the per-SoC MC data.

There's no MC support for T210 (yet), but when that support winds up
in the kernel, the appropriate soc->client_id_mask value for
that chip will be 0xff.

Based on an original patch by David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>.

Signed-off-by: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
Cc: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Based on next-20150602.  Basic build and boot test results are here:

http://nvt.pwsan.com/pub/pwalmsley-tester/testlogs/test_20150604122454_0ba689090bdac347f87b8f5892552d4f8b1b6a78/20150604122454/

(The multi_v7_defconfig build failure is due to unrelated problems with 
the sunxi clk drivers)

Intended for v4.3.

 drivers/memory/tegra/mc.c       | 5 +++--
 drivers/memory/tegra/tegra114.c | 1 +
 drivers/memory/tegra/tegra124.c | 2 ++
 drivers/memory/tegra/tegra30.c  | 1 +
 include/soc/tegra/mc.h          | 6 ++++++
 5 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index c71ede67e6c8..d5d99c1c689c 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -42,7 +42,6 @@
 #define  MC_ERR_STATUS_ADR_HI_MASK 0x3
 #define  MC_ERR_STATUS_SECURITY (1 << 17)
 #define  MC_ERR_STATUS_RW (1 << 16)
-#define  MC_ERR_STATUS_CLIENT_MASK 0x7f
 
 #define MC_ERR_ADR 0x0c
 
@@ -283,7 +282,7 @@ static irqreturn_t tegra_mc_irq(int irq, void *data)
 		else
 			secure = "";
 
-		id = value & MC_ERR_STATUS_CLIENT_MASK;
+		id = value & mc->soc->client_id_mask;
 
 		for (i = 0; i < mc->soc->num_clients; i++) {
 			if (mc->soc->clients[i].id == id) {
@@ -410,6 +409,8 @@ static int tegra_mc_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	WARN(!mc->soc->client_id_mask, "Missing client_id_mask for this SoC\n");
+
 	value = MC_INT_DECERR_MTS | MC_INT_SECERR_SEC | MC_INT_DECERR_VPR |
 		MC_INT_INVALID_APB_ASID_UPDATE | MC_INT_INVALID_SMMU_PAGE |
 		MC_INT_SECURITY_VIOLATION | MC_INT_DECERR_EMEM;
diff --git a/drivers/memory/tegra/tegra114.c b/drivers/memory/tegra/tegra114.c
index 9f579589e800..a0b138310cd6 100644
--- a/drivers/memory/tegra/tegra114.c
+++ b/drivers/memory/tegra/tegra114.c
@@ -944,5 +944,6 @@ const struct tegra_mc_soc tegra114_mc_soc = {
 	.num_clients = ARRAY_SIZE(tegra114_mc_clients),
 	.num_address_bits = 32,
 	.atom_size = 32,
+	.client_id_mask = T30_MC_ERR_STATUS_CLIENT_MASK,
 	.smmu = &tegra114_smmu_soc,
 };
diff --git a/drivers/memory/tegra/tegra124.c b/drivers/memory/tegra/tegra124.c
index 966e1557e6f4..7aa0b79fac73 100644
--- a/drivers/memory/tegra/tegra124.c
+++ b/drivers/memory/tegra/tegra124.c
@@ -1032,6 +1032,7 @@ const struct tegra_mc_soc tegra124_mc_soc = {
 	.num_clients = ARRAY_SIZE(tegra124_mc_clients),
 	.num_address_bits = 34,
 	.atom_size = 32,
+	.client_id_mask = T30_MC_ERR_STATUS_CLIENT_MASK,
 	.smmu = &tegra124_smmu_soc,
 	.emem_regs = tegra124_mc_emem_regs,
 	.num_emem_regs = ARRAY_SIZE(tegra124_mc_emem_regs),
@@ -1067,6 +1068,7 @@ const struct tegra_mc_soc tegra132_mc_soc = {
 	.num_clients = ARRAY_SIZE(tegra124_mc_clients),
 	.num_address_bits = 34,
 	.atom_size = 32,
+	.client_id_mask = T30_MC_ERR_STATUS_CLIENT_MASK,
 	.smmu = &tegra132_smmu_soc,
 };
 #endif /* CONFIG_ARCH_TEGRA_132_SOC */
diff --git a/drivers/memory/tegra/tegra30.c b/drivers/memory/tegra/tegra30.c
index 1abcd8f6f3ba..dc46bf7ec40e 100644
--- a/drivers/memory/tegra/tegra30.c
+++ b/drivers/memory/tegra/tegra30.c
@@ -966,5 +966,6 @@ const struct tegra_mc_soc tegra30_mc_soc = {
 	.num_clients = ARRAY_SIZE(tegra30_mc_clients),
 	.num_address_bits = 32,
 	.atom_size = 16,
+	.client_id_mask = T30_MC_ERR_STATUS_CLIENT_MASK,
 	.smmu = &tegra30_smmu_soc,
 };
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index 1ab2813273cd..9fa2451dd1ae 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -92,6 +92,10 @@ static inline void tegra_smmu_remove(struct tegra_smmu *smmu)
 }
 #endif
 
+/* Some SoC-specific MC_ERR_STATUS register bitfields */
+#define T30_MC_ERR_STATUS_CLIENT_MASK	0x7f
+#define T210_MC_ERR_STATUS_CLIENT_MASK	0xff
+
 struct tegra_mc_soc {
 	const struct tegra_mc_client *clients;
 	unsigned int num_clients;
@@ -102,6 +106,8 @@ struct tegra_mc_soc {
 	unsigned int num_address_bits;
 	unsigned int atom_size;
 
+	u8 client_id_mask;
+
 	const struct tegra_smmu_soc *smmu;
 };
 
-- 
2.1.4
