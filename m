Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF512C2BA2B
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B65464E66
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442185AbhCCDbr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Mar 2021 22:31:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351120AbhCBNbV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Mar 2021 08:31:21 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10AF5C06121D;
        Tue,  2 Mar 2021 04:25:14 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id 18so22394477lff.6;
        Tue, 02 Mar 2021 04:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+9jSWTZzAfW2e69fnTTJ2x2udl3lL7BijHyOX96SUFA=;
        b=mO8YuzBgYCibrR2zRlOCFKCYz6sWPENmSOAd5yqT645guqBs7KDYsFR4paZLm/ppXs
         jhZr9r4S0+uoiBjRme7UdXwL7riarQutzNdkBFYPWd5BTkw+mIBdAS8feJF3I7tP02gj
         AijzruT/mnKZUs+TfuYneCXr2y91Fy8n8lZ508k4kua2PptF41feMioULalYV3USzN2R
         k2YBCSkL6nWuEqOp2Njvnml2g4jcENdwj+zW0vCtNnb0ESA1gav1jNwNklboKirfrNK4
         l+xpGsDyRtFSL5vuuoVRuPbdIO5vK3ojXD6T+D3eZCjXHUoxjDNtbdYtceCa8Y+bCSYF
         4MKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+9jSWTZzAfW2e69fnTTJ2x2udl3lL7BijHyOX96SUFA=;
        b=Ve3pZikFN9czqRPDgZUFO39Wocsbf5XnvOamegt+RmKWLyJwlO4UecKFaNKOgcKbJz
         sOyJ8vpOfjh4+4+xEuOR8h7BFzTSkEStpJXb1UlrBIHjdSH3hSkU2T5B2CIHwgHMGOvN
         fRplWd/To/N0efG1JY5dwN+va4qgz3LkD0cSpp//kvYOx/ef93U1Q507cZXTW8M78T8H
         lNCy1oV4ceo4UBe7yfwiT340RcSMCvivUqP4TXcYw3WkDPeImkdXyyq5v1f+5cRTHjTK
         UnPx0RHiYuJVVn+x2i/YOLSwSxQWS4ivpuyQ+KvegLrSukDiTnCifjdTtr4t1epUaXTg
         bqMg==
X-Gm-Message-State: AOAM531/XrM1OuepU/gICUMfJxpmmTejud47pqTS3A+i70sDbXaEMA86
        6vc2ugZ/YBudsnGoBLPK19U=
X-Google-Smtp-Source: ABdhPJwfsBIIeJoP4SvdGboxPY9QuKHip9nOU4d5QeTF8wtPM7NVtwzvk8W1LH0KoUoln17SKv5Ajw==
X-Received: by 2002:a19:74c:: with SMTP id 73mr12181020lfh.316.1614687912606;
        Tue, 02 Mar 2021 04:25:12 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id u4sm2602126lfs.61.2021.03.02.04.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 04:25:12 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/5] soc/tegra: pmc: Fix imbalanced clock disabling in error code path
Date:   Tue,  2 Mar 2021 15:24:58 +0300
Message-Id: <20210302122502.20874-2-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210302122502.20874-1-digetx@gmail.com>
References: <20210302122502.20874-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The tegra_powergate_power_up() has a typo in the error code path where it
will try to disable clocks twice, fix it. In practice that error never
happens, so this is a minor correction.

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/pmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index df9a5ca8c99c..fd2ba3c59178 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -638,7 +638,7 @@ static int tegra_powergate_power_up(struct tegra_powergate *pg,
 
 	err = tegra_powergate_enable_clocks(pg);
 	if (err)
-		goto disable_clks;
+		goto powergate_off;
 
 	usleep_range(10, 20);
 
-- 
2.29.2

