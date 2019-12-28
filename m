From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH 12/13] mailbox: omap: do some cleanup
Date: Sat, 28 Dec 2019 18:35:37 +0000
Message-ID: <20191228183538.26189-12-tiny.windzz@gmail.com>
References: <20191228183538.26189-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191228183538.26189-1-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jassisinghbrar@gmail.com, nsaenzjulienne@suse.de, f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, lftan@altera.com, matthias.bgg@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, thierry.reding@gmail.com, jonathanh@nvidia.com, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, nios2-dev@lists.rocketboards.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
Cc: Yangtao Li <tiny.windzz@gmail.com>
List-Id: linux-tegra@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify code.
'i' and 'ret' are variables of the same type and there is no
need to use two lines.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/mailbox/omap-mailbox.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mailbox/omap-mailbox.c b/drivers/mailbox/omap-mailbox.c
index 5978a35aac6d..9b9994be5602 100644
--- a/drivers/mailbox/omap-mailbox.c
+++ b/drivers/mailbox/omap-mailbox.c
@@ -695,8 +695,7 @@ static struct mbox_chan *omap_mbox_of_xlate(struct mbox_controller *controller,
 
 static int omap_mbox_probe(struct platform_device *pdev)
 {
-	struct resource *mem;
-	int ret;
+	int ret, i;
 	struct mbox_chan *chnls;
 	struct omap_mbox **list, *mbox, *mboxblk;
 	struct omap_mbox_fifo_info *finfo, *finfoblk;
@@ -709,7 +708,6 @@ static int omap_mbox_probe(struct platform_device *pdev)
 	u32 num_users, num_fifos;
 	u32 tmp[3];
 	u32 l;
-	int i;
 
 	if (!node) {
 		pr_err("%s: only DT-based devices are supported\n", __func__);
@@ -772,8 +770,7 @@ static int omap_mbox_probe(struct platform_device *pdev)
 	if (!mdev)
 		return -ENOMEM;
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mdev->mbox_base = devm_ioremap_resource(&pdev->dev, mem);
+	mdev->mbox_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mdev->mbox_base))
 		return PTR_ERR(mdev->mbox_base);
 
-- 
2.17.1
