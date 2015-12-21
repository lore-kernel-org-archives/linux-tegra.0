From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH 1/5] pinctrl-tegra: add missing of_node_put
Date: Mon, 21 Dec 2015 17:39:44 +0100
Message-ID: <1450715988-4770-2-git-send-email-Julia.Lawall@lip6.fr>
References: <1450715988-4770-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <1450715988-4770-1-git-send-email-Julia.Lawall@lip6.fr>
Sender: kernel-janitors-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: kernel-janitors@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

for_each_child_of_node performs an of_node_get on each iteration, so a
return from the loop requires an of_node_put.

A simplified version of the semantic patch that fixes this problem is as
follows (http://coccinelle.lip6.fr):

// <smpl>
@@
local idexpression n;
expression e,e1;
@@

 for_each_child_of_node(e1,n) {
   ...
(
   of_node_put(n);
|
   e = n
|
   return n;
|
+  of_node_put(n);
?  return ...;
)
   ...
 }
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/pinctrl/pinctrl-tegra-xusb.c |    4 +++-
 drivers/pinctrl/pinctrl-tegra.c      |    1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-tegra-xusb.c b/drivers/pinctrl/pinctrl-tegra-xusb.c
index 84a43e6..bd3aa5a 100644
--- a/drivers/pinctrl/pinctrl-tegra-xusb.c
+++ b/drivers/pinctrl/pinctrl-tegra-xusb.c
@@ -253,8 +253,10 @@ static int tegra_xusb_padctl_dt_node_to_map(struct pinctrl_dev *pinctrl,
 		err = tegra_xusb_padctl_parse_subnode(padctl, np, maps,
 						      &reserved_maps,
 						      num_maps);
-		if (err < 0)
+		if (err < 0) {
+			of_node_put(np);
 			return err;
+		}
 	}
 
 	return 0;
diff --git a/drivers/pinctrl/pinctrl-tegra.c b/drivers/pinctrl/pinctrl-tegra.c
index 0fd7fd2..9da4da2 100644
--- a/drivers/pinctrl/pinctrl-tegra.c
+++ b/drivers/pinctrl/pinctrl-tegra.c
@@ -217,6 +217,7 @@ static int tegra_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 		if (ret < 0) {
 			pinctrl_utils_dt_free_map(pctldev, *map,
 				*num_maps);
+			of_node_put(np);
 			return ret;
 		}
 	}

