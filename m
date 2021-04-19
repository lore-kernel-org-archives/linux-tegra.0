Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B974C43461
	for <linux-tegra@archiver.kernel.org>; Mon, 19 Apr 2021 20:45:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4875B613E0
	for <linux-tegra@archiver.kernel.org>; Mon, 19 Apr 2021 20:45:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242702AbhDSUqN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 19 Apr 2021 16:46:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:54916 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242675AbhDSUpQ (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 19 Apr 2021 16:45:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 979F9613E4;
        Mon, 19 Apr 2021 20:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618865075;
        bh=sL2wviUKoZfmwofxZJu5uW934bvydhzmqXTAzeULgFQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=d2XghzsSZPf1s3i1W5kVT+yRyo0BjFRMNB++ZBtoMptB4Tf/vNegcTzhh5vGsRFCz
         pCihFf4RLK7RtYcXJIcZVmbtsN17uUBDPdBPV59hvii48a1YaoqxZRrtKJiHt8Mq6y
         nWxbj1cZfiS8c1WggqVkku0knwUKFe6Lh5Xs3ZJrqgc4bV4Ck/JzqpB+7kN3qfyTlg
         9vhpTfySsN0ZGlB0UZfQNfb6mUJTdwzyB8MBEVSb8QmuDkM/YAs9qLwYpwALVAzKQW
         t30iCb65sPTv6k0AUP/GngmBJodffe3m+gNqLu78BE/PM5gQANRjTFS5Q/tV0hKK8K
         KdehBLHp7Wpxw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Thierry Reding <treding@nvidia.com>,
        Vinod Koul <vkoul@kernel.org>, Sasha Levin <sashal@kernel.org>,
        dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 10/21] dmaengine: tegra20: Fix runtime PM imbalance on error
Date:   Mon, 19 Apr 2021 16:44:08 -0400
Message-Id: <20210419204420.6375-10-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210419204420.6375-1-sashal@kernel.org>
References: <20210419204420.6375-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Dinghao Liu <dinghao.liu@zju.edu.cn>

[ Upstream commit 917a3200b9f467a154999c7572af345f2470aaf4 ]

pm_runtime_get_sync() will increase the runtime PM counter
even it returns an error. Thus a pairing decrement is needed
to prevent refcount leak. Fix this by replacing this API with
pm_runtime_resume_and_get(), which will not change the runtime
PM counter on error.

Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
Acked-by: Thierry Reding <treding@nvidia.com>
Link: https://lore.kernel.org/r/20210409082805.23643-1-dinghao.liu@zju.edu.cn
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/dma/tegra20-apb-dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 71827d9b0aa1..b7260749e8ee 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -723,7 +723,7 @@ static void tegra_dma_issue_pending(struct dma_chan *dc)
 		goto end;
 	}
 	if (!tdc->busy) {
-		err = pm_runtime_get_sync(tdc->tdma->dev);
+		err = pm_runtime_resume_and_get(tdc->tdma->dev);
 		if (err < 0) {
 			dev_err(tdc2dev(tdc), "Failed to enable DMA\n");
 			goto end;
@@ -818,7 +818,7 @@ static void tegra_dma_synchronize(struct dma_chan *dc)
 	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
 	int err;
 
-	err = pm_runtime_get_sync(tdc->tdma->dev);
+	err = pm_runtime_resume_and_get(tdc->tdma->dev);
 	if (err < 0) {
 		dev_err(tdc2dev(tdc), "Failed to synchronize DMA: %d\n", err);
 		return;
-- 
2.30.2

