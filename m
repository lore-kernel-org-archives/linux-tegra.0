From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 5/5] ARM: tegra: cpuidle: use firmware call for power down
Date: Tue, 21 Jan 2014 19:10:16 +0900
Message-ID: <1390299016-14105-6-git-send-email-acourbot@nvidia.com>
References: <1390299016-14105-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1390299016-14105-1-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Russell King <linux@arm.linux.org.uk>
Cc: Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com, Alexandre Courbot <acourbot@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Invoke the do_idle() firmware call before suspending a CPU so that the
underlying firmware (if any) can take necessary action.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 arch/arm/mach-tegra/cpuidle-tegra114.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/mach-tegra/cpuidle-tegra114.c b/arch/arm/mach-tegra/cpuidle-tegra114.c
index e0b87300243d..c42fd41065d2 100644
--- a/arch/arm/mach-tegra/cpuidle-tegra114.c
+++ b/arch/arm/mach-tegra/cpuidle-tegra114.c
@@ -19,6 +19,7 @@
 #include <linux/cpuidle.h>
 #include <linux/cpu_pm.h>
 #include <linux/clockchips.h>
+#include <asm/firmware.h>
 
 #include <asm/cpuidle.h>
 #include <asm/suspend.h>
@@ -45,6 +46,8 @@ static int tegra114_idle_power_down(struct cpuidle_device *dev,
 
 	clockevents_notify(CLOCK_EVT_NOTIFY_BROADCAST_ENTER, &dev->cpu);
 
+	call_firmware_op(do_idle);
+
 	cpu_suspend(0, tegra30_sleep_cpu_secondary_finish);
 
 	clockevents_notify(CLOCK_EVT_NOTIFY_BROADCAST_EXIT, &dev->cpu);
-- 
1.8.5.3
