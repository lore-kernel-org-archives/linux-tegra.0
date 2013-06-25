From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 09/11] ARM: tegar: remove the limitation that Tegra114 can't support suspend
Date: Tue, 25 Jun 2013 17:27:53 +0800
Message-ID: <1372152475-18617-10-git-send-email-josephl@nvidia.com>
References: <1372152475-18617-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1372152475-18617-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The Tegra114 can support suspend function now, removing the limitation.

Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/pm.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/mach-tegra/pm.c b/arch/arm/mach-tegra/pm.c
index a0668a2..94b1ee9 100644
--- a/arch/arm/mach-tegra/pm.c
+++ b/arch/arm/mach-tegra/pm.c
@@ -172,10 +172,6 @@ void tegra_idle_lp2_last(void)
 enum tegra_suspend_mode tegra_pm_validate_suspend_mode(
 				enum tegra_suspend_mode mode)
 {
-	/* Tegra114 didn't support any suspending mode yet. */
-	if (tegra_chip_id == TEGRA114)
-		return TEGRA_SUSPEND_NONE;
-
 	/*
 	 * The Tegra devices only support suspending to LP2 currently.
 	 */
-- 
1.8.3.1
