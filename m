Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E33C2BA2B
	for <linux-tegra@archiver.kernel.org>; Wed, 17 Mar 2021 19:32:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E17E364F55
	for <linux-tegra@archiver.kernel.org>; Wed, 17 Mar 2021 19:32:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233348AbhCQTbp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 17 Mar 2021 15:31:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233286AbhCQTb3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 17 Mar 2021 15:31:29 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D661C06174A;
        Wed, 17 Mar 2021 12:31:29 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id q29so676391lfb.4;
        Wed, 17 Mar 2021 12:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YVatthKifS/0drZo94nSguqAF/BwAr5rR9av6MBvQSU=;
        b=Rjchj7GVMMSagk8sI1MJ4u2Ij0YECxZ1g3pcfjNfzMb17nxeSxXXCJrO4C4Y6Cis2D
         467MLRU/9Jlvag8JpMG8QsV7zDqAJh9yBmpW5pR6iV+vUi9iiusS5ye5f0bifI7DMX9Z
         K4dxZf10QJtEGEi060Ug8y4DBX5EZttOp0sRGOGbtYWPzgWF4qnU3CEfpBgne1gRctut
         sdASwY+jNPPUjWrm+l1jSc+HpjkdNxTxbOIM5QMXnw6Txzeu3+95u+yZohq7tIsDiB+W
         wWtVWl+MWCrH7JJ8f7Iw7OmZOtAd7RhzpS27MIoxYqCe33EjTUxVL+CfZ52c5CuGNfW7
         1mJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YVatthKifS/0drZo94nSguqAF/BwAr5rR9av6MBvQSU=;
        b=BfF4fhIojbZJIRd2WfY9287tscSEVHsOcwgDAy9Y1F92C02D3bkjMb6lvKjLgXeUQG
         ROuaJyy0PMSPtgt3CPrbgYo7kmOQlMbXjq6AxZO4jRs3M6IORIwY2eROveBCT5hqix7u
         ZWtaDaJchPZ4V9CIMg1wdkbaypwO/J7MFBc837jJR8aQWkD8G2hZ22GxdraAxkDT/CPq
         curlBqLbEayCx7ttsymup6vX2bQ5pmcjceUQXx7UgkZuVu3jWfostOSxp5pdKGMt5h8k
         4wrRBaFAPmXWf4QL+Rgi/sCZdFBfoAvY783GxQHbKNfvUbm8F9nhyjOIrcEy3Ri/g87W
         uL0Q==
X-Gm-Message-State: AOAM5300mJt2ftT9GlTkTnv68SiTzvHCiEWofIsusT2F0X5AqR7zCOcw
        CD4U4Xd4F3t258+4vRsGd5MCrMR8i1E=
X-Google-Smtp-Source: ABdhPJx+C05SM67TYpVY4e0UqGt/lLIQ1Z5cKGl9XprQi66ba8huZcoEExGiAb2aac97+FMOwuBsWA==
X-Received: by 2002:a19:7002:: with SMTP id h2mr3212278lfc.427.1616009487744;
        Wed, 17 Mar 2021 12:31:27 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id q24sm3623098lji.40.2021.03.17.12.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 12:31:27 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v5 6/7] clk: tegra: Don't allow zero clock rate for PLLs
Date:   Wed, 17 Mar 2021 22:30:05 +0300
Message-Id: <20210317193006.29633-7-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317193006.29633-1-digetx@gmail.com>
References: <20210317193006.29633-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Zero clock rate doesn't make sense for PLLs and tegra-clk driver enters
into infinite loop on trying to calculate PLL parameters for zero rate.
Make code to error out if requested rate is zero.

Originally this trouble was found by Robert Yang while he was trying to
bring up upstream kernel on Samsung Galaxy Tab, which happened due to a
bug in Tegra DRM driver that erroneously sets PLL rate to zero. This
issues came over again recently during of kernel bring up on ASUS TF700T.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-pll.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index d709ecb7d8d7..af7d4941042e 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -558,6 +558,9 @@ static int _calc_rate(struct clk_hw *hw, struct tegra_clk_pll_freq_table *cfg,
 	u32 p_div = 0;
 	int ret;
 
+	if (!rate)
+		return -EINVAL;
+
 	switch (parent_rate) {
 	case 12000000:
 	case 26000000:
-- 
2.30.2

