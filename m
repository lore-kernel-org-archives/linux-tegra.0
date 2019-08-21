From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 2/2] clocksource/drivers: Do not warn on probe defer
Date: Wed, 21 Aug 2019 16:02:41 +0100
Message-ID: <20190821150241.31093-2-jonathanh@nvidia.com>
References: <20190821150241.31093-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190821150241.31093-1-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Deferred probe is an expected return value on many platforms and so
there's no need to output a warning that may potentially confuse users.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/clocksource/timer-probe.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-probe.c b/drivers/clocksource/timer-probe.c
index dda1946e84dd..ee9574da53c0 100644
--- a/drivers/clocksource/timer-probe.c
+++ b/drivers/clocksource/timer-probe.c
@@ -29,7 +29,9 @@ void __init timer_probe(void)
 
 		ret = init_func_ret(np);
 		if (ret) {
-			pr_err("Failed to initialize '%pOF': %d\n", np, ret);
+			if (ret != -EPROBE_DEFER)
+				pr_err("Failed to initialize '%pOF': %d\n", np,
+				       ret);
 			continue;
 		}
 
-- 
2.17.1
