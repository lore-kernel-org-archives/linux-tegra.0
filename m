From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2 5/8] clk: cdce706: Constify parent names in clock init data
Date: Tue, 28 Apr 2015 13:46:20 +0900
Message-ID: <1430196383-9190-6-git-send-email-k.kozlowski@samsung.com>
References: <1430196383-9190-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1430196383-9190-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, Max Filippov <jcmvbkbc@gmail.com>, Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene@kernel.org>, Barry Song <baohua@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-tegra@vger.kernel.org

The array of parent names can be made as array of const pointers to
const strings.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/clk/clk-cdce706.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-cdce706.c b/drivers/clk/clk-cdce706.c
index b8e4f8a822e9..8a2dfd0012f3 100644
--- a/drivers/clk/clk-cdce706.c
+++ b/drivers/clk/clk-cdce706.c
@@ -94,7 +94,7 @@ static const char * const cdce706_source_name[] = {
 	"clk_in0", "clk_in1",
 };
 
-static const char *cdce706_clkin_name[] = {
+static const char * const cdce706_clkin_name[] = {
 	"clk_in",
 };
 
@@ -102,7 +102,7 @@ static const char * const cdce706_pll_name[] = {
 	"pll1", "pll2", "pll3",
 };
 
-static const char *cdce706_divider_parent_name[] = {
+static const char * const cdce706_divider_parent_name[] = {
 	"clk_in", "pll1", "pll2", "pll2", "pll3",
 };
 
-- 
1.9.1
