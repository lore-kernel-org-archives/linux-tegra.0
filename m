From: Amitoj Kaur Chawla <amitoj1606-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2] drm/tegra: dpaux: Modify error handling
Date: Mon, 15 Aug 2016 10:27:49 +0530
Message-ID: <20160815045748.GA12947@amitoj-Inspiron-3542>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: julia.lawall-L2FTfq7BK8M@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

devm_pinctrl_register returns an ERR_PTR in case of error and should
have an IS_ERR check instead of a null check.

The Coccinelle semantic patch used to make this change is as follows:
@@
expression e;
@@

  e = devm_pinctrl_register(...);
if(
-    !e
+    IS_ERR(e)
    )
    {
  <+...
  return
- ...
+ PTR_ERR(e)
  ;
  ...+>
  }

Signed-off-by: Amitoj Kaur Chawla <amitoj1606-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
Changes in v2:
        -Correct typo

 drivers/gpu/drm/tegra/dpaux.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index 059f409..2fde44c 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -539,9 +539,9 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 	dpaux->desc.owner = THIS_MODULE;
 
 	dpaux->pinctrl = devm_pinctrl_register(&pdev->dev, &dpaux->desc, dpaux);
-	if (!dpaux->pinctrl) {
+	if (IS_ERR(dpaux->pinctrl)) {
 		dev_err(&pdev->dev, "failed to register pincontrol\n");
-		return -ENODEV;
+		return PTR_ERR(dpaux->pinctrl);
 	}
 #endif
 	/* enable and clear all interrupts */
-- 
1.9.1
