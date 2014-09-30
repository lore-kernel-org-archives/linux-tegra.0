From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH] clk: tegra: Fix order of arguments in WARN
Date: Tue, 30 Sep 2014 09:22:00 +0200
Message-ID: <1412061720-10402-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>
List-Id: linux-tegra@vger.kernel.org

As previously the names of the present clock and its parent were swapped.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>

---

Hi,

I'm not a native English speaker, but the way the current message is made me
think that the clock that failed registration was the wrong one.

Regards,

Tomeu
---
 drivers/clk/tegra/clk-pll.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index c7c6d8f..fd18d2e 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -1565,7 +1565,7 @@ struct clk *tegra_clk_register_pllxc(const char *name, const char *parent_name,
 	parent = __clk_lookup(parent_name);
 	if (!parent) {
 		WARN(1, "parent clk %s of %s must be registered first\n",
-			name, parent_name);
+			parent_name, name);
 		return ERR_PTR(-EINVAL);
 	}
 
@@ -1665,7 +1665,7 @@ struct clk *tegra_clk_register_pllm(const char *name, const char *parent_name,
 	parent = __clk_lookup(parent_name);
 	if (!parent) {
 		WARN(1, "parent clk %s of %s must be registered first\n",
-			name, parent_name);
+			parent_name, name);
 		return ERR_PTR(-EINVAL);
 	}
 
@@ -1706,7 +1706,7 @@ struct clk *tegra_clk_register_pllc(const char *name, const char *parent_name,
 	parent = __clk_lookup(parent_name);
 	if (!parent) {
 		WARN(1, "parent clk %s of %s must be registered first\n",
-			name, parent_name);
+			parent_name, name);
 		return ERR_PTR(-EINVAL);
 	}
 
@@ -1830,7 +1830,7 @@ struct clk *tegra_clk_register_pllss(const char *name, const char *parent_name,
 	parent = __clk_lookup(parent_name);
 	if (!parent) {
 		WARN(1, "parent clk %s of %s must be registered first\n",
-			name, parent_name);
+			parent_name, name);
 		return ERR_PTR(-EINVAL);
 	}
 
-- 
1.9.3
