From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 4/6] cpuidle: tegra: Support CPU cluster power-down on Tegra30
Date: Mon,  8 Jul 2019 02:38:07 +0300
Message-ID: <20190707233809.14400-5-digetx@gmail.com>
References: <20190707233809.14400-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190707233809.14400-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The new CPU Idle driver has all necessary features in order to allow
the deepest idling state on Tegra30 SoC where the whole CPU cluster is
power-gated using the coupled idle state.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---

Please note that outer_disable() has a WARN_ON(num_online_cpus > 1)
and it doesn't know that we turned off those secondary CPUs, hence the
outer_cache.disable() is now invoked directly.

 arch/arm/mach-tegra/pm.c        | 4 ++--
 drivers/cpuidle/cpuidle-tegra.c | 4 +---
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-tegra/pm.c b/arch/arm/mach-tegra/pm.c
index f9c9bce9e15d..cc941b0c97e8 100644
--- a/arch/arm/mach-tegra/pm.c
+++ b/arch/arm/mach-tegra/pm.c
@@ -146,8 +146,8 @@ static int tegra_sleep_cpu(unsigned long v2p)
 	 * if any of secondary CPU's is online and this is the LP2-idle
 	 * code-path only for Tegra20/30.
 	 */
-	if (trusted_foundations_registered())
-		outer_disable();
+	if (trusted_foundations_registered() && outer_cache.disable)
+		outer_cache.disable();
 
 	/*
 	 * Note that besides of setting up CPU reset vector this firmware
diff --git a/drivers/cpuidle/cpuidle-tegra.c b/drivers/cpuidle/cpuidle-tegra.c
index 3fad4a0cbc78..31eeef22c0ff 100644
--- a/drivers/cpuidle/cpuidle-tegra.c
+++ b/drivers/cpuidle/cpuidle-tegra.c
@@ -202,10 +202,8 @@ static int tegra_cpuidle_probe(struct platform_device *pdev)
 	switch (tegra_get_chip_id()) {
 	case TEGRA20:
 		tegra_idle_driver.states[1].disabled = true;
-		tegra_idle_driver.states[3].disabled = true;
-		break;
+		/* fall through */
 	case TEGRA30:
-		tegra_idle_driver.states[2].disabled = true;
 		tegra_idle_driver.states[3].disabled = true;
 		break;
 	case TEGRA114:
-- 
2.22.0
