From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 2/4] clk: tegra: add fence_delay for clock registers
Date: Thu, 16 Nov 2017 16:29:00 +0200
Message-ID: <1510842542-16451-3-git-send-email-pdeschrijver@nvidia.com>
References: <1510842542-16451-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1510842542-16451-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

To ensure writes to clock registers have properly propagated through the
clock control logic and state machines, we need to ensure the writes have
been posted in the registers and wait for 1us after that.

Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 872f118..d5badbe 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -809,4 +809,11 @@ static inline struct clk *tegra_clk_register_emc(void __iomem *base,
 u16 tegra_pll_get_fixed_mdiv(struct clk_hw *hw, unsigned long input_rate);
 int tegra_pll_p_div_to_hw(struct tegra_clk_pll *pll, u8 p_div);
 
+/* Combined read fence with delay */
+#define fence_udelay(delay, reg)	\
+	do {				\
+		readl(reg);		\
+		udelay(delay);		\
+	} while(0)
+
 #endif /* TEGRA_CLK_H */
-- 
1.9.1
