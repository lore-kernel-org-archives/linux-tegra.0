From: Hiroshi DOYU <hdoyu@nvidia.com>
Subject: [v2 1/1] memory: tegra{20,30}-mc: Use dev_err_ratelimited()
Date: Mon, 14 May 2012 13:07:03 +0300
Message-ID: <1336990031-15567-1-git-send-email-hdoyu@nvidia.com>
References: <1336981680-15297-2-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1336981680-15297-2-git-send-email-hdoyu@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: hdoyu@nvidia.com
Cc: linux-tegra@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Introduce a new dev_*_ratelimited() instead of pr_*_ratelimited() for
better info to print.

Signed-off-by: Hiroshi DOYU <hdoyu@nvidia.com>
---
 drivers/memory/tegra20-mc.c |    5 +++--
 drivers/memory/tegra30-mc.c |    5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/memory/tegra20-mc.c b/drivers/memory/tegra20-mc.c
index 2a437e9..a38d9d3 100644
--- a/drivers/memory/tegra20-mc.c
+++ b/drivers/memory/tegra20-mc.c
@@ -161,7 +161,8 @@ static void tegra20_mc_decode(struct tegra20_mc *mc, int n)
 
 	idx = n - MC_INT_ERR_SHIFT;
 	if ((idx < 0) || (idx >= ARRAY_SIZE(reg))) {
-		pr_err_ratelimited("Unknown interrupt status %08lx\n", BIT(n));
+		dev_err_ratelimited(mc->dev, "Unknown interrupt status %08lx\n",
+				    BIT(n));
 		return;
 	}
 
@@ -172,7 +173,7 @@ static void tegra20_mc_decode(struct tegra20_mc *mc, int n)
 
 	addr = mc_readl(mc, reg[idx].offset + sizeof(u32));
 
-	pr_err_ratelimited("%s (0x%08x): 0x%08x %s (%s %s)\n",
+	dev_err_ratelimited(mc->dev, "%s (0x%08x): 0x%08x %s (%s %s)\n",
 			   reg[idx].message, req, addr, client,
 			   (req & BIT(reg[idx].write_bit)) ? "write" : "read",
 			   (reg[idx].offset == MC_SECURITY_VIOLATION_STATUS) ?
diff --git a/drivers/memory/tegra30-mc.c b/drivers/memory/tegra30-mc.c
index ec9fc78..cb639b1 100644
--- a/drivers/memory/tegra30-mc.c
+++ b/drivers/memory/tegra30-mc.c
@@ -220,7 +220,8 @@ static void tegra30_mc_decode(struct tegra30_mc *mc, int n)
 
 	idx = n - MC_INT_ERR_SHIFT;
 	if ((idx < 0) || (idx >= ARRAY_SIZE(mc_int_err)) || (idx == 1)) {
-		pr_err_ratelimited("Unknown interrupt status %08lx\n", BIT(n));
+		dev_err_ratelimited(mc->dev, "Unknown interrupt status %08lx\n",
+				    BIT(n));
 		return;
 	}
 
@@ -243,7 +244,7 @@ static void tegra30_mc_decode(struct tegra30_mc *mc, int n)
 
 	addr = readl(mc + MC_ERR_ADR);
 
-	pr_err_ratelimited("%s (0x%08x): 0x%08x %s (%s %s %s %s)\n",
+	dev_err_ratelimited(mc->dev, "%s (0x%08x): 0x%08x %s (%s %s %s %s)\n",
 			   mc_int_err[idx], err, addr, client,
 			   (err & MC_ERR_SECURITY) ? "secure" : "non-secure",
 			   (err & MC_ERR_RW) ? "write" : "read",
-- 
1.7.5.4
