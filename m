Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99F66C4320E
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Aug 2021 22:13:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79B1061038
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Aug 2021 22:13:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232130AbhHBWOB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 2 Aug 2021 18:14:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232006AbhHBWOA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 2 Aug 2021 18:14:00 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 234CDC06175F;
        Mon,  2 Aug 2021 15:13:50 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id b6so13606026lff.10;
        Mon, 02 Aug 2021 15:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zTbtTeGMZ/VuLuFz8YHm5zAulKED+PIDxcJPdSaYy1A=;
        b=T38CTxzx9veawl0upAiLeh4Htr/ULbKZCBqlNQgBB52VfQ4ldDYUV4J+SXIOV3FBhg
         liAYCpjAx0ncSKiE6tw4XSua86FlSwJW2S+3txfT4OnPG6NdAw8WHtYp9aCB5enwyhE0
         uN3yZqe7ZYW6ObY6baJbDwHCfNvFHK4r93EmO6f2Y8Dr9Fl1Et63OonxFkaqZh6GKF7m
         ZZqsPLROcj0BV9rtOcnj41goYqMsmCuHhauvjqPa96PitoJ4bSM2/TddGvbNq79V0TFq
         AfuPKLpttNZVlay6gwj5dkKLe4Hau49gP+TLxunEctl9JpputYNNSbQ7oeo2eK/EPE8w
         UYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zTbtTeGMZ/VuLuFz8YHm5zAulKED+PIDxcJPdSaYy1A=;
        b=pGjg+UPGwCu61dR2ZgsqjuKztBsFHKLEx80hn+wnRyUY43PDL/35V0jmSCy3LtYYXc
         F2w4aKLFH0PJTVNYN1FyT97UBQ5y8IXdUC299ZPlwiaVHElgfuJYfMXSwMJGaVPmJNj6
         ZcKHYuWcwFapEdhVv9e0iTsXoEh5pvvzYsBvc7LrLdLfDjt/WEkT6PXSguj8lhRznw0N
         5l+g6gc8/KFQFK2wz+3YKkRKcfyi6+sk7Oko388c32x04qMUOhVhh2w0ONUMk5xruMu3
         meBe6KRBoBPyo7mD21aFgUZWj1abnJpcz/k/d1j2+jMtu3YXPKtBrWDvC9KQlKgf4hA/
         Rj3g==
X-Gm-Message-State: AOAM5326vzmpoUw4CFHJS3CIDyjf3bDHgjoK9J6hzsDrYPYa05+3B5tR
        F6Cc//8r93SQ1axeb7ko04I=
X-Google-Smtp-Source: ABdhPJygK7r9LhuLEHcQv8Tc0kY5ttYHMPHffHqrds86rWD05ZFT76UekV/n02g2LBijJhXgvdSaFg==
X-Received: by 2002:ac2:5471:: with SMTP id e17mr8706132lfn.216.1627942428564;
        Mon, 02 Aug 2021 15:13:48 -0700 (PDT)
Received: from localhost.localdomain (94-29-22-96.dynamic.spd-mgts.ru. [94.29.22.96])
        by smtp.gmail.com with ESMTPSA id c10sm960167ljn.11.2021.08.02.15.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 15:13:48 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/4] soc/tegra: fuse: Clear fuse->clk on driver probe failure
Date:   Tue,  3 Aug 2021 01:13:33 +0300
Message-Id: <20210802221336.32016-2-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210802221336.32016-1-digetx@gmail.com>
References: <20210802221336.32016-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The fuse->clk must be cleared if FUSE driver fails to probe, otherwise
tegra_fuse_readl() will crash. It's unlikely to happen in practice,
nevertheless let's correct it for completeness.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/fuse/fuse-tegra.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index 3d9da3d359da..2434c570b53c 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -246,6 +246,7 @@ static int tegra_fuse_probe(struct platform_device *pdev)
 	return 0;
 
 restore:
+	fuse->clk = NULL;
 	fuse->base = base;
 	return err;
 }
-- 
2.32.0

