From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH 1/2] memory: tegra: delete unneeded of_node_put
Date: Fri,  9 Oct 2015 19:47:40 +0200
Message-ID: <1444412861-2580-2-git-send-email-Julia.Lawall@lip6.fr>
References: <1444412861-2580-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444412861-2580-1-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: kernel-janitors@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Bjorn Helgaas <bhelgaas@google.com>, Jason Cooper <jason@lakedaemon.net>
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
 drivers/memory/tegra/mc.c           |    4 +---
 drivers/memory/tegra/tegra124-emc.c |    4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index 3dac7be..509c8ff 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -995,10 +995,8 @@ tegra_emc_find_node_by_ram_code(struct device_node *node, u32 ram_code)
 		u32 value;
 
 		err = of_property_read_u32(np, "nvidia,ram-code", &value);
-		if (err || (value != ram_code)) {
-			of_node_put(np);
+		if (err || (value != ram_code))
 			continue;
-		}
 
 		return np;
 	}
diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index a1ae0cc..85ce4be 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -206,10 +206,8 @@ static int tegra_mc_setup_timings(struct tegra_mc *mc)
 	for_each_child_of_node(mc->dev->of_node, node) {
 		err = of_property_read_u32(node, "nvidia,ram-code",
 					   &node_ram_code);
-		if (err || (node_ram_code != ram_code)) {
-			of_node_put(node);
+		if (err || (node_ram_code != ram_code))
 			continue;
-		}
 
 		err = load_timings(mc, node);
 		if (err)
