Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42C1DC07E95
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Jul 2021 02:51:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E0B16136E
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Jul 2021 02:51:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237700AbhGNCyg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 13 Jul 2021 22:54:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237695AbhGNCyc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 13 Jul 2021 22:54:32 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77D9CC0613EE;
        Tue, 13 Jul 2021 19:51:37 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id b26so935532lfo.4;
        Tue, 13 Jul 2021 19:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HIAHm+ZrmXfhQZaTv1RckgVyM40IHBDXoWkds7gbtMs=;
        b=oqPYDn7bx8huDYPlj6OMLB+WbhvRSLeb8lM+n2JcO2T2Tjjs2MKShGCgqyBa9eSjdV
         cvgyp1LcAqjtVbRfAgsl//VYYbZRfKFA0oSeHiRVDor7uldq1Zj8baVQ5biw6Za/8LXz
         ztnbgiQWSN+slL51WIozAG0xqVsjZKDtyThFAJTAHLCQ9ZtKLDLzDgcH2JHZcH7k9+lR
         77VZ7x3iTzDtyLTY4XKRb5RsjOAxaCz9apFrhDZxIqT4tOxFbm7Jo7TnVOzKh8jMonI1
         yGcz3k4/DzyRwE/7r/v2MJ57OpyFywf30m99Oh2mxO1KlHk6YG1RUfKGyB4/t30rw8Ld
         icaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HIAHm+ZrmXfhQZaTv1RckgVyM40IHBDXoWkds7gbtMs=;
        b=sPO0lrYI1T9rcthK9QmsO3hMDFrCwSc73sDMYw/dJ1q8W9GC/pMN88kMWrs/z+w/qt
         aXvVvgg4IhLolejt7pz3iL4rmbFKcpdpNx+Jivq1G11BmV89o2WdVKk74CCZLuZHkiJ/
         PRfUjlAaARv3slJnD1A6WdZmnZCHaA3+iyc8LXxEvXMYt2Hfx5znz2Gdn1m4vx+FVIQe
         v/b6IhBpDyuMZNWKcxXT+9sQuBKKD5OLY04HYeVCOLEA9Ni+k3ETkILB9h26F5SJ72ND
         1wRtpD2DiFmdHYH4lKvP7LlbQ+/62kuY0lPnFCbPYSrhNGM4mGH2lmkFica10XpLCWUs
         qqzA==
X-Gm-Message-State: AOAM5329I+NrEARdXQtnfUJP7FYkyOJKfvLZFGddIgCaehQvieUK/O2/
        DT+pA14zQiP2k50vlp19LtM=
X-Google-Smtp-Source: ABdhPJyqNIJTCVuAxNHT46uYxfqvDd7ut8jonVwWHCdacgHRenSgDBtD/wscMzWKFerXoEzLD5FvuA==
X-Received: by 2002:a05:6512:34d1:: with SMTP id w17mr6164128lfr.439.1626231095862;
        Tue, 13 Jul 2021 19:51:35 -0700 (PDT)
Received: from localhost.localdomain (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.gmail.com with ESMTPSA id a10sm50281lfb.93.2021.07.13.19.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 19:51:35 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 4/7] ARM: tegra_defconfig: Enable CONFIG_CROS_EC
Date:   Wed, 14 Jul 2021 05:51:24 +0300
Message-Id: <20210714025127.2411-5-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210714025127.2411-1-digetx@gmail.com>
References: <20210714025127.2411-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Maxim Schwalm <maxim.schwalm@gmail.com>

Updating the tegra_defconfig was omitted, when the ChromeOS EC config
options were renamed by a previous commit. Fix it.

Fixes: 67c70aa86f8b ("arm/arm64: defconfig: Update configs to use the new CROS_EC options")
Signed-off-by: Maxim Schwalm <maxim.schwalm@gmail.com>
---
 arch/arm/configs/tegra_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index 52db1c4f9de4..0bb0846265b5 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -175,7 +175,6 @@ CONFIG_WATCHDOG=y
 CONFIG_MAX77620_WATCHDOG=y
 CONFIG_TEGRA_WATCHDOG=y
 CONFIG_MFD_AS3722=y
-CONFIG_MFD_CROS_EC_DEV=y
 CONFIG_MFD_MAX77620=y
 CONFIG_MFD_MAX8907=y
 CONFIG_MFD_STMPE=y
@@ -289,6 +288,8 @@ CONFIG_NVEC_POWER=y
 CONFIG_NVEC_PAZ00=y
 CONFIG_STAGING_MEDIA=y
 CONFIG_TEGRA_VDE=y
+CONFIG_CHROME_PLATFORMS=y
+CONFIG_CROS_EC=y
 CONFIG_TEGRA_IOMMU_GART=y
 CONFIG_TEGRA_IOMMU_SMMU=y
 CONFIG_ARCH_TEGRA_2x_SOC=y
-- 
2.32.0

