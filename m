From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 12/14] ARM: tegra: tegra_powergate_is_powered should be static
Date: Thu,  6 Oct 2011 19:54:22 -0700
Message-ID: <1317956064-17650-13-git-send-email-olof@lixom.net>
References: <1317956064-17650-1-git-send-email-olof@lixom.net>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1317956064-17650-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Not used externally and not exported.

Also, fix return type and change to instead WARN_ON on bad parameters.

Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
---
 arch/arm/mach-tegra/include/mach/powergate.h |    1 -
 arch/arm/mach-tegra/powergate.c              |    5 ++---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-tegra/include/mach/powergate.h b/arch/arm/mach-tegra/include/mach/powergate.h
index 401d1b7..39c396d 100644
--- a/arch/arm/mach-tegra/include/mach/powergate.h
+++ b/arch/arm/mach-tegra/include/mach/powergate.h
@@ -31,7 +31,6 @@
 
 int tegra_powergate_power_on(int id);
 int tegra_powergate_power_off(int id);
-bool tegra_powergate_is_powered(int id);
 int tegra_powergate_remove_clamping(int id);
 
 /* Must be called with clk disabled, and returns with clk enabled */
diff --git a/arch/arm/mach-tegra/powergate.c b/arch/arm/mach-tegra/powergate.c
index 3cee9aa..9483064 100644
--- a/arch/arm/mach-tegra/powergate.c
+++ b/arch/arm/mach-tegra/powergate.c
@@ -89,12 +89,11 @@ int tegra_powergate_power_off(int id)
 	return tegra_powergate_set(id, false);
 }
 
-bool tegra_powergate_is_powered(int id)
+static bool tegra_powergate_is_powered(int id)
 {
 	u32 status;
 
-	if (id < 0 || id >= TEGRA_NUM_POWERGATE)
-		return -EINVAL;
+	WARN_ON(id < 0 || id >= TEGRA_NUM_POWERGATE);
 
 	status = pmc_read(PWRGATE_STATUS) & (1 << id);
 	return !!status;
-- 
1.7.4.1
