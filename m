From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH 04/12] phy: tegra: add missing of_node_put after of_device_is_available
Date: Sat, 23 Feb 2019 14:20:35 +0100
Message-ID: <1550928043-14889-5-git-send-email-Julia.Lawall@lip6.fr>
References: <1550928043-14889-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550928043-14889-1-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: kernel-janitors@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Add an of_node_put when a tested device node is not available.

The semantic patch that fixes this problem is as follows
(http://coccinelle.lip6.fr):

// <smpl>
@@
identifier f;
local idexpression e;
expression x;
@@

e = f(...);
... when != of_node_put(e)
    when != x = e
    when != e = x
    when any
if (<+...of_device_is_available(e)...+>) {
  ... when != of_node_put(e)
(
  return e;
|
+ of_node_put(e);
  return ...;
)
}
// </smpl>

Fixes: 53d2a715c2403 ("phy: Add Tegra XUSB pad controller support")
Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/phy/tegra/xusb.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff -u -p a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -260,8 +260,10 @@ tegra_xusb_pad_create(struct tegra_xusb_
 	int err;
 
 	np = tegra_xusb_find_pad_node(padctl, soc->name);
-	if (!np || !of_device_is_available(np))
+	if (!np || !of_device_is_available(np)) {
+		of_node_put(np);
 		return NULL;
+	}
 
 	pad = soc->ops->probe(padctl, soc, np);
 	if (IS_ERR(pad)) {
