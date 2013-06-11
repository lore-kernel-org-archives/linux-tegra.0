From: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] memory: tegra20-mc: Fix hang in IRQ handler.
Date: Tue, 11 Jun 2013 13:11:18 +0300
Message-ID: <1370945479-2917-2-git-send-email-ttynkkynen@nvidia.com>
References: <1370945479-2917-1-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370945479-2917-1-git-send-email-ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

In Tegra20 any memory controller interrupt would cause an
infinite loop in the IRQ handler.

Signed-off-by: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/memory/tegra20-mc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/memory/tegra20-mc.c b/drivers/memory/tegra20-mc.c
index 2ca5f28..0548eea 100644
--- a/drivers/memory/tegra20-mc.c
+++ b/drivers/memory/tegra20-mc.c
@@ -193,8 +193,11 @@ static irqreturn_t tegra20_mc_isr(int irq, void *data)
 	mask &= stat;
 	if (!mask)
 		return IRQ_NONE;
-	while ((bit = ffs(mask)) != 0)
+	while ((bit = ffs(mask)) != 0) {
 		tegra20_mc_decode(mc, bit - 1);
+		mask &= ~BIT(bit - 1);
+	}
+
 	mc_writel(mc, stat, MC_INTSTATUS);
 	return IRQ_HANDLED;
 }
-- 
1.8.1.5
