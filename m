Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E7DEC28D17
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E158164E27
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377816AbhCCDbI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Mar 2021 22:31:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350056AbhCBLyB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Mar 2021 06:54:01 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97312C0617A9;
        Tue,  2 Mar 2021 03:51:45 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id 2so19016042ljr.5;
        Tue, 02 Mar 2021 03:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hOjHRB69mCq2G+Xj/X2gbvje8jhvbBvQHq+6GJ2+Od8=;
        b=kcLAcYQYUkFawJCL3UQdTwwoffpy9C4olKM/nsMaJ15pv4BF8A3nmiGhx983dlVrPY
         3eU9ZICtdyBRNQ1bjbYdOUluhW0rifLi6RXD8ovKPAgljHWYSH0S78RVj76XYgLKSyZA
         E58/F5ereotczp/CNlQzcYMmaePbsTavC7JHT1wIXJde2dGe7vFE/8Ueyk6w2bHo21VF
         Zdj39J+as46+9sakkas9FLWmQ5On9+NyAxFYc4VxgesRVpLgARrncyeSTmyHdrz4e2vT
         AngJ0ndqCiNIOHd59uGEVASysCnVnzGpHoOMqhlZARFzZcj9Jly6yWehhJu84VCtsHyH
         SOHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hOjHRB69mCq2G+Xj/X2gbvje8jhvbBvQHq+6GJ2+Od8=;
        b=hyzyBLd9qgVAaTm2NduOnlGTBcO1wXxbtFVU4WHZnYfolQjrAMnjlLI0wXhaq8Cvda
         dGNVSY0ufJAGHeyObPe4LMd1u9xkZ9sN5SpgxziOgDDzAPlFrnIX8rrkio9epWhEc+19
         hBja1tuiNxw5YiUYyLGpzs3eH8BfroImGoZwiU3Z3ly6yClZY/FPrQi3hlBlZ3xCdJVh
         hHMJ0NnKyZFw9BPih+VWIB5JMiIghWdWL2A8w4LiVdRHhj8vGbS+b71MNV8+cTFVquJm
         Zz9rLWxt/jmEXH4Bk31gxO+MRbFVeFgEerCm9ehtg5ctwuQEXIxHTh/fi5QA7MXuzq3V
         z0vw==
X-Gm-Message-State: AOAM531GACJTScH5bqaSCd72RhjXxuowdxx7URLCs9JkcOmJhD7Zf3a5
        egvGzd0G9s4pDWSXR6PMvNk=
X-Google-Smtp-Source: ABdhPJyhJaIQF0jtFjLD7MLoOjNv8qXxrEu88dNBKRzEqzdczwzNdDERuBYhvQfiHAU6Yt84ijJRyA==
X-Received: by 2002:a2e:9145:: with SMTP id q5mr12533206ljg.54.1614685904153;
        Tue, 02 Mar 2021 03:51:44 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id f4sm2720151lja.69.2021.03.02.03.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 03:51:43 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/6] MAINTAINERS: Hand Tegra clk driver to Jon and Thierry
Date:   Tue,  2 Mar 2021 14:51:16 +0300
Message-Id: <20210302115117.9375-6-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210302115117.9375-1-digetx@gmail.com>
References: <20210302115117.9375-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Peter and Prashant aren't actively maintaining Tegra clock driver anymore.
Jonathan and Thierry will pick up maintaining of the driver from now on.

Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 CREDITS     | 6 ++++++
 MAINTAINERS | 4 ++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/CREDITS b/CREDITS
index cef83b958cbe..e28724061f90 100644
--- a/CREDITS
+++ b/CREDITS
@@ -1250,6 +1250,10 @@ S: 29 Duchifat St.
 S: Ra'anana 4372029
 S: Israel
 
+N: Prashant Gaikwad
+E: pgaikwad@nvidia.com
+D: Maintained NVIDIA Tegra clock driver
+
 N: Kumar Gala
 E: galak@kernel.crashing.org
 D: Embedded PowerPC 6xx/7xx/74xx/82xx/83xx/85xx support
@@ -3387,7 +3391,9 @@ E:
 D: Macintosh IDE Driver
 
 N: Peter De Schrijver
+E: pdeschrijver@nvidia.com
 E: stud11@cc4.kuleuven.ac.be
+D: Maintained NVIDIA Tegra clock driver
 D: Mitsumi CD-ROM driver patches March version
 S: Molenbaan 29
 S: B2240 Zandhoven
diff --git a/MAINTAINERS b/MAINTAINERS
index cac842923607..558c36f16680 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17587,8 +17587,8 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git
 N:	[^a-z]tegra
 
 TEGRA CLOCK DRIVER
-M:	Peter De Schrijver <pdeschrijver@nvidia.com>
-M:	Prashant Gaikwad <pgaikwad@nvidia.com>
+M:	Jonathan Hunter <jonathanh@nvidia.com>
+M:	Thierry Reding <thierry.reding@gmail.com>
 S:	Supported
 F:	drivers/clk/tegra/
 
-- 
2.29.2

