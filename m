Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF25FC47080
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Jun 2021 17:58:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4E7B61375
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Jun 2021 17:58:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233971AbhFASAS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 1 Jun 2021 14:00:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231331AbhFASAR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Jun 2021 14:00:17 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7148C061574
        for <linux-tegra@vger.kernel.org>; Tue,  1 Jun 2021 10:58:34 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id t15so10086588eju.3
        for <linux-tegra@vger.kernel.org>; Tue, 01 Jun 2021 10:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2vJqvxNqfgwoYnr991h3sO6nHNRO5tiOGW2w8cQdRZ4=;
        b=e+fgxYDbKJnz6mpo0JemtYL1boVhytjuKFwuWT97tkRSgfLof3SQEiDhr5kpv6E1f3
         e+lQ4EXXw9jNco1D5wJcJOZvL0PLX8zRR+lhJAueuEpnk1aAlv0iM8T4y7zeRUHeiBnl
         OkRONo7NrxYYY52VnHn0QqPKJZQlvXq4i1PbGbv/KJQ+5NheWr4FYsKM++DGqd9vBcWy
         WGkhwmHiV5mhgMOaD8A+SVveLe+s+sKJuDGdJjgDef3DyEVTNrltMhsZ6H8Wa+UITKsj
         GNJ2zXe4DxvaZgPBxPdUjm9LPJksFjro4JZTtpFiTLi02fnR5NcekMGJj+9m8KKUhzTw
         JFxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2vJqvxNqfgwoYnr991h3sO6nHNRO5tiOGW2w8cQdRZ4=;
        b=nK8eqk3/Q2Y7hs8CKpug1ufh4Eqwse7m1DQEbD2gbTatDXPXDmhULUkMWofE4j76Iq
         MjHEMJiY0EefEmD2PBGAL3VGQFCoaW6+tyNUyMnQkG6iOUqvMu8X+CYEExKbizjQkUzc
         RyKo2Plyxh5pLu17FFGT/ABqHAkjeosdb3WNJJl5L+adyyBfriPocONrGezazNaQRfJV
         1iHyPjvww9M+TO8Qik6GpUUAqM/n5gRQNURGZz1bum8Ap7+8YIcWXCn/KVB6gzPbI2Qo
         EpEVGFnXVQaksWNg0+k9bpWCfO6dtPD1Vpl/RG0TvIjEtpUvn0kvatXKJUvlp+cQ2++a
         NAXA==
X-Gm-Message-State: AOAM530JiqG2jexg45StrT6K9PYOATLvFAe5J8iO00CcsPvrZG4TWJPN
        lFgBlTDb9dLHG9Q0iAgbMaw=
X-Google-Smtp-Source: ABdhPJxBa9bQafvoFP8QrbwrbtbRaZ/zF4sdkYDHC80cxdD2ans9iEVAH+J7sbb8e3nC+U+C+g9UyA==
X-Received: by 2002:a17:906:4341:: with SMTP id z1mr30546787ejm.422.1622570313595;
        Tue, 01 Jun 2021 10:58:33 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id e12sm7487308ejk.99.2021.06.01.10.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 10:58:32 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 09/12] memory: tegra: Only initialize reset controller if available
Date:   Tue,  1 Jun 2021 19:59:39 +0200
Message-Id: <20210601175942.1920588-10-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210601175942.1920588-1-thierry.reding@gmail.com>
References: <20210601175942.1920588-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The memory controller hot resets are implemented in the BPMP on Tegra186
and later, so there's no need to provide an implementation via the
memory controller driver. Conditionally register the reset controller
only if needed.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/memory/tegra/mc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index b14b0333b623..7ae3d8faae38 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -768,10 +768,11 @@ static int tegra_mc_probe(struct platform_device *pdev)
 		}
 	}
 
-	err = tegra_mc_reset_setup(mc);
-	if (err < 0)
-		dev_err(&pdev->dev, "failed to register reset controller: %d\n",
-			err);
+	if (mc->soc->reset_ops) {
+		err = tegra_mc_reset_setup(mc);
+		if (err < 0)
+			dev_err(&pdev->dev, "failed to register reset controller: %d\n", err);
+	}
 
 	err = tegra_mc_interconnect_setup(mc);
 	if (err < 0)
-- 
2.31.1

