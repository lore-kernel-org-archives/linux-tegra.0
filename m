From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v6 12/18] arm: tegra20/30: cpuidle: Remove unnecessary memory barrier
Date: Tue, 15 Oct 2019 20:00:09 +0300
Message-ID: <20191015170015.1135-13-digetx@gmail.com>
References: <20191015170015.1135-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191015170015.1135-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

There is no good justification for smp_rmb() after returning from LP2
because there are no memory operations that require SMP synchronization.
Thus remove the confusing barrier.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/mach-tegra/cpuidle-tegra20.c | 2 --
 arch/arm/mach-tegra/cpuidle-tegra30.c | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/arm/mach-tegra/cpuidle-tegra20.c b/arch/arm/mach-tegra/cpuidle-tegra20.c
index fe80f1988120..af2cd339db43 100644
--- a/arch/arm/mach-tegra/cpuidle-tegra20.c
+++ b/arch/arm/mach-tegra/cpuidle-tegra20.c
@@ -193,8 +193,6 @@ static int tegra20_idle_lp2_coupled(struct cpuidle_device *dev,
 
 	local_fiq_enable();
 
-	smp_rmb();
-
 	return entered_lp2 ? index : 0;
 }
 #endif
diff --git a/arch/arm/mach-tegra/cpuidle-tegra30.c b/arch/arm/mach-tegra/cpuidle-tegra30.c
index a4f0add46a27..80ae64bcdf50 100644
--- a/arch/arm/mach-tegra/cpuidle-tegra30.c
+++ b/arch/arm/mach-tegra/cpuidle-tegra30.c
@@ -113,8 +113,6 @@ static int tegra30_idle_lp2(struct cpuidle_device *dev,
 
 	local_fiq_enable();
 
-	smp_rmb();
-
 	return (entered_lp2) ? index : 0;
 }
 #endif
-- 
2.23.0
