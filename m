From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2 1/8] clk: rockchip: Staticize file-scope declarations
Date: Tue, 28 Apr 2015 13:46:16 +0900
Message-ID: <1430196383-9190-2-git-send-email-k.kozlowski@samsung.com>
References: <1430196383-9190-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1430196383-9190-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, Max Filippov <jcmvbkbc@gmail.com>, Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene@kernel.org>, Barry Song <baohua@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-tegra@vger.kernel.org

Add missing static to local (file-scope only) symbols.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/clk/rockchip/clk-rk3188.c | 2 +-
 drivers/clk/rockchip/clk-rk3288.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3188.c b/drivers/clk/rockchip/clk-rk3188.c
index 556ce041d371..e4f9d472f1ff 100644
--- a/drivers/clk/rockchip/clk-rk3188.c
+++ b/drivers/clk/rockchip/clk-rk3188.c
@@ -26,7 +26,7 @@ enum rk3188_plls {
 	apll, cpll, dpll, gpll,
 };
 
-struct rockchip_pll_rate_table rk3188_pll_rates[] = {
+static struct rockchip_pll_rate_table rk3188_pll_rates[] = {
 	RK3066_PLL_RATE(2208000000, 1, 92, 1),
 	RK3066_PLL_RATE(2184000000, 1, 91, 1),
 	RK3066_PLL_RATE(2160000000, 1, 90, 1),
diff --git a/drivers/clk/rockchip/clk-rk3288.c b/drivers/clk/rockchip/clk-rk3288.c
index d17eb4528a28..4f817ed9e6ee 100644
--- a/drivers/clk/rockchip/clk-rk3288.c
+++ b/drivers/clk/rockchip/clk-rk3288.c
@@ -27,7 +27,7 @@ enum rk3288_plls {
 	apll, dpll, cpll, gpll, npll,
 };
 
-struct rockchip_pll_rate_table rk3288_pll_rates[] = {
+static struct rockchip_pll_rate_table rk3288_pll_rates[] = {
 	RK3066_PLL_RATE(2208000000, 1, 92, 1),
 	RK3066_PLL_RATE(2184000000, 1, 91, 1),
 	RK3066_PLL_RATE(2160000000, 1, 90, 1),
-- 
1.9.1
