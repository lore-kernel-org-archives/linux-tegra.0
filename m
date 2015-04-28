From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2 8/8] MIPS: Alchemy: Remove unneeded cast removing const
Date: Tue, 28 Apr 2015 13:46:23 +0900
Message-ID: <1430196383-9190-9-git-send-email-k.kozlowski@samsung.com>
References: <1430196383-9190-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1430196383-9190-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, Max Filippov <jcmvbkbc@gmail.com>, Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene@kernel.org>, Barry Song <baohua@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-tegra@vger.kernel.org

Parent names in clock init data is now array of const pointers to const
strings so the cast is not needed.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/mips/alchemy/common/clock.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/alchemy/common/clock.c b/arch/mips/alchemy/common/clock.c
index 6a98d2cb402c..6e46abe0dac6 100644
--- a/arch/mips/alchemy/common/clock.c
+++ b/arch/mips/alchemy/common/clock.c
@@ -752,12 +752,12 @@ static int __init alchemy_clk_init_fgens(int ctype)
 	switch (ctype) {
 	case ALCHEMY_CPU_AU1000...ALCHEMY_CPU_AU1200:
 		id.ops = &alchemy_clkops_fgenv1;
-		id.parent_names = (const char **)alchemy_clk_fgv1_parents;
+		id.parent_names = alchemy_clk_fgv1_parents;
 		id.num_parents = 2;
 		break;
 	case ALCHEMY_CPU_AU1300:
 		id.ops = &alchemy_clkops_fgenv2;
-		id.parent_names = (const char **)alchemy_clk_fgv2_parents;
+		id.parent_names = alchemy_clk_fgv2_parents;
 		id.num_parents = 3;
 		break;
 	default:
@@ -961,7 +961,7 @@ static int __init alchemy_clk_setup_imux(int ctype)
 	struct clk *c;
 
 	id.ops = &alchemy_clkops_csrc;
-	id.parent_names = (const char **)alchemy_clk_csrc_parents;
+	id.parent_names = alchemy_clk_csrc_parents;
 	id.num_parents = 7;
 	id.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE;
 
-- 
1.9.1
