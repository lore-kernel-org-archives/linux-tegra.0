From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.4 09/14] pinctrl: tegra: Fix write barrier placement in pmx_writel
Date: Tue, 24 Sep 2019 12:52:07 -0400
Message-ID: <20190924165214.28857-9-sashal@kernel.org>
References: <20190924165214.28857-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190924165214.28857-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Sowjanya Komatineni <skomatineni@nvidia.com>, Thierry Reding <treding@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Sasha Levin <sashal@kernel.org>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Sowjanya Komatineni <skomatineni@nvidia.com>

[ Upstream commit c2cf351eba2ff6002ce8eb178452219d2521e38e ]

pmx_writel uses writel which inserts write barrier before the
register write.

This patch has fix to replace writel with writel_relaxed followed
by a readback and memory barrier to ensure write operation is
completed for successful pinctrl change.

Acked-by: Thierry Reding <treding@nvidia.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
Link: https://lore.kernel.org/r/1565984527-5272-2-git-send-email-skomatineni@nvidia.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/pinctrl-tegra.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-tegra.c b/drivers/pinctrl/pinctrl-tegra.c
index 0fd7fd2b0f72c..a30e967d75c2a 100644
--- a/drivers/pinctrl/pinctrl-tegra.c
+++ b/drivers/pinctrl/pinctrl-tegra.c
@@ -52,7 +52,9 @@ static inline u32 pmx_readl(struct tegra_pmx *pmx, u32 bank, u32 reg)
 
 static inline void pmx_writel(struct tegra_pmx *pmx, u32 val, u32 bank, u32 reg)
 {
-	writel(val, pmx->regs[bank] + reg);
+	writel_relaxed(val, pmx->regs[bank] + reg);
+	/* make sure pinmux register write completed */
+	pmx_readl(pmx, bank, reg);
 }
 
 static int tegra_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
-- 
2.20.1
