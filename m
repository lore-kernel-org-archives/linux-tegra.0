From: "Jeremy C. Andrus" <jeremya-eQaUEPhvms7ENvBUuze7eA@public.gmane.org>
Subject: [RFC PATCH 2/5] arm: tegra: Fix modem_reset_flag assignment
Date: Wed, 16 Jan 2013 14:56:10 -0500
Message-ID: <1358366173-56861-3-git-send-email-jeremya@cs.columbia.edu>
References: <1358366173-56861-1-git-send-email-jeremya@cs.columbia.edu>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358366173-56861-1-git-send-email-jeremya-eQaUEPhvms7ENvBUuze7eA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "Jeremy C. Andrus" <jeremya-eQaUEPhvms7ENvBUuze7eA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: "Jeremy C. Andrus" <jeremya-eQaUEPhvms7ENvBUuze7eA@public.gmane.org>

The modem_reset_flag should be assigned to 0
(not checked for equality to 0)

Signed-off-by: Jeremy C. Andrus <jeremya-eQaUEPhvms7ENvBUuze7eA@public.gmane.org>

Change-Id: I39043807644861e2ba4219723d763298c3b41203
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
---
 arch/arm/mach-tegra/baseband-xmm-power.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-tegra/baseband-xmm-power.c b/arch/arm/mach-tegra/baseband-xmm-power.c
index 11d9b3f..40ef4e1 100755
--- a/arch/arm/mach-tegra/baseband-xmm-power.c
+++ b/arch/arm/mach-tegra/baseband-xmm-power.c
@@ -807,7 +807,7 @@ static void baseband_xmm_power_init2_work(struct work_struct *work)
 		} else
 			pr_err("%s: hsic_register is missing\n", __func__);
 		register_hsic_device = false;
-		modem_reset_flag == 0;
+		modem_reset_flag = 0;
 	}
 
 }
-- 
1.8.1
