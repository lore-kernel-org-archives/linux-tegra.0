From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v8 12/19] cpuidle: Avoid NULL dereference in cpuidle_driver_state_disabled()
Date: Tue,  3 Dec 2019 03:41:09 +0300
Message-ID: <20191203004116.11771-13-digetx@gmail.com>
References: <20191203004116.11771-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191203004116.11771-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The cpumask is NULL if cpuidle_driver_state_disabled() is called before
cpuidle driver is initialized. This shouldn't be a problem for now because
cpuidle drivers are registered quite early. The NVIDIA Tegra cpuidle
driver is going to be moved to a later init stage and thus it could become
a problem if PCIE driver is probed earlier than cpuidle.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/cpuidle/driver.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/cpuidle/driver.c b/drivers/cpuidle/driver.c
index c76423aaef4d..f8164f56c420 100644
--- a/drivers/cpuidle/driver.c
+++ b/drivers/cpuidle/driver.c
@@ -403,6 +403,9 @@ void cpuidle_driver_state_disabled(struct cpuidle_driver *drv, int idx,
 
 	mutex_lock(&cpuidle_lock);
 
+	if (!drv->cpumask)
+		goto unlock;
+
 	for_each_cpu(cpu, drv->cpumask) {
 		struct cpuidle_device *dev = per_cpu(cpuidle_devices, cpu);
 
@@ -415,5 +418,6 @@ void cpuidle_driver_state_disabled(struct cpuidle_driver *drv, int idx,
 			dev->states_usage[idx].disable &= ~CPUIDLE_STATE_DISABLED_BY_DRIVER;
 	}
 
+unlock:
 	mutex_unlock(&cpuidle_lock);
 }
-- 
2.24.0
