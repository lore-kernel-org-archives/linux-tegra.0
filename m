From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH v9 02/22] pinctrl: tegra: Flush pinctrl writes during resume
Date: Fri, 16 Aug 2019 12:41:47 -0700
Message-ID: <1565984527-5272-3-git-send-email-skomatineni@nvidia.com>
References: <1565984527-5272-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1565984527-5272-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, skomatineni@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, linux-pm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This patch adds pinctrl register read to flush all the prior pinctrl
writes and then adds barrier for pinctrl register read to complete
during resume to make sure all pinctrl changes are effective.

Acked-by: Thierry Reding <treding@nvidia.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index 5e3c00137d71..e9a7cbb9aa33 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -677,6 +677,10 @@ static int tegra_pinctrl_resume(struct device *dev)
 			writel_relaxed(*backup_regs++, regs++);
 	}
 
+	/* flush all the prior writes */
+	readl_relaxed(pmx->regs[0]);
+	/* wait for pinctrl register read to complete */
+	rmb();
 	return 0;
 }
 
-- 
2.7.4
