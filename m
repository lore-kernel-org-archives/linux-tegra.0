Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29650C433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 17:45:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E85E923A6A
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 17:45:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729584AbhAVRoo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 22 Jan 2021 12:44:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727486AbhAVRoO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 Jan 2021 12:44:14 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E368C06174A;
        Fri, 22 Jan 2021 09:43:32 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id g10so5886904wrx.1;
        Fri, 22 Jan 2021 09:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u8ZUkCJ1JxdMy0LwNAxnwHhQ0MXIil1QP/v4uET+MVU=;
        b=Fa8RCGef019NDY5WlGmdeA2ganP7YvqPXtJfHiYzptfK1EKCxVoAnuPzS0bKMYHmGM
         70pSdF6YIeWJnbpelZPvL4RsERtZ0b0ZOCfSCzZ0oadrKAbpCcjVeMe3sWBbN+kQsuXv
         Kyux8Iwu6Y+5FWge905817u5eqWXF2aYQGAblcaEGFkDoXIY69tqWq7D+LX2yd00/ibI
         Xl3tFf22t4QwNIVKxshOxq9mX9d1UZzw29sVqkUfGf9GRSyf29v9n8iwkXRvuccxcOEM
         5IBzTHbfRKqogFrH6LCNIUJrU2AtHp827yegb3pQ65p37c8K6GREa8LnSZ/pOXbLCErD
         8w0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u8ZUkCJ1JxdMy0LwNAxnwHhQ0MXIil1QP/v4uET+MVU=;
        b=OLOsPyEZnjROuqpXyPy4rMnyivXTMcE1HXB01VctXRZO8ePWyUcY1qPXuVTcEsvGRw
         zXI7JZuy27+R+1eO4Z+PL7nUrdps0mAtkEEqfYBHIdVnoR4Gjn/87c19Bi8pINWChKFG
         2/RoT6Zoslui7ZC1H8A7e2DKdNvK4/EsvcY1p2mRSac4LX/R/BQOUgoBDT8nwHTBFKa7
         NfqqhuAM3cky9bW/ResRFrmtg2XFrjM9qn2lZqjGWzrSSus1C+Ivk4A9jqPX19G0QF1K
         SOUxFgDxX00NeEBEhblSC4f0lAZV/KpfzBUmubjNzTgRDdypPQOgxDCLwrmQluAWAKzE
         Jz4Q==
X-Gm-Message-State: AOAM531lNiO1TfOaXq+b4/I1VjeIyju6h2pHUK6rBqVhwU94G9JeMuGP
        4aNmVnXLR06LAoVZlO57/TU=
X-Google-Smtp-Source: ABdhPJweNj14pbEU2BwwObKVqsptYVvnWZcPx0AfnybiPUC/CHlE58pthykuoB7ebzubCgLlmFTvjA==
X-Received: by 2002:a5d:47ae:: with SMTP id 14mr5494747wrb.378.1611337410762;
        Fri, 22 Jan 2021 09:43:30 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id 192sm13543776wme.27.2021.01.22.09.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 09:43:30 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v4] regulator: Make regulator_sync_voltage() usable by coupled regulators
Date:   Fri, 22 Jan 2021 20:43:11 +0300
Message-Id: <20210122174311.28230-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Make regulator_sync_voltage() to re-balance voltage state of a coupled
regulators instead of changing the voltage directly.

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
Tested-by: Dmitry Osipenko <digetx@gmail.com> # A500 T20 and Nexus7 T30
Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---

Changelog:

v4: - Now not using goto in the code, like it was suggested by Mark Brown
      in a review comment to v3.

v3: - This patch is factored out from [1] to ease merging of the patches
      that will use the regulator_sync_voltage(). The goal is to get this
      change merged into 5.12, it will remove dependency for the Tegra Core
      power domain driver which will target 5.13.

      [1] https://patchwork.ozlabs.org/project/linux-tegra/list/?series=221130

 drivers/regulator/core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 3ae5ccd9277d..8e197b785a31 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -4148,7 +4148,11 @@ int regulator_sync_voltage(struct regulator *regulator)
 	if (ret < 0)
 		goto out;
 
-	ret = _regulator_do_set_voltage(rdev, min_uV, max_uV);
+	/* balance only, if regulator is coupled */
+	if (rdev->coupling_desc.n_coupled > 1)
+		ret = regulator_balance_voltage(rdev, PM_SUSPEND_ON);
+	else
+		ret = _regulator_do_set_voltage(rdev, min_uV, max_uV);
 
 out:
 	regulator_unlock(rdev);
-- 
2.29.2

