From: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [v2 1/2] ARM: tegra20: MC: Remove unnecessary BUG*()
Date: Fri, 11 May 2012 13:04:44 +0300
Message-ID: <1336730689-27092-1-git-send-email-hdoyu@nvidia.com>
References: <1336717334-23276-2-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1336717334-23276-2-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Accessing interleaved MC register offsets/ranges are verified. BUG*()s
in accessors can be removed.

Signed-off-by: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/memory/tegra20-mc.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/memory/tegra20-mc.c b/drivers/memory/tegra20-mc.c
index c0bfffa..2a437e9 100644
--- a/drivers/memory/tegra20-mc.c
+++ b/drivers/memory/tegra20-mc.c
@@ -53,12 +53,14 @@ struct tegra20_mc {
 
 static inline u32 mc_readl(struct tegra20_mc *mc, u32 offs)
 {
+	u32 val = 0;
+
 	if (offs < 0x24)
-		return readl(mc->regs[0] + offs);
-	BUG_ON(offs < 0x3c);
+		val = readl(mc->regs[0] + offs);
 	if (offs < 0x400)
-		return readl(mc->regs[1] + offs - 0x3c);
-	BUG();
+		val = readl(mc->regs[1] + offs - 0x3c);
+
+	return val;
 }
 
 static inline void mc_writel(struct tegra20_mc *mc, u32 val, u32 offs)
@@ -67,12 +69,10 @@ static inline void mc_writel(struct tegra20_mc *mc, u32 val, u32 offs)
 		writel(val, mc->regs[0] + offs);
 		return;
 	}
-	BUG_ON(offs < 0x3c);
 	if (offs < 0x400) {
 		writel(val, mc->regs[1] + offs - 0x3c);
 		return;
 	}
-	BUG();
 }
 
 static const char * const tegra20_mc_client[] = {
-- 
1.7.5.4
