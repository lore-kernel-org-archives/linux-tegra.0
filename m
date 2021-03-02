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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B935C4332E
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 26D4764DD8
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378839AbhCCDbj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Mar 2021 22:31:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1447183AbhCBMvH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Mar 2021 07:51:07 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99CDEC061222;
        Tue,  2 Mar 2021 04:25:16 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id u4so30994447lfs.0;
        Tue, 02 Mar 2021 04:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ksrOcQH9Z4oWD/WAExssWru55oblOBFoV4Ung+svFCc=;
        b=haPOGS/kYytNHfPIwA2jULTwn4IzIIvn/y6rnNxfGYUsw55Bzz0wCuuTfGXxeKSu7x
         KmsTD5tKm6nN4sdbDqsoF2bTgm4GUP/FhUmx8D2NUaP4aN//maQsL+c9dR0irz3ahZ2w
         TkDmgwReAryrMO8wrJfWVfU/+NMKeg6HoRsWpFF4x7xMAM1Uf5mxjblhzPgfHet8RSSI
         nx/V+Rczh5Nos0KP7o5PLsUGx0dj1B5wCxpNID3zCRRpSwMPpN41vTCsHToeX3iMP2dk
         RQaNz3BfXhUAyEWA6DBKKQoBgsx+z9jlO8JwY1k3oNc6OeyFmJybOi24q9msVir5vSX9
         Q58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ksrOcQH9Z4oWD/WAExssWru55oblOBFoV4Ung+svFCc=;
        b=POWp8N2jXX5JnjD/nGrlK5cqAtBAZ9raubtPA8JDyDjmralE4aP7oYoPET3TGZNhoy
         qEE03mD1m1ayYrmuqZJOv+k2frGU8CXWIcn5SvwhThtzwCzFsvY/d3CDJ4I8UUeJHvcu
         H8o7Jj0drjchaUdE4ONpeIwJJ/P1nbcM3uMxa8SPCRA3fYk1wK8M6TPaFqWvlAAj9SRo
         I+2fHmUYgMYD2K5jGVhg48/zL8JVAZXikPx0CBuqi8g41nQOPIMLCXfmM06otX5FSIkN
         JMtmL3TyAOf3nLopp9pjPgVLN+KAy9idjZEhdXTSCtRaf9cvSVmFEYbdseoeRfN9om9d
         SQIg==
X-Gm-Message-State: AOAM531ywCOjhyHoiaJIdatGVGmZzNx+fYMc9Yfme/KsdFZeG2zB9VEi
        qlilTIPlXe/lQZHJ+neVJIY=
X-Google-Smtp-Source: ABdhPJx7YLT8ZCdypQfvLQ72adtoeWRVWEq/B4hutEu9VF+xIaMU+t5KMNGkqfyVDcvBrvFCEuq18A==
X-Received: by 2002:a19:c3c3:: with SMTP id t186mr11990721lff.596.1614687915143;
        Tue, 02 Mar 2021 04:25:15 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id u4sm2602126lfs.61.2021.03.02.04.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 04:25:14 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/5] soc/tegra: pmc: Rate-limit error message about failed to acquire of reset
Date:   Tue,  2 Mar 2021 15:25:02 +0300
Message-Id: <20210302122502.20874-6-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210302122502.20874-1-digetx@gmail.com>
References: <20210302122502.20874-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

PMC domain could be easily bombarded with the enable requests if there is
a problem in regards to acquiring reset control of a domain and kernel
log will be flooded with the error message in this case. Hence rate-limit
the message in order to prevent missing other important messages.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/pmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index bf29ea22480a..84ab27d85d92 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -868,8 +868,8 @@ static int tegra_genpd_power_off(struct generic_pm_domain *domain)
 
 	err = reset_control_acquire(pg->reset);
 	if (err < 0) {
-		dev_err(dev, "failed to acquire resets for PM domain %s: %d\n",
-			pg->genpd.name, err);
+		dev_err_ratelimited(dev, "failed to acquire resets for PM domain %s: %d\n",
+				    pg->genpd.name, err);
 		return err;
 	}
 
-- 
2.29.2

