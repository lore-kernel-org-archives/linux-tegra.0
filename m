From: Hiroshi DOYU <hdoyu@nvidia.com>
Subject: [PATCH 2/2] memory: tegra{20,30}-mc: Use dev_err_ratelimited()
Date: Mon, 14 May 2012 10:47:58 +0300
Message-ID: <1336981680-15297-2-git-send-email-hdoyu@nvidia.com>
References: <20120514.104512.775373956832728793.hdoyu@nvidia.com>
 <1336981680-15297-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1336981680-15297-1-git-send-email-hdoyu@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: hdoyu@nvidia.com
Cc: joe@perches.com, linux-tegra@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Introduce a new dev_*_ratelimited() instead of pr_*_ratelimited() for
better info to print.

Signed-off-by: Hiroshi DOYU <hdoyu@nvidia.com>
---
 drivers/memory/tegra20-mc.c |    3 ++-
 drivers/memory/tegra30-mc.c |    3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/tegra20-mc.c b/drivers/memory/tegra20-mc.c
index 21a735e..d525322 100644
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
 
diff --git a/drivers/memory/tegra30-mc.c b/drivers/memory/tegra30-mc.c
index c391c4e..fad6bb5 100644
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
 
-- 
1.7.5.4
