From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH v9 01/14] clk: tegra: provide dummy cpu car ops
Date: Wed, 3 Apr 2013 17:40:35 +0300
Message-ID: <1365000110-8916-2-git-send-email-pdeschrijver@nvidia.com>
References: <1365000110-8916-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1365000110-8916-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Stephen Warren <swarren@wwwdotorg.org>, Russell King <linux@arm.linux.org.uk>, Prashant Gaikwad <pgaikwad@nvidia.com>, Simon Glass <sjg@chromium.org>, Rhyland Klein <rklein@nvidia.com>, Pritesh Raithatha <praithatha@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Hiroshi Doyu <hdoyu@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Andrew Chew <achew@nvidia.com>, Mike Turquette <mturquette@linaro.org>, Thierry Reding <thierry.reding@avionic-design.de>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

tegra_boot_secondary() relies on some of the car ops. This means having an
uninitialized tegra_cpu_car_ops will lead to an early boot panic.
Providing a dummy struct avoids this and makes adding Tegra114 clock support
in a bisectable way a lot easier.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/tegra/clk.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
index 4a61d15..70b7a47 100644
--- a/drivers/clk/tegra/clk.c
+++ b/drivers/clk/tegra/clk.c
@@ -22,7 +22,8 @@
 #include "clk.h"
 
 /* Global data of Tegra CPU CAR ops */
-struct tegra_cpu_car_ops *tegra_cpu_car_ops;
+static struct tegra_cpu_car_ops dummy_car_ops;
+struct tegra_cpu_car_ops *tegra_cpu_car_ops = &dummy_car_ops;
 
 void __init tegra_init_dup_clks(struct tegra_clk_duplicate *dup_list,
 				struct clk *clks[], int clk_max)
-- 
1.7.7.rc0.72.g4b5ea.dirty

