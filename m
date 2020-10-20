Return-Path: <SRS0=rHad=D3=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3267DC43457
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Oct 2020 04:03:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B23E1222D5
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Oct 2020 04:03:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="msQieKyH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725379AbgJTEDR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 20 Oct 2020 00:03:17 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:17794 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbgJTEDR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 20 Oct 2020 00:03:17 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f8e61280000>; Mon, 19 Oct 2020 21:01:44 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 20 Oct
 2020 04:03:16 +0000
Received: from skomatineni-linux.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Tue, 20 Oct 2020 04:03:16 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <digetx@gmail.com>, <skomatineni@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
Subject: [PATCH v1] i2c: tegra: Fix i2c_writesl() to use writel() instead of writesl()
Date:   Mon, 19 Oct 2020 21:03:54 -0700
Message-ID: <1603166634-13639-1-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1603166504; bh=k0OpCwKOIS1mzOf9rDffepCbD0hVHg+ZBxopLq0hOT0=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:X-NVConfidentiality:
         MIME-Version:Content-Type;
        b=msQieKyHswBsMpmzAhUyhwrV5hazjv2iGfCMdcVaXmfLWmKaAFqarqmmRaHim6pWs
         9X94Mx2vHymB0IfZcIvOAoIAp76+PFnbktb0uOcUEwCSSELvoZj2u6FgHxxAsLGENl
         dXQhXIKj6oLi3VDiwqWbku/9nms2fcrr6WSaNla8EuAHTF/EClR+hfeEOeuXsyxrbY
         u/mdUaEMed9caeh59PuuTrbiK5AjIp/0hZs/7bXw+D0ILTTtvB1DEijE+4tjJ2i8Si
         RrKLbzi5FDhy07SNMzFqjY9xGNkBOrVaXTwClJVp2hi/7jjq9XV/PFaTPbdDVMavJY
         sOO46WV/ufKOg==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

VI I2C don't have DMA support and uses PIO mode all the time.

Current driver uses writesl() to fill TX FIFO based on available
empty slots and with this seeing strange silent hang during any I2C
register access after filling TX FIFO with 8 words.

Using writel() followed by i2c_readl() in a loop to write all words
to TX FIFO instead of using writesl() helps for large transfers in
PIO mode.

So, this patch updates i2c_writesl() API to use writel() in a loop
instead of writesl().

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 6f08c0c..274bf3a 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -333,10 +333,13 @@ static u32 i2c_readl(struct tegra_i2c_dev *i2c_dev, unsigned int reg)
 	return readl_relaxed(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
 }
 
-static void i2c_writesl(struct tegra_i2c_dev *i2c_dev, void *data,
+static void i2c_writesl(struct tegra_i2c_dev *i2c_dev, u32 *data,
 			unsigned int reg, unsigned int len)
 {
-	writesl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data, len);
+	while (len--) {
+		writel(*data++, i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
+		i2c_readl(i2c_dev, I2C_INT_STATUS);
+	}
 }
 
 static void i2c_readsl(struct tegra_i2c_dev *i2c_dev, void *data,
@@ -811,7 +814,7 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 		i2c_dev->msg_buf_remaining = buf_remaining;
 		i2c_dev->msg_buf = buf + words_to_transfer * BYTES_PER_FIFO_WORD;
 
-		i2c_writesl(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
+		i2c_writesl(i2c_dev, (u32 *)buf, I2C_TX_FIFO, words_to_transfer);
 
 		buf += words_to_transfer * BYTES_PER_FIFO_WORD;
 	}
-- 
2.7.4

