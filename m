From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH 2/2] clk: tegra: delete unneeded of_node_put
Date: Fri,  9 Oct 2015 19:47:41 +0200
Message-ID: <1444412861-2580-3-git-send-email-Julia.Lawall@lip6.fr>
References: <1444412861-2580-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <1444412861-2580-1-git-send-email-Julia.Lawall@lip6.fr>
Sender: kernel-janitors-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: kernel-janitors@vger.kernel.org, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Bjorn Helgaas <bhelgaas@google.com>, Jason Cooper <jason@lakedaemon.net>
List-Id: linux-tegra@vger.kernel.org

for_each_child_of_node performs an of_node_put on each iteration, so
putting an of_node_put before a continue results in a double put.

The semantic match that finds this problem is as follows
(http://coccinelle.lip6.fr):

// <smpl>
@@
expression root,e;
local idexpression child;
iterator name for_each_child_of_node;
@@

 for_each_child_of_node(root, child) {
   ... when != of_node_get(child)
*  of_node_put(child);
   ...
*  continue;
}
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/clk/tegra/clk-emc.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-emc.c b/drivers/clk/tegra/clk-emc.c
index 138a94b..e1fe8f3 100644
--- a/drivers/clk/tegra/clk-emc.c
+++ b/drivers/clk/tegra/clk-emc.c
@@ -491,10 +491,8 @@ struct clk *tegra_clk_register_emc(void __iomem *base, struct device_node *np,
 	for_each_child_of_node(np, node) {
 		err = of_property_read_u32(node, "nvidia,ram-code",
 					   &node_ram_code);
-		if (err) {
-			of_node_put(node);
+		if (err)
 			continue;
-		}
 
 		/*
 		 * Store timings for all ram codes as we cannot read the

