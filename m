Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC03FC433E9
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 12:29:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B5CF62310A
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 12:29:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387421AbhALM3G (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 12 Jan 2021 07:29:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387402AbhALM3C (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 Jan 2021 07:29:02 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB8A1C0617A3;
        Tue, 12 Jan 2021 04:28:07 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id s26so3065837lfc.8;
        Tue, 12 Jan 2021 04:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wTODOoNbSP003teN2HbiZ67THaMvfBqoh1T7AigGesM=;
        b=MkM1SmX2tQGEd699u150DJJahuzMFkuK+/oNuyFMXXs1vZvLWPTrhEkZi9ybFL7atq
         rUs/c/qHqO1B/NU3WL+qzwU0YOGWI6zTKYUJig5rLDxigHiGvEdZy6XNHj40GMa1W15M
         MxKQqf0NUKoNXTGtZb7NttWknyWo0GZfHrX4hiLKDNqt4v78YDn4KtVMuRWjBc5/pjwV
         +tjDNKf2ZwSEC70fAzuYds23NQW6FVvxz+puRl8PCCFqr4FAiUh+iZgJ2MWdNb2hDsI1
         Ke5tzdkOLFDo7HgfYxauoh0Bx3hwOdOxaWSHOM8T+6f+kmul6NS0aP7FmUhLnGHkJoAH
         RPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wTODOoNbSP003teN2HbiZ67THaMvfBqoh1T7AigGesM=;
        b=cD1f3xJB2L2f2/O17vxgpOf+mZHJWUi5o6AyK7DJcQi5l0o2BFgXkxLWzdUI+Ymo8R
         f7jG1TeLcn9OBzncBY2IryK72arSq/VqHB9z63oDPUjbWnkkUlQU0UTpC8gfcp4acDjW
         lteuT26IMX+R67uUV6Vw8lVKu66b0Qi3xV6SMtyuTz7xZEnAoApI5+PwETDAkTgh1Rup
         K4xvdUnRzO9FSezCMetEaNOnRSPrcaCapyUBHktp6KToC+MSnJBeIieYSYd20bXfIuXG
         bZNEpPmyeTt6M5T3sOtJGHMpyomANXKxq4a59Rd13jKaSpCwsvFN0wMRIBV8x4yMCQSj
         cjjQ==
X-Gm-Message-State: AOAM533lgCrMJXBc+sCeQd36jVP6i9B3rdpPy5FpcDEKLAk9zP2llHsu
        VkiZ+gHAsA48rIZarw072ZA=
X-Google-Smtp-Source: ABdhPJzj3YbPJOeNcrKbSIFW7s1BHejjXQ9q3hJpus2D0+aHPuooh0tnKw8GRpy3wbY5sch4Saa+Rg==
X-Received: by 2002:a19:5050:: with SMTP id z16mr1995389lfj.48.1610454486525;
        Tue, 12 Jan 2021 04:28:06 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id c3sm330136ljk.88.2021.01.12.04.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 04:28:06 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] MAINTAINERS: Hand Tegra clk driver to Jon and Thierry
Date:   Tue, 12 Jan 2021 15:27:24 +0300
Message-Id: <20210112122724.1712-6-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112122724.1712-1-digetx@gmail.com>
References: <20210112122724.1712-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Peter and Prashant aren't actively maintaining Tegra clock driver anymore.
Jonathan and Thierry will pick up maintaining of the driver from now on.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 CREDITS     | 6 ++++++
 MAINTAINERS | 4 ++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/CREDITS b/CREDITS
index 090ed4b004a5..aa4ac5810afc 100644
--- a/CREDITS
+++ b/CREDITS
@@ -1246,6 +1246,10 @@ S: 12 Shraga Raphaeli
 S: Petah-Tikva, 4906418
 S: Israel
 
+N: Prashant Gaikwad
+E: pgaikwad@nvidia.com
+D: Maintained NVIDIA Tegra clock driver
+
 N: Kumar Gala
 E: galak@kernel.crashing.org
 D: Embedded PowerPC 6xx/7xx/74xx/82xx/83xx/85xx support
@@ -3374,7 +3378,9 @@ E:
 D: Macintosh IDE Driver
 
 N: Peter De Schrijver
+E: pdeschrijver@nvidia.com
 E: stud11@cc4.kuleuven.ac.be
+D: Maintained NVIDIA Tegra clock driver
 D: Mitsumi CD-ROM driver patches March version
 S: Molenbaan 29
 S: B2240 Zandhoven
diff --git a/MAINTAINERS b/MAINTAINERS
index ad9abb42f852..b2132b2e00d9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17525,8 +17525,8 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git
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

