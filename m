Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44FBAC433DB
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 02:05:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F2C072250E
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 02:05:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727370AbhATCFL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 21:05:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728813AbhATBeT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 20:34:19 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A3ADC061794;
        Tue, 19 Jan 2021 17:33:29 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id o17so31927528lfg.4;
        Tue, 19 Jan 2021 17:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eRiO6OJEGZqCMVq40OCFKrrg3hQEkm9OZ3dY720clQI=;
        b=XFv2sL3Cd7ZjgrWLY6Icqy11sEsjY4JxWXaVFg44gg0ZuuhPRtlSX4zwfnjc7RDA2I
         mvhZxzfBxJea7/RZ9oLHyo+hiexaeGFE8m2Fiu36K++uMq3knxwSssgjseUxNBrSzbiI
         vPhZ4yFRkwWwoMPjzuKvT5QBH0fGxJo3Drxfh5lXZ5AWAUAJOJb7adUCWjs+oDHba9GY
         3LJqEswNk8bNKD+HYjVfju30cqNttGbYzl5j737wydU5o+gAQvik0+TfEw8U62DKx53+
         XmJOsDgtvyU7yRMEW5s1ZSBdukzRtjTLQZ10QGhz/D5zLr1RYZgBn+deCOrJ0Sn2MINl
         BMhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eRiO6OJEGZqCMVq40OCFKrrg3hQEkm9OZ3dY720clQI=;
        b=KXNauXWGuS7D5IalgYC95i2EmhazMyMvy6iP0S3tl7/h+0F8eyCPxlT/bwRV6R9Xm1
         fxoQ4z7z5EC1cYSrR+YYOfH87KQFF5BLZv/wnV3V04OP/rbrXgncRbfTsa5qwbQ2bzm4
         +jCIg9Ov2fdf0uGyuHnjzjKC098gSlsPrbYl+ct7B4r0vK3+8Py1vKLBDpq51XiXDTUr
         3dUiuCjT5cTOL08ef+Q4JUxrCWaZahr+LW1omh1ofe8f9WuqIOQSRYqtFX0ZQC41Qqvi
         4QaU6O16/UUVAS0YEg88K0pDNWJbqylXrFq84UUxW5rvAFUQnZONEimbYBUWP8w0FnIK
         eVaw==
X-Gm-Message-State: AOAM531RtGkZvpAoitJiG4Ht9NkhMNNh6t2bgHYhxMk5QolSBuQai1el
        XddpQHEvn9+l0aaAIVgrGC8=
X-Google-Smtp-Source: ABdhPJwhn1Zn2JkzXzHr5SWz0Xmm8cjSltDpUdIdzl+Ju1XsRVU6z07Y2765vyzulJujzuEHEtYblQ==
X-Received: by 2002:a19:6b19:: with SMTP id d25mr3150751lfa.282.1611106407878;
        Tue, 19 Jan 2021 17:33:27 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id q24sm53339lfa.38.2021.01.19.17.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 17:33:27 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] soc/tegra: regulators: Fix locking up when voltage-spread is out of range
Date:   Wed, 20 Jan 2021 04:33:04 +0300
Message-Id: <20210120013304.12257-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Fix voltage coupler lockup which happens when voltage-spread is out
of range due to a bug in the code. The max-spread requirement shall be
accounted when CPU regulator doesn't have consumers. This problem is
observed on Tegra30 Ouya game console once system-wide DVFS is enabled
in a device-tree.

Fixes: 783807436f36 ("soc/tegra: regulators: Add regulators coupler for Tegra30")
Cc: stable@vger.kernel.org
Reported-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---

Changelog:

v3: - No code changes. This patch is factored out from [1] to ease the
      applying, since it doesn't have any dependencies on other patches
      and fixes a standalone problem.

      [1] https://patchwork.ozlabs.org/project/linux-tegra/list/?series=221130

 drivers/soc/tegra/regulators-tegra30.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/regulators-tegra30.c b/drivers/soc/tegra/regulators-tegra30.c
index 7f21f31de09d..0e776b20f625 100644
--- a/drivers/soc/tegra/regulators-tegra30.c
+++ b/drivers/soc/tegra/regulators-tegra30.c
@@ -178,7 +178,7 @@ static int tegra30_voltage_update(struct tegra_regulator_coupler *tegra,
 	 * survive the voltage drop if it's running on a higher frequency.
 	 */
 	if (!cpu_min_uV_consumers)
-		cpu_min_uV = cpu_uV;
+		cpu_min_uV = max(cpu_uV, cpu_min_uV);
 
 	/*
 	 * Bootloader shall set up voltages correctly, but if it
-- 
2.29.2

