From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 06/21] ARM: tegra: clock: Initialize clocks that have no enable
Date: Sun, 13 Feb 2011 01:40:18 -0800
Message-ID: <1297590033-15035-7-git-send-email-ccross@android.com>
References: <1297590033-15035-1-git-send-email-ccross@android.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1297590033-15035-1-git-send-email-ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Assume that any clock that has no enable op is always on.

Signed-off-by: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/mach-tegra/clock.c |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/clock.c b/arch/arm/mach-tegra/clock.c
index 0ea5d92..79c0bd8 100644
--- a/arch/arm/mach-tegra/clock.c
+++ b/arch/arm/mach-tegra/clock.c
@@ -166,6 +166,15 @@ void clk_init(struct clk *c)
 	if (c->ops && c->ops->init)
 		c->ops->init(c);
 
+	if (!c->ops || !c->ops->enable) {
+		c->refcnt++;
+		c->set = 1;
+		if (c->parent)
+			c->state = c->parent->state;
+		else
+			c->state = ON;
+	}
+
 	clk_recalculate_rate(c);
 
 	list_add(&c->node, &clocks);
-- 
1.7.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
