Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB01C43460
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Apr 2021 16:52:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34E0E60FE5
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Apr 2021 16:52:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233286AbhDTQwo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 20 Apr 2021 12:52:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233281AbhDTQwn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 20 Apr 2021 12:52:43 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDD60C06174A
        for <linux-tegra@vger.kernel.org>; Tue, 20 Apr 2021 09:52:10 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id n2so59282111ejy.7
        for <linux-tegra@vger.kernel.org>; Tue, 20 Apr 2021 09:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UpVkBhnZ97epqNvGm3ag5v8x3tJ05LT3v9zIsMH5e+M=;
        b=phr5qNKE4wY4DsArJBEGVsogAyV2lc5yDRAUr+Wc5bw2phRO+6q1Hq/n6OwbS5aYLL
         02839TKoIE/n7edEkKFDfV7a+hw/Mw65S6A+EQL3AkwMwu9KYAqe/IvWYxO4FsHK85Hq
         qYfamS4jSSw6NV7CdcNXQBZJhYy1qM3SSUTnRGpuUis7MpfaENeorwuKj2fzhmsevZzi
         gKY2gBNdbP3tQ9MZMfDUBSK2VqwFxsIIMj5q/PNszK8rwgVLtMPRcpO0+vrth6bkeH0R
         TjfGA6hi8DhMrIRcwdHWO6ydNECShAZw9VR67L0FOu4SuE0qwxSp+r3+0NPE75IOESM7
         Vhbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UpVkBhnZ97epqNvGm3ag5v8x3tJ05LT3v9zIsMH5e+M=;
        b=l3SjYmEn7E9kHfjjbQ7IgK/IyKhTvkXptVeC14ImL6Acy7vs92au8mYkqM65tsFQYO
         rXQza/AOCDoz54oXchWHaG8/xPAwNdvqyYEPH7Z0SsvEmmtIk6mdgzKN9nKAV91q0xlB
         sae/6JH2NdkSpyMcXKjmgNxLWZg11+u48dW5hyMyV4W6UZdysPsVQtWkYcb4RCbv+aMB
         nB0FUUnXcriM9Lb62B/YUtDgxy8YNfC/sbShCl01m5nqcj3MXFaKXJI6Ez1/GURtt+z2
         f12n1tBynl+BkC37a947MQA7Yv2FstjZhjVWOdugZjxmbHTMOlHnFi97vtYJht2krhXO
         1jog==
X-Gm-Message-State: AOAM5312DGwtXGtfJ9hJcTdqvmUo6x2AmzBcY5yiybCqxtKdyeaaXuVf
        uLH54+yWOCeLiyRIi9sKGIM=
X-Google-Smtp-Source: ABdhPJwFGNVRQU5dmmDJWLjar8c4VZ6nsTPuaMnEL7CgA/1ur8vfaaUhyZjRUXsy/L8URTEikAuYXw==
X-Received: by 2002:a17:906:fad8:: with SMTP id lu24mr27578413ejb.159.1618937529562;
        Tue, 20 Apr 2021 09:52:09 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id c13sm10545871edw.88.2021.04.20.09.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 09:52:08 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 07/10] memory: tegra: Only initialize reset controller if available
Date:   Tue, 20 Apr 2021 18:52:35 +0200
Message-Id: <20210420165237.3523732-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210420165237.3523732-1-thierry.reding@gmail.com>
References: <20210420165237.3523732-1-thierry.reding@gmail.com>
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
index 515ffd948a37..23b7728623cb 100644
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
2.30.2

