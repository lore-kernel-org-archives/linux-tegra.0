From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 13/21] ARM: tegra: clock: Remove unnecessary uses of #ifdef CONFIG_DEBUG_FS
Date: Sun, 13 Feb 2011 01:40:25 -0800
Message-ID: <1297590033-15035-14-git-send-email-ccross@android.com>
References: <1297590033-15035-1-git-send-email-ccross@android.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1297590033-15035-1-git-send-email-ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/mach-tegra/clock.c         |    6 ++----
 arch/arm/mach-tegra/clock.h         |    2 +-
 arch/arm/mach-tegra/tegra2_clocks.c |    4 +---
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-tegra/clock.c b/arch/arm/mach-tegra/clock.c
index 34a1f8d..2d9ddfd 100644
--- a/arch/arm/mach-tegra/clock.c
+++ b/arch/arm/mach-tegra/clock.c
@@ -134,7 +134,7 @@ void clk_init(struct clk *c)
 
 	if (!c->ops || !c->ops->enable) {
 		c->refcnt++;
-		c->set = 1;
+		c->set = true;
 		if (c->parent)
 			c->state = c->parent->state;
 		else
@@ -168,9 +168,7 @@ int clk_enable(struct clk *c)
 				goto out;
 			}
 			c->state = ON;
-#ifdef CONFIG_DEBUG_FS
-			c->set = 1;
-#endif
+			c->set = true;
 		}
 	}
 	c->refcnt++;
diff --git a/arch/arm/mach-tegra/clock.h b/arch/arm/mach-tegra/clock.h
index b460f17..ba8e64f 100644
--- a/arch/arm/mach-tegra/clock.h
+++ b/arch/arm/mach-tegra/clock.h
@@ -80,8 +80,8 @@ struct clk {
 
 #ifdef CONFIG_DEBUG_FS
 	struct dentry		*dent;
-	bool			set;
 #endif
+	bool			set;
 	struct clk_ops		*ops;
 	unsigned long		rate;
 	unsigned long		max_rate;
diff --git a/arch/arm/mach-tegra/tegra2_clocks.c b/arch/arm/mach-tegra/tegra2_clocks.c
index 10b9f63..6905bd0 100644
--- a/arch/arm/mach-tegra/tegra2_clocks.c
+++ b/arch/arm/mach-tegra/tegra2_clocks.c
@@ -1214,9 +1214,7 @@ static void tegra_clk_shared_bus_init(struct clk *c)
 	c->max_rate = c->parent->max_rate;
 	c->u.shared_bus_user.rate = c->parent->max_rate;
 	c->state = OFF;
-#ifdef CONFIG_DEBUG_FS
-	c->set = 1;
-#endif
+	c->set = true;
 
 	list_add_tail(&c->u.shared_bus_user.node,
 		&c->parent->shared_bus_list);
-- 
1.7.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
