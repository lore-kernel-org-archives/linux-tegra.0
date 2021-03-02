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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B2BCC433E0
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0BF5A64E6F
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442229AbhCCDbs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Mar 2021 22:31:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351119AbhCBNbV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Mar 2021 08:31:21 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D305C0611C1;
        Tue,  2 Mar 2021 05:18:11 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id m11so23005159lji.10;
        Tue, 02 Mar 2021 05:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aryRWfHy/BwUj+ItUybdCEYjUzZTplIX20T2mcxgmzE=;
        b=VZP4QeN/pEhdY+xM+xIift124/XRhQ+hNxG5s31gOrQ0UmNDd+1WHRtfNB2643HEo8
         QS1QWHA59ArORHklMztPdpGB6iEoCPSXvvXoH3QZ5VP/CRBt6PAYh8qS7Qz+lChE2jU4
         iGYNHpYYbWPmTU+iuD6wUQhcBhQhlFCbM0Z2MrLUUo6bH96xu36WU68Toj/52iSq4ny0
         uxVqhmU/RS/IoMlHx0E+/PHHeHmFXthCxb9Vzz+U4YFTbe6N7oRX2rR7pFRccI6qOgLc
         R49J6isvYNj0ypvVNVE4PjTFyHYdR9IffDHuHLW7wEVjPhObonYXoDZmS2xiYFWVfhwL
         ZExg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aryRWfHy/BwUj+ItUybdCEYjUzZTplIX20T2mcxgmzE=;
        b=Aesv70vgbxDROaksT/LijqoJLXN/QTbREW6fd7d3PTHC6yprTyt4z2JONqg/ERs4M6
         nc9PsfmfLEp6Lchaxpak0AWyGCvL2IkGkx9PSgnnhP9zoEkwzm5ycOUNwmfigbeDF4vr
         KDRme9tnyDBmB/dOSE1cwpE8hPxSXftekJKxs8hY0cR/QnncJ8M970wmZHhTCoS+xLQm
         +Iccw7GU1qYLNxB0LoIi76BkCOG0yvh2+EdqT5KV/WN1MmCmRrcQssvJhTu0la1msgkh
         XS/qWMqIXmvN8bZuQntpOSgAAptAZ3/xnRR5LeAybTfi0CNULvFC+1b+GCiwWiECnnIp
         RshQ==
X-Gm-Message-State: AOAM530o/qAHhsKYcErjBx2xk/TxeM/VImnLcHo0CvHOBUx7t3/+rwY1
        vN8BeWRbN6j6LA6I8WozD5I=
X-Google-Smtp-Source: ABdhPJwR3o6IEtPYQQp0ZO9AJsmKYneTqAxK0wyPLoyTfkdWYpN1iambsYllOIT+h4KC2+uX34jUNA==
X-Received: by 2002:a2e:a318:: with SMTP id l24mr5518441lje.399.1614691089873;
        Tue, 02 Mar 2021 05:18:09 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id t11sm962523ljk.65.2021.03.02.05.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 05:18:09 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1] soc/tegra: regulators: Fix locking up when voltage-spread is out of range
Date:   Tue,  2 Mar 2021 16:18:00 +0300
Message-Id: <20210302131800.14408-1-digetx@gmail.com>
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

