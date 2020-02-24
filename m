From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v11 08/17] ARM: tegra: Make outer_disable() open-coded
Date: Tue, 25 Feb 2020 01:40:48 +0300
Message-ID: <20200224224057.21877-9-digetx@gmail.com>
References: <20200224224057.21877-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200224224057.21877-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, Jasper Korten <jja2000@gmail.com>, David Heidelberg <david@ixit.cz>, Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The outer_disable() of Tegra's suspend code is open-coded now since
that helper produces spurious warning message about secondary CPUs being
online when CPU enters into LP2 from cpuidle. The secondaries are actually
halted by the cpuidle driver on entering into LP2 idle-state, but the
online status is not touched by the cpuidle. This fixes a storm of
warnings once LP2 idling state is enabled on Tegra30. The outer_disable()
helper has sanity checks for interrupts and secondary CPUs being disabled
and we are pretty confident about the interrupts state during of CPU
idling / system suspend. The rail-off status check is added in this patch
as equivalent for the "num_online_cpus() > 1".

Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Jasper Korten <jja2000@gmail.com>
Tested-by: David Heidelberg <david@ixit.cz>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/mach-tegra/pm.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-tegra/pm.c b/arch/arm/mach-tegra/pm.c
index 7d9ef26e52a7..d1e1a61b12cf 100644
--- a/arch/arm/mach-tegra/pm.c
+++ b/arch/arm/mach-tegra/pm.c
@@ -138,6 +138,10 @@ void tegra_pm_set_cpu_in_lp2(void)
 
 static int tegra_sleep_cpu(unsigned long v2p)
 {
+	if (tegra_cpu_car_ops->rail_off_ready &&
+	    WARN_ON(!tegra_cpu_rail_off_ready()))
+		return -EBUSY;
+
 	/*
 	 * L2 cache disabling using kernel API only allowed when all
 	 * secondary CPU's are offline. Cache have to be disabled with
@@ -146,9 +150,10 @@ static int tegra_sleep_cpu(unsigned long v2p)
 	 * if any of secondary CPU's is online and this is the LP2-idle
 	 * code-path only for Tegra20/30.
 	 */
-	if (trusted_foundations_registered())
-		outer_disable();
-
+#ifdef CONFIG_OUTER_CACHE
+	if (trusted_foundations_registered() && outer_cache.disable)
+		outer_cache.disable();
+#endif
 	/*
 	 * Note that besides of setting up CPU reset vector this firmware
 	 * call may also do the following, depending on the FW version:
-- 
2.24.0
