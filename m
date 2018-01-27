From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH] firmware: tegra: adjust tested variable
Date: Sat, 27 Jan 2018 15:28:28 +0100
Message-ID: <1517063308-16679-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <kernel-janitors-owner@vger.kernel.org>
Sender: kernel-janitors-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Check the variable that was most recently initialized.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x, y, f, g, e, m;
statement S1,S2,S3,S4;
@@

x = f(...);
if (\(<+...x...+>\&e\)) S1 else S2
(
x = g(...);
|
m = g(...,&x,...);
|
y = g(...);
*if (e)
 S3 else S4
)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/firmware/tegra/bpmp.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index a7f461f..96362b5 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -732,7 +732,7 @@ static int tegra_bpmp_probe(struct platform_device *pdev)
 	}
 
 	bpmp->rx.virt = gen_pool_dma_alloc(bpmp->rx.pool, 4096, &bpmp->rx.phys);
-	if (!bpmp->rx.pool) {
+	if (!bpmp->rx.virt) {
 		dev_err(&pdev->dev, "failed to allocate from RX pool\n");
 		err = -ENOMEM;
 		goto free_tx;

