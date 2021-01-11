Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 073B7C433E0
	for <linux-tegra@archiver.kernel.org>; Mon, 11 Jan 2021 16:10:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B66BC22A83
	for <linux-tegra@archiver.kernel.org>; Mon, 11 Jan 2021 16:10:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388942AbhAKQJX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 11 Jan 2021 11:09:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730554AbhAKQJW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 11 Jan 2021 11:09:22 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B48FC061794;
        Mon, 11 Jan 2021 08:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
        :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=mBrxEkbUIvCU64g8yLzd4fzQlEvtB3Lv42lSlfsc8rI=; b=u3fAoA6ZOBhFbdIhIm47DZPUXP
        5U0BaI8pWeNHbfyBZ35bXAw8ApyZOvA5IF1b/PrIO7g8nce9J49Kl/azhi04l4hRjDIewHWnuFJjM
        MGT5xAdMGhG9unjyXE8u9JDk0owmbHk8DifmpkgeVMa4q7hxzN5wgvJ+WKn8kaNPDKfVvMLBbyn2q
        0Clw6xue5Pd7VgQ3xN9q3UJinbsU8jgwmFMzkvjMDY0YrM76I7EhlWclaCvaxWAWlVCrxd/QibIxm
        NhthxsLqkWJ2GVvIINCSyyex4PnqqZW2HuxsvS1LqPFwEja0UqPgL/ylFGuY9huyyfjuO0Pr+oRP9
        moT4ZIJg==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1kyzkC-000879-FQ; Mon, 11 Jan 2021 18:08:36 +0200
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     ldewangan@nvidia.com, digetx@gmail.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, wsa@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>, stable@vger.kernel.org
Subject: [PATCH v2] i2c: tegra: Wait for config load atomically while in ISR
Date:   Mon, 11 Jan 2021 18:08:32 +0200
Message-Id: <20210111160832.3669873-1-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Upon a communication error, the interrupt handler can call
tegra_i2c_disable_packet_mode. This causes a sleeping poll to happen
unless the current transaction was marked atomic. Fix this by
making the poll happen atomically if we are in an IRQ.

This matches the behavior prior to the patch mentioned
in the Fixes tag.

Fixes: ede2299f7101 ("i2c: tegra: Support atomic transfers")
Cc: stable@vger.kernel.org
Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v2:
* Use in_irq() instead of passing a flag from the ISR.
  Thanks to Dmitry for the suggestion.
* Update commit message.
---
 drivers/i2c/busses/i2c-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 6f08c0c3238d..0727383f4940 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -533,7 +533,7 @@ static int tegra_i2c_poll_register(struct tegra_i2c_dev *i2c_dev,
 	void __iomem *addr = i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg);
 	u32 val;
 
-	if (!i2c_dev->atomic_mode)
+	if (!i2c_dev->atomic_mode && !in_irq())
 		return readl_relaxed_poll_timeout(addr, val, !(val & mask),
 						  delay_us, timeout_us);
 
-- 
2.30.0

