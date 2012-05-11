From: Hiroshi DOYU <hdoyu@nvidia.com>
Subject: [PATCH 2/2] ARM: tegra30: MC: Remove unnecessary BUG*()
Date: Fri, 11 May 2012 09:22:10 +0300
Message-ID: <1336717334-23276-2-git-send-email-hdoyu@nvidia.com>
References: <20120511.091655.1764445721704382888.hdoyu@nvidia.com>
 <1336717334-23276-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1336717334-23276-1-git-send-email-hdoyu@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-tegra@vger.kernel.org, Hiroshi DOYU <hdoyu@nvidia.com>, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Accessing interleaved MC register offsets/ranges are verified. BUG*()s
in accessors can be removed.

Signed-off-by: Hiroshi DOYU <hdoyu@nvidia.com>
---
 drivers/memory/tegra30-mc.c |    8 --------
 1 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/drivers/memory/tegra30-mc.c b/drivers/memory/tegra30-mc.c
index c982125..4905cd8 100644
--- a/drivers/memory/tegra30-mc.c
+++ b/drivers/memory/tegra30-mc.c
@@ -93,16 +93,12 @@ static inline u32 mc_readl(struct tegra30_mc *mc, u32 offs)
 {
 	if (offs < 0x10)
 		return readl(mc->regs[0] + offs);
-	BUG_ON(offs < 0x3c);
 	if (offs < 0x1f0)
 		return readl(mc->regs[1] + offs - 0x3c);
-	BUG_ON(offs < 0x200);
 	if (offs < 0x228)
 		return readl(mc->regs[2] + offs - 0x200);
-	BUG_ON(offs < 0x284);
 	if (offs < 0x400)
 		return readl(mc->regs[3] + offs - 0x284);
-	BUG();
 }
 
 static inline void mc_writel(struct tegra30_mc *mc, u32 val, u32 offs)
@@ -111,22 +107,18 @@ static inline void mc_writel(struct tegra30_mc *mc, u32 val, u32 offs)
 		writel(val, mc->regs[0] + offs);
 		return;
 	}
-	BUG_ON(offs < 0x3c);
 	if (offs < 0x1f0) {
 		writel(val, mc->regs[1] + offs - 0x3c);
 		return;
 	}
-	BUG_ON(offs < 0x200);
 	if (offs < 0x228) {
 		writel(val, mc->regs[2] + offs - 0x200);
 		return;
 	}
-	BUG_ON(offs < 0x284);
 	if (offs < 0x400) {
 		writel(val, mc->regs[3] + offs - 0x284);
 		return;
 	}
-	BUG();
 }
 
 static const char * const tegra30_mc_client[] = {
-- 
1.7.5.4
