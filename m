Return-Path: <SRS0=/ZgJ=BR=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1D99C433E0
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Aug 2020 16:20:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A786E21744
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Aug 2020 16:20:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="Z3qXOZyN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726058AbgHGQUe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Aug 2020 12:20:34 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:18534 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbgHGQUd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Aug 2020 12:20:33 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2d7f440001>; Fri, 07 Aug 2020 09:20:20 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 07 Aug 2020 09:20:33 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 07 Aug 2020 09:20:33 -0700
Received: from tbergstrom-lnx.Nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Aug
 2020 16:20:33 +0000
Received: from pdeschrijver-desktop.nvidia.com (xn--9q8h [127.0.0.1])
        by tbergstrom-lnx.Nvidia.com (Postfix) with ESMTP id 6B55240BDB;
        Fri,  7 Aug 2020 19:20:31 +0300 (EEST)
From:   Peter De Schrijver <pdeschrijver@nvidia.com>
To:     <treding@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH 2/3 resend] firmware/tegra: Support mail store in DRAM or SRAM
Date:   Fri, 7 Aug 2020 19:20:30 +0300
Message-ID: <20200807162030.17392-1-pdeschrijver@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596817220; bh=CCG4qS+7j+gnGELohrAv685jxKjDKVB0hNMcX8nMuDU=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type:X-Originating-IP:
         X-ClientProxiedBy;
        b=Z3qXOZyNKB2FwQxcTavZafiXcDj5MmPWMVnI3KEiKyR8fx9gn8L1g+M39D3/mH8VO
         zCXwNwMfGDvjO2+LeI0D5sQvxfWPvy/ZbzpLEuwIamQYHDMAm23LkNuTwGIZIUv87X
         n/LZC5NZNILo/zYlQAFkmvgy4wp63ANY+0wtG3cNamiK+p7Dudt7XjwnjLkiJL8t+M
         kvxamwo19sr0n+chBgDmTN0t06bAV6uEuVpcOf801Cf9prjTi+kWYqG77fcajh6tVo
         RMKU1B0ix1CTbgEeEz337/W+aiuT7Hx02vWy/lpF0sa7Yyz9PR6fr7WTqlCUYB8oey
         wy7tEAnbreHug==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

In Tegra234 the memory region to store the messages exchanged between
Linux and BPMP firmware will be located in DRAM rather than SYSRAM as in
previous chips (tegra186 and Tegra194). Refactor the code to support
more than 1 type of memory region.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/firmware/tegra/bpmp-tegra186.c | 175 ++++++++++++++++---------
 1 file changed, 112 insertions(+), 63 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp-tegra186.c b/drivers/firmware/tegra/bpmp-tegra186.c
index ea308751635f..ca04ba4ae643 100644
--- a/drivers/firmware/tegra/bpmp-tegra186.c
+++ b/drivers/firmware/tegra/bpmp-tegra186.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/genalloc.h>
+#include <linux/io.h>
 #include <linux/mailbox_client.h>
 #include <linux/platform_device.h>
 
@@ -13,11 +14,12 @@
 
 #include "bpmp-private.h"
 
+enum tegra_bpmp_mem_type { TEGRA_SRAM, TEGRA_RMEM };
+
 struct tegra186_bpmp {
 	struct tegra_bpmp *parent;
 
 	struct {
-		struct gen_pool *pool;
 		dma_addr_t phys;
 		void *virt;
 	} tx, rx;
@@ -26,6 +28,12 @@ struct tegra186_bpmp {
 		struct mbox_client client;
 		struct mbox_chan *channel;
 	} mbox;
+
+	struct {
+		struct gen_pool *tx, *rx;
+	} sram;
+
+	enum tegra_bpmp_mem_type type;
 };
 
 static inline struct tegra_bpmp *
@@ -160,63 +168,133 @@ static void mbox_handle_rx(struct mbox_client *client, void *data)
 	tegra_bpmp_handle_rx(bpmp);
 }
 
-static int tegra186_bpmp_init(struct tegra_bpmp *bpmp)
+static void tegra186_bpmp_channel_deinit(struct tegra_bpmp *bpmp)
+{
+	int i;
+	struct tegra186_bpmp *priv = bpmp->priv;
+
+	for (i = 0; i < bpmp->threaded.count; i++) {
+		if (!bpmp->threaded_channels[i].bpmp)
+			continue;
+
+		tegra186_bpmp_channel_cleanup(&bpmp->threaded_channels[i]);
+	}
+
+	tegra186_bpmp_channel_cleanup(bpmp->rx_channel);
+	tegra186_bpmp_channel_cleanup(bpmp->tx_channel);
+
+	/* rmem gets cleaned up as part of the rmem device shutdown so no
+	 * need to do anything here.
+	 */
+	if (priv->type == TEGRA_SRAM) {
+		gen_pool_free(priv->sram.tx, (unsigned long)priv->tx.virt, 4096);
+		gen_pool_free(priv->sram.rx, (unsigned long)priv->rx.virt, 4096);
+	}
+}
+
+static int tegra186_bpmp_channel_setup(struct tegra_bpmp *bpmp)
+{
+unsigned int i;
+int err;
+
+	err = tegra186_bpmp_channel_init(bpmp->tx_channel, bpmp,
+	bpmp->soc->channels.cpu_tx.offset);
+	if (err < 0)
+		return err;
+
+	err = tegra186_bpmp_channel_init(bpmp->rx_channel, bpmp,
+	bpmp->soc->channels.cpu_rx.offset);
+	if (err < 0) {
+		tegra186_bpmp_channel_cleanup(bpmp->tx_channel);
+		return err;
+	}
+
+	for (i = 0; i < bpmp->threaded.count; i++) {
+		unsigned int index = bpmp->soc->channels.thread.offset + i;
+
+		err = tegra186_bpmp_channel_init(&bpmp->threaded_channels[i],
+						 bpmp, index);
+		if (err < 0)
+			break;
+	}
+
+        if (err < 0)
+                tegra186_bpmp_channel_deinit(bpmp);
+
+        return err;
+}
+
+static void tegra186_bpmp_reset_channels(struct tegra_bpmp *bpmp)
 {
-	struct tegra186_bpmp *priv;
 	unsigned int i;
-	int err;
 
-	priv = devm_kzalloc(bpmp->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
+	tegra186_bpmp_channel_reset(bpmp->tx_channel);
+	tegra186_bpmp_channel_reset(bpmp->rx_channel);
 
-	bpmp->priv = priv;
-	priv->parent = bpmp;
+	for (i = 0; i < bpmp->threaded.count; i++)
+		tegra186_bpmp_channel_reset(&bpmp->threaded_channels[i]);
+}
+
+static int tegra186_bpmp_sram_init(struct tegra_bpmp *bpmp)
+{
+	int err;
+	struct tegra186_bpmp *priv = bpmp->priv;
 
-	priv->tx.pool = of_gen_pool_get(bpmp->dev->of_node, "shmem", 0);
-	if (!priv->tx.pool) {
+	priv->sram.tx = of_gen_pool_get(bpmp->dev->of_node, "shmem", 0);
+	if (!priv->sram.tx) {
 		dev_err(bpmp->dev, "TX shmem pool not found\n");
 		return -ENOMEM;
 	}
 
-	priv->tx.virt = gen_pool_dma_alloc(priv->tx.pool, 4096, &priv->tx.phys);
+	priv->tx.virt = gen_pool_dma_alloc(priv->sram.tx, 4096, &priv->tx.phys);
 	if (!priv->tx.virt) {
 		dev_err(bpmp->dev, "failed to allocate from TX pool\n");
 		return -ENOMEM;
 	}
 
-	priv->rx.pool = of_gen_pool_get(bpmp->dev->of_node, "shmem", 1);
-	if (!priv->rx.pool) {
+	priv->sram.rx = of_gen_pool_get(bpmp->dev->of_node, "shmem", 1);
+	if (!priv->sram.rx) {
 		dev_err(bpmp->dev, "RX shmem pool not found\n");
 		err = -ENOMEM;
 		goto free_tx;
 	}
 
-	priv->rx.virt = gen_pool_dma_alloc(priv->rx.pool, 4096, &priv->rx.phys);
+	priv->rx.virt = gen_pool_dma_alloc(priv->sram.rx, 4096, &priv->rx.phys);
 	if (!priv->rx.virt) {
 		dev_err(bpmp->dev, "failed to allocate from RX pool\n");
 		err = -ENOMEM;
 		goto free_tx;
 	}
 
-	err = tegra186_bpmp_channel_init(bpmp->tx_channel, bpmp,
-					 bpmp->soc->channels.cpu_tx.offset);
-	if (err < 0)
-		goto free_rx;
+	priv->type = TEGRA_SRAM;
 
-	err = tegra186_bpmp_channel_init(bpmp->rx_channel, bpmp,
-					 bpmp->soc->channels.cpu_rx.offset);
-	if (err < 0)
-		goto cleanup_tx_channel;
+	return 0;
 
-	for (i = 0; i < bpmp->threaded.count; i++) {
-		unsigned int index = bpmp->soc->channels.thread.offset + i;
+free_tx:
+	gen_pool_free(priv->sram.tx, (unsigned long)priv->tx.virt, 4096);
 
-		err = tegra186_bpmp_channel_init(&bpmp->threaded_channels[i],
-						 bpmp, index);
-		if (err < 0)
-			goto cleanup_channels;
-	}
+	return err;
+}
+
+static int tegra186_bpmp_init(struct tegra_bpmp *bpmp)
+{
+	struct tegra186_bpmp *priv;
+	int err;
+
+	priv = devm_kzalloc(bpmp->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	bpmp->priv = priv;
+	priv->parent = bpmp;
+
+	err = tegra186_bpmp_sram_init(bpmp);
+	if (err < 0)
+		return err;
+
+	err = tegra186_bpmp_channel_setup(bpmp);
+	if (err < 0)
+		return err;
 
 	/* mbox registration */
 	priv->mbox.client.dev = bpmp->dev;
@@ -228,51 +306,22 @@ static int tegra186_bpmp_init(struct tegra_bpmp *bpmp)
 	if (IS_ERR(priv->mbox.channel)) {
 		err = PTR_ERR(priv->mbox.channel);
 		dev_err(bpmp->dev, "failed to get HSP mailbox: %d\n", err);
-		goto cleanup_channels;
+		tegra186_bpmp_channel_deinit(bpmp);
+		return err;
 	}
 
-	tegra186_bpmp_channel_reset(bpmp->tx_channel);
-	tegra186_bpmp_channel_reset(bpmp->rx_channel);
-
-	for (i = 0; i < bpmp->threaded.count; i++)
-		tegra186_bpmp_channel_reset(&bpmp->threaded_channels[i]);
+	tegra186_bpmp_reset_channels(bpmp);
 
 	return 0;
-
-cleanup_channels:
-	for (i = 0; i < bpmp->threaded.count; i++) {
-		if (!bpmp->threaded_channels[i].bpmp)
-			continue;
-
-		tegra186_bpmp_channel_cleanup(&bpmp->threaded_channels[i]);
-	}
-
-	tegra186_bpmp_channel_cleanup(bpmp->rx_channel);
-cleanup_tx_channel:
-	tegra186_bpmp_channel_cleanup(bpmp->tx_channel);
-free_rx:
-	gen_pool_free(priv->rx.pool, (unsigned long)priv->rx.virt, 4096);
-free_tx:
-	gen_pool_free(priv->tx.pool, (unsigned long)priv->tx.virt, 4096);
-
-	return err;
 }
 
 static void tegra186_bpmp_deinit(struct tegra_bpmp *bpmp)
 {
 	struct tegra186_bpmp *priv = bpmp->priv;
-	unsigned int i;
 
 	mbox_free_channel(priv->mbox.channel);
 
-	for (i = 0; i < bpmp->threaded.count; i++)
-		tegra186_bpmp_channel_cleanup(&bpmp->threaded_channels[i]);
-
-	tegra186_bpmp_channel_cleanup(bpmp->rx_channel);
-	tegra186_bpmp_channel_cleanup(bpmp->tx_channel);
-
-	gen_pool_free(priv->rx.pool, (unsigned long)priv->rx.virt, 4096);
-	gen_pool_free(priv->tx.pool, (unsigned long)priv->tx.virt, 4096);
+	tegra186_bpmp_channel_deinit(bpmp);
 }
 
 static int tegra186_bpmp_resume(struct tegra_bpmp *bpmp)
-- 
2.17.1

