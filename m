From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.1 149/219] clocksource/drivers/tegra: Release all IRQ's on request_irq() error
Date: Mon, 15 Jul 2019 10:02:30 -0400
Message-ID: <20190715140341.6443-149-sashal@kernel.org>
References: <20190715140341.6443-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715140341.6443-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Dmitry Osipenko <digetx@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Sasha Levin <sashal@kernel.org>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Dmitry Osipenko <digetx@gmail.com>

[ Upstream commit 7a3916706e858ad0bc3b5629c68168e1449de26a ]

Release all requested IRQ's on the request error to properly clean up
allocated resources.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Acked-By: Peter De Schrijver <pdeschrijver@nvidia.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clocksource/timer-tegra20.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/timer-tegra20.c b/drivers/clocksource/timer-tegra20.c
index fdb3d795a409..cc18bb135a17 100644
--- a/drivers/clocksource/timer-tegra20.c
+++ b/drivers/clocksource/timer-tegra20.c
@@ -310,7 +310,7 @@ static int __init tegra_init_timer(struct device_node *np)
 			pr_err("%s: can't map IRQ for CPU%d\n",
 			       __func__, cpu);
 			ret = -EINVAL;
-			goto out;
+			goto out_irq;
 		}
 
 		irq_set_status_flags(cpu_to->clkevt.irq, IRQ_NOAUTOEN);
@@ -320,7 +320,8 @@ static int __init tegra_init_timer(struct device_node *np)
 		if (ret) {
 			pr_err("%s: cannot setup irq %d for CPU%d\n",
 				__func__, cpu_to->clkevt.irq, cpu);
-			ret = -EINVAL;
+			irq_dispose_mapping(cpu_to->clkevt.irq);
+			cpu_to->clkevt.irq = 0;
 			goto out_irq;
 		}
 	}
-- 
2.20.1
