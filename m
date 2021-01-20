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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72D88C433E6
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 02:28:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1325622AAA
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 02:28:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728482AbhATC2W (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 21:28:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728053AbhATBZO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 20:25:14 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACD49C0613D3;
        Tue, 19 Jan 2021 17:24:14 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id h7so2637942lfc.6;
        Tue, 19 Jan 2021 17:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r6Ds8q+umkTJ+f5QnrspkLdH8acxmjzMhCAhagVepKM=;
        b=IaLQMXGHUj+UWnK+WM0LTRNyxFrF1FgwCbSP/FR/8XiUaBLdhVq4LFFW7itYQDSOrG
         z7mNl9jGgp8RI7AhSc34IBh5aYwyMv4pbsKd+gPkP1GLZ6RgZdD+0mT5LZ+BSq5Inswz
         2RJzuXtSidkJ5u2DNdvKhoo6Uugh0h56CAcV4hHngqyKxTK9T5zvTRLkiUEERPifb1UN
         wD7Wz5Mu8QFQEoykhx84azWbyy/s763Lho9VlUiSV4EuETUOKLUsrjEwhdq6zMWqIe0v
         SjzbLP+EvDXRfgTGS/De4IQsserYWOImFQeAGQ8mZctD2q+jaJiSAFs3qLtXi0MGTrBZ
         v/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r6Ds8q+umkTJ+f5QnrspkLdH8acxmjzMhCAhagVepKM=;
        b=cuBEnAm9pBW7tFCA/8RoCyjTTE+W8dZzmrjtotWu5wgJ67pPG+CeUzQG94qFQyfwDP
         rz1lEqD/2uCv8x2zFDOznapBBUrxysylzd4PQpqA9WGsV0R+9K6KA2yHsVuddJH1uasF
         /OYODAMsO0pDSWI7Zg9V3t+m/UshVzmXJNoQtxZzwIC0sod4eiNaiBnDNLSTDdDLrVcK
         lmaRX9fqlSBAwCS0GCUsWVKJTZ7dOFZ4jLmkJI+CBlyOvvslDgar0v8KDYlTBVpFXXRW
         8bQ7OqKWIik/FBjQieG5MYAXgCANO4ed+9qvxmepRDH/g0ABc2CCQpO1LbjCBa94o2mq
         h/bQ==
X-Gm-Message-State: AOAM532pSEy7huNZpiWVduhrXnyMlGbMNkf3LN0PuPbAAHXNLo+MTpD/
        /q1G39WxjqIUyNHAV6PQXyezbHsJE5A=
X-Google-Smtp-Source: ABdhPJwnw7EYfktEmwSEepDxyv1O2itAGe4rOhy0fkeW7ILLDZANwrhwkYSBbTZsJqEO2TYtqiGS1g==
X-Received: by 2002:ac2:5ff1:: with SMTP id s17mr3077326lfg.139.1611105852707;
        Tue, 19 Jan 2021 17:24:12 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id c8sm28416lja.80.2021.01.19.17.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 17:24:12 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] soc/tegra: pmc: Print out domain name when reset fails to acquire
Date:   Wed, 20 Jan 2021 04:23:56 +0300
Message-Id: <20210120012357.11038-5-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120012357.11038-1-digetx@gmail.com>
References: <20210120012357.11038-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Print out domain name when reset fails to acquire for debugging purposes
and to make formatting of GENPD errors consistent in the driver.

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
Tested-by: Dmitry Osipenko <digetx@gmail.com> # A500 T20 and Nexus7 T30
[this patch was also boot-tested on some other T20/30/114 devices]
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/pmc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index a87645fac735..bf29ea22480a 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -868,7 +868,8 @@ static int tegra_genpd_power_off(struct generic_pm_domain *domain)
 
 	err = reset_control_acquire(pg->reset);
 	if (err < 0) {
-		pr_err("failed to acquire resets: %d\n", err);
+		dev_err(dev, "failed to acquire resets for PM domain %s: %d\n",
+			pg->genpd.name, err);
 		return err;
 	}
 
-- 
2.29.2

