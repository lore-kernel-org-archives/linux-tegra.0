From: Rhyland Klein <rklein@nvidia.com>
Subject: [Patch V2 8/9] clk: tegra: pll: Fix typos around clearing plle bits during enable
Date: Thu, 14 Jan 2016 14:24:37 -0500
Message-ID: <1452799478-14791-9-git-send-email-rklein@nvidia.com>
References: <1452799478-14791-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452799478-14791-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

While enabling PLLE on both Tegra114 and Tegra210, we should be clearing
PLLE_MISC_VREG_BG_CTRL_MASK and PLLE_MISC_VREG_CTRL_MASK not setting
them. This patch fixes both places where we incorrectly set instead
of cleared those bits.

Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
 drivers/clk/tegra/clk-pll.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index d9c3109b75bd..cb28130e6c0a 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -1401,7 +1401,7 @@ static int clk_plle_tegra114_enable(struct clk_hw *hw)
 	val |= PLLE_MISC_IDDQ_SW_CTRL;
 	val &= ~PLLE_MISC_IDDQ_SW_VALUE;
 	val |= PLLE_MISC_PLLE_PTS;
-	val |= PLLE_MISC_VREG_BG_CTRL_MASK | PLLE_MISC_VREG_CTRL_MASK;
+	val &= ~(PLLE_MISC_VREG_BG_CTRL_MASK | PLLE_MISC_VREG_CTRL_MASK);
 	pll_writel_misc(val, pll);
 	udelay(5);
 
@@ -2035,7 +2035,7 @@ static int clk_plle_tegra210_enable(struct clk_hw *hw)
 	val |= PLLE_MISC_IDDQ_SW_CTRL;
 	val &= ~PLLE_MISC_IDDQ_SW_VALUE;
 	val |= PLLE_MISC_PLLE_PTS;
-	val |= PLLE_MISC_VREG_BG_CTRL_MASK | PLLE_MISC_VREG_CTRL_MASK;
+	val &= ~(PLLE_MISC_VREG_BG_CTRL_MASK | PLLE_MISC_VREG_CTRL_MASK);
 	pll_writel_misc(val, pll);
 	udelay(5);
 
-- 
1.9.1
