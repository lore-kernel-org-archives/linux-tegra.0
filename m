From: "Gustavo A. R. Silva" <gustavo-L1vi/lXTdts+Va1GwOuvDg@public.gmane.org>
Subject: [PATCH] gpu: host1x: fix error return code in host1x_probe()
Date: Tue, 8 Aug 2017 00:08:06 -0500
Message-ID: <20170808050806.GA21976@embeddedgus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Gustavo A. R. Silva" <gustavo-L1vi/lXTdts+Va1GwOuvDg@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

platform_get_irq() returns an error code, but the host1x driver
ignores it and always returns -ENXIO. This is not correct and,
prevents -EPROBE_DEFER from being propagated properly.

Notice that platform_get_irq() no longer returns 0 on error:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e330b9a6bb35dc7097a4f02cb1ae7b6f96df92af

Print and propagate the return value of platform_get_irq on failure.

This issue was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <gustavo-L1vi/lXTdts+Va1GwOuvDg@public.gmane.org>
---
 drivers/gpu/host1x/dev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 7782725..7f22c5c 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -134,8 +134,8 @@ static int host1x_probe(struct platform_device *pdev)
 
 	syncpt_irq = platform_get_irq(pdev, 0);
 	if (syncpt_irq < 0) {
-		dev_err(&pdev->dev, "failed to get IRQ\n");
-		return -ENXIO;
+		dev_err(&pdev->dev, "failed to get IRQ: %d\n", syncpt_irq);
+		return syncpt_irq;
 	}
 
 	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
-- 
2.5.0
