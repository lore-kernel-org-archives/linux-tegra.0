From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH 16/29] amba: tegra-ahb: simplify use of devm_ioremap_resource
Date: Wed, 14 Aug 2013 11:11:20 +0200
Message-ID: <1376471493-22215-17-git-send-email-Julia.Lawall@lip6.fr>
References: <1376471493-22215-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1376471493-22215-1-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@arm.linux.org.uk>
Cc: kernel-janitors@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Remove unneeded error handling on the result of a call to
platform_get_resource when the value is passed to devm_ioremap_resource.

A simplified version of the semantic patch that makes this change is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression pdev,res,n,e,e1;
expression ret != 0;
identifier l;
@@

- res = platform_get_resource(pdev, IORESOURCE_MEM, n);
  ... when != res
- if (res == NULL) { ... \(goto l;\|return ret;\) }
  ... when != res
+ res = platform_get_resource(pdev, IORESOURCE_MEM, n);
  e = devm_ioremap_resource(e1, res);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/amba/tegra-ahb.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/amba/tegra-ahb.c b/drivers/amba/tegra-ahb.c
index 1f44e56..558a239 100644
--- a/drivers/amba/tegra-ahb.c
+++ b/drivers/amba/tegra-ahb.c
@@ -256,8 +256,6 @@ static int tegra_ahb_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENODEV;
 	ahb->regs = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(ahb->regs))
 		return PTR_ERR(ahb->regs);
