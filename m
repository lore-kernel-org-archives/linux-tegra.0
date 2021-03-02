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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 016CBC2BA14
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC12F64E84
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378358AbhCCDbe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Mar 2021 22:31:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1446903AbhCBMlb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Mar 2021 07:41:31 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E96E7C061223;
        Tue,  2 Mar 2021 04:25:16 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id v5so30926640lft.13;
        Tue, 02 Mar 2021 04:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GkOVEuqEzM8HV8JCIxdc0385FIpKAwOwjnAdDLgSkBA=;
        b=h0C17QdkNV9NKbXK+aLjm/l7bf5T4ust0SbrXhEmeHxpgWN/x1DlRjxbeEggoCIGrY
         Ij0dfyl9JEbh1kP4afkQExV4+cBdkmma2ubhX0HNhXT9G1qtbidUgiomXsk5Mi1RMlXA
         IqH5O4L07wX5LIITUsxFaLSIxuilwNFIqV1HXLerxxtTRcTd/2/ADMtNIwu8U6zx/PZe
         Si2/r6S7H800V/iYIGMIfnhn4ep1LhW5xAU0QbHdAmbvFm+3+Cnhl3SjLChFqTzm7Uhm
         6lXxKJM6gUxu4eTFYFYBXFwvWeeqOZgudxY4AX3yyWZix3veFzTlpJHQGgNlBpiPEPLN
         TCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GkOVEuqEzM8HV8JCIxdc0385FIpKAwOwjnAdDLgSkBA=;
        b=aqC1NonLdcbxBdG4YniPJZYJfGRSffu0E1EHdmmoTvk0M0epgBazl/lC8d9Yd+MBNs
         kJNT7jIIHv8RuMlUShIDTMb0kpuuSFXooSk7DUYFTMxM0V+fWek843cNQ8nS14Z0+qZf
         OkPpTXrg4e2UvuKH53fIv3F+vYOoBTZ7hLLCxYaJDt3UiTFh2FDjacKjDvU4c+TUD8Qg
         xpEEuImZFAi20uf1+HQI9I+UKrbV2aAfgb99TJEykFsfhfb/oOtpt9hn44wpphG1fXoV
         1bIMz9zwdt/X5j3XqLpTmmRUzRf2aRUR6YEKzd4xLi/OSEdykeHDgS59XKkZ/RhqW/62
         5iyw==
X-Gm-Message-State: AOAM531r6kUgVDv6h8rlwKn8mjprhrOez1VfV5U/+FL4Cp46FgR8ZWix
        BAUHhQUH0+ud8ESdc8hdbuA=
X-Google-Smtp-Source: ABdhPJzYlMZhJ2eDivkbUiIJ2QVFH8VMZAf87JModWaLSeBbwL0iV3wHXT6snV8QbONPJwfvYBfc7A==
X-Received: by 2002:a05:6512:3693:: with SMTP id d19mr11867014lfs.118.1614687914542;
        Tue, 02 Mar 2021 04:25:14 -0800 (PST)
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
Subject: [PATCH v4 4/5] soc/tegra: pmc: Print out domain name when reset fails to acquire
Date:   Tue,  2 Mar 2021 15:25:01 +0300
Message-Id: <20210302122502.20874-5-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210302122502.20874-1-digetx@gmail.com>
References: <20210302122502.20874-1-digetx@gmail.com>
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

