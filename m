From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 8/8] MIPS: Alchemy: Remove unneeded cast removing const
Date: Wed, 08 Apr 2015 15:22:19 +0200
Message-ID: <1428499339-29569-9-git-send-email-k.kozlowski@samsung.com>
References: <1428499339-29569-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1428499339-29569-1-git-send-email-k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Max Filippov <jcmvbkbc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Barry Song <baohua-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Parent names in clock init data is now array of const pointers to const
strings so the cast is not needed.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
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
