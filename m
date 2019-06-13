From: Nathan Huckleberry <nhuck@google.com>
Subject: [PATCH v2] memory: tegra: Fix -Wunused-const-variable
Date: Thu, 13 Jun 2019 11:26:10 -0700
Message-ID: <20190613182610.238801-1-nhuck@google.com>
References: <CAKwvOdn930hhHcnCA9arJ5=9SsT-6BfFC_1punmUZX2xWM-Hnw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKwvOdn930hhHcnCA9arJ5=9SsT-6BfFC_1punmUZX2xWM-Hnw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Nathan Huckleberry <nhuck@google.com>, clang-built-linux@googlegroups.com
List-Id: linux-tegra@vger.kernel.org

Clang produces the following warning

drivers/memory/tegra/tegra124.c:36:28: warning: unused variable
'tegra124_mc_emem_regs' [-Wunused-const-variable]
static const unsigned long tegra124_mc_emem_regs[] = {
                           ^

The only usage of this variable is from within an ifdef.
It seems logical to move the variable into the ifdef as well.

Cc: clang-built-linux@googlegroups.com
Link: https://github.com/ClangBuiltLinux/linux/issues/526
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
Changes from v1 -> v2:
* Moved definition of tegra124_mc_emem_regs into existing ifdef
 drivers/memory/tegra/tegra124.c | 44 ++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/memory/tegra/tegra124.c b/drivers/memory/tegra/tegra124.c
index 8f8487bda642..6985a4e33325 100644
--- a/drivers/memory/tegra/tegra124.c
+++ b/drivers/memory/tegra/tegra124.c
@@ -33,28 +33,6 @@
 #define MC_EMEM_ARB_MISC1			0xdc
 #define MC_EMEM_ARB_RING1_THROTTLE		0xe0
 
-static const unsigned long tegra124_mc_emem_regs[] = {
-	MC_EMEM_ARB_CFG,
-	MC_EMEM_ARB_OUTSTANDING_REQ,
-	MC_EMEM_ARB_TIMING_RCD,
-	MC_EMEM_ARB_TIMING_RP,
-	MC_EMEM_ARB_TIMING_RC,
-	MC_EMEM_ARB_TIMING_RAS,
-	MC_EMEM_ARB_TIMING_FAW,
-	MC_EMEM_ARB_TIMING_RRD,
-	MC_EMEM_ARB_TIMING_RAP2PRE,
-	MC_EMEM_ARB_TIMING_WAP2PRE,
-	MC_EMEM_ARB_TIMING_R2R,
-	MC_EMEM_ARB_TIMING_W2W,
-	MC_EMEM_ARB_TIMING_R2W,
-	MC_EMEM_ARB_TIMING_W2R,
-	MC_EMEM_ARB_DA_TURNS,
-	MC_EMEM_ARB_DA_COVERS,
-	MC_EMEM_ARB_MISC0,
-	MC_EMEM_ARB_MISC1,
-	MC_EMEM_ARB_RING1_THROTTLE
-};
-
 static const struct tegra_mc_client tegra124_mc_clients[] = {
 	{
 		.id = 0x00,
@@ -1049,6 +1027,28 @@ static const struct tegra_mc_reset tegra124_mc_resets[] = {
 };
 
 #ifdef CONFIG_ARCH_TEGRA_124_SOC
+static const unsigned long tegra124_mc_emem_regs[] = {
+	MC_EMEM_ARB_CFG,
+	MC_EMEM_ARB_OUTSTANDING_REQ,
+	MC_EMEM_ARB_TIMING_RCD,
+	MC_EMEM_ARB_TIMING_RP,
+	MC_EMEM_ARB_TIMING_RC,
+	MC_EMEM_ARB_TIMING_RAS,
+	MC_EMEM_ARB_TIMING_FAW,
+	MC_EMEM_ARB_TIMING_RRD,
+	MC_EMEM_ARB_TIMING_RAP2PRE,
+	MC_EMEM_ARB_TIMING_WAP2PRE,
+	MC_EMEM_ARB_TIMING_R2R,
+	MC_EMEM_ARB_TIMING_W2W,
+	MC_EMEM_ARB_TIMING_R2W,
+	MC_EMEM_ARB_TIMING_W2R,
+	MC_EMEM_ARB_DA_TURNS,
+	MC_EMEM_ARB_DA_COVERS,
+	MC_EMEM_ARB_MISC0,
+	MC_EMEM_ARB_MISC1,
+	MC_EMEM_ARB_RING1_THROTTLE
+};
+
 static const struct tegra_smmu_soc tegra124_smmu_soc = {
 	.clients = tegra124_mc_clients,
 	.num_clients = ARRAY_SIZE(tegra124_mc_clients),
-- 
2.22.0.rc2.383.gf4fbbf30c2-goog
