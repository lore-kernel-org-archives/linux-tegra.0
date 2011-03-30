From: Nicolas Kaiser <nikai-bVCNqDZ4lKNeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] arm: tegra: fix error check in tegra2_clocks.c
Date: Wed, 30 Mar 2011 15:59:11 +0200
Message-ID: <20110330155911.6dc0ef63@absol.kitzblitz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Checking 'rate < 0' doesn't work because 'rate' is unsigned.

Signed-off-by: Nicolas Kaiser <nikai-bVCNqDZ4lKNeoWH0uzbU5w@public.gmane.org>
---
Untested.

 arch/arm/mach-tegra/tegra2_clocks.c |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-tegra/tegra2_clocks.c b/arch/arm/mach-tegra/tegra2_clocks.c
index 6d7c4ee..4459470 100644
--- a/arch/arm/mach-tegra/tegra2_clocks.c
+++ b/arch/arm/mach-tegra/tegra2_clocks.c
@@ -1362,14 +1362,15 @@ static int tegra_clk_shared_bus_set_rate(struct clk *c, unsigned long rate)
 {
 	unsigned long flags;
 	int ret;
+	long new_rate = rate;
 
-	rate = clk_round_rate(c->parent, rate);
-	if (rate < 0)
-		return rate;
+	new_rate = clk_round_rate(c->parent, new_rate);
+	if (new_rate < 0)
+		return new_rate;
 
 	spin_lock_irqsave(&c->parent->spinlock, flags);
 
-	c->u.shared_bus_user.rate = rate;
+	c->u.shared_bus_user.rate = new_rate;
 	ret = tegra_clk_shared_bus_update(c->parent);
 
 	spin_unlock_irqrestore(&c->parent->spinlock, flags);
-- 
1.7.3.4
