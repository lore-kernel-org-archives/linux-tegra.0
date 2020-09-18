Return-Path: <SRS0=kXk7=C3=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43C95C43468
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Sep 2020 02:27:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 024F4235F7
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Sep 2020 02:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600396049;
	bh=rj7yRVaJIwSD5WJDYwBMe73pX5P8cizRUn1JdT5yIl8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=M2tN6KGUGfyn5//RwfK3KV9gI/34C6+HdF9Ke7i915CjxYCufi3NBD8OMNsnb6WE5
	 ZizrvhjFDYyoqBtEl3XyT6ccHTIq2Ob/cm/BjS2urlvk4VWKA7kgJEBCqz4ZOLZtLa
	 nbPqwbQb0x0PENIFJX+rHGgWoekBHYIRVlMltQl0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728996AbgIRC1K (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Sep 2020 22:27:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:45040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729291AbgIRCPu (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 22:15:50 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 41BBE239D0;
        Fri, 18 Sep 2020 02:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600395348;
        bh=rj7yRVaJIwSD5WJDYwBMe73pX5P8cizRUn1JdT5yIl8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=xCVEuYSVhcuzAWW9z0Ihpc9hkN3u6Bdo/HGYf6CtNnXSiNKeQVAbZy/Z40WKE7JqQ
         K2xQkB6atriPv7mQPWKJ4qCDJFuQeKbSdst4Rc2ZY3jM4gaZc9Mvor1tyvczXLtbfi
         57dg99SjQRH9r7rXzLhoxIQB4shgh6ME16bQzcto=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Vinod Koul <vkoul@kernel.org>, Sasha Levin <sashal@kernel.org>,
        dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 43/90] dmaengine: tegra-apb: Prevent race conditions on channel's freeing
Date:   Thu, 17 Sep 2020 22:14:08 -0400
Message-Id: <20200918021455.2067301-43-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918021455.2067301-1-sashal@kernel.org>
References: <20200918021455.2067301-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Dmitry Osipenko <digetx@gmail.com>

[ Upstream commit 8e84172e372bdca20c305d92d51d33640d2da431 ]

It's incorrect to check the channel's "busy" state without taking a lock.
That shouldn't cause any real troubles, nevertheless it's always better
not to have any race conditions in the code.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
Link: https://lore.kernel.org/r/20200209163356.6439-5-digetx@gmail.com
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/dma/tegra20-apb-dma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 4eaf92b2b8868..909739426f78c 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -1208,8 +1208,7 @@ static void tegra_dma_free_chan_resources(struct dma_chan *dc)
 
 	dev_dbg(tdc2dev(tdc), "Freeing channel %d\n", tdc->id);
 
-	if (tdc->busy)
-		tegra_dma_terminate_all(dc);
+	tegra_dma_terminate_all(dc);
 
 	spin_lock_irqsave(&tdc->lock, flags);
 	list_splice_init(&tdc->pending_sg_req, &sg_req_list);
-- 
2.25.1

