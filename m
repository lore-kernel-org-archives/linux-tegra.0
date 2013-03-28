From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH 2/2] ARM: tegra: powergate: Don't error out if new state == old state
Date: Thu, 28 Mar 2013 21:35:04 +0100
Message-ID: <1364502904-5284-2-git-send-email-thierry.reding@avionic-design.de>
References: <1364502904-5284-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1364502904-5284-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Don't treat it as an error if a partition is already in the same power
state when a user wants to power it on or off. This allows code to
proceed if no state change is required.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 arch/arm/mach-tegra/powergate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-tegra/powergate.c b/arch/arm/mach-tegra/powergate.c
index c472bed..af9067e 100644
--- a/arch/arm/mach-tegra/powergate.c
+++ b/arch/arm/mach-tegra/powergate.c
@@ -76,7 +76,7 @@ static int tegra_powergate_set(int id, bool new_state)
 
 	if (status == new_state) {
 		spin_unlock_irqrestore(&tegra_powergate_lock, flags);
-		return -EINVAL;
+		return 0;
 	}
 
 	pmc_write(PWRGATE_TOGGLE_START | id, PWRGATE_TOGGLE);
-- 
1.8.1.5
