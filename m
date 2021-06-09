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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B0BDC48BCD
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Jun 2021 11:26:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5CE2B61108
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Jun 2021 11:26:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239020AbhFIL2Z (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 9 Jun 2021 07:28:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234287AbhFIL2Z (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 9 Jun 2021 07:28:25 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C17D9C06175F;
        Wed,  9 Jun 2021 04:26:30 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id e11so14875924wrg.3;
        Wed, 09 Jun 2021 04:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=41nZO+NiqKpFGs/cU7OzdgFaS5JHUOzIvKOl1M3dIUI=;
        b=kRijqbJz2sB/zbNuBOQVYo5E9M/DzzY8HyiNtD57ginf/M2eEyOVINBidtIbZINnxk
         /ch3MYVBn2hupeqYdCOdKFuyX7j99RQIm/InGnwcw2NP1LfYFaq2msJ4Ia2vnvAocfeW
         MiFtpZiqEscbCHVRS5tF84CArbeoKYBmT9XrJrUmoXTR7ncStOk/aay5Pu45sFSUPElr
         wQ9BF0Zo3XqA96M4EA4G27NltZxHh8h0a2CZsi+HxAMMgUrN4dYO6X9mJWhPJCmW7DvM
         luD2txySFQ2S6rx3qqF5ILOi31LsRhzmmTOZzX0wLzV2j4En8OPT6nCxBd7v2ywrxbR7
         aSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=41nZO+NiqKpFGs/cU7OzdgFaS5JHUOzIvKOl1M3dIUI=;
        b=M0U/f5J6HH5B7D4Y7B1TvSGcESW9Gh8zYu8Cxp45ptdSJ5To9Ah6n+eC9hah9Kwglf
         St0YZyZLUPCBRGFRyHammvVzWIcy2dcU3IGaBXI175obpJSkR/LXhkYD7MZlDSoojBPG
         6yYLfZ+BJ1uRQbd+p03qjCBY40IIBtHJfgjbeCwsGB/0lRkttlXhchOIfakUrwjdu9/c
         RsDvMHTv04JvILym5YbTA7yGCf2A+TshZLeB4YvnvUC+CMtrexadaYI7xowOYIbUAQVq
         SZ0qfL824mx+k56LnVZDIBn/20oUT+RhqbRD9caXvhmtBrFNyQOa9Br3grvjqYtXjysR
         SYCA==
X-Gm-Message-State: AOAM531drQ5EjFrydFeqnwCdDtyFpQJSSafk7Gp+om8BAXMb7Vjvj3x5
        tbgMLNx9PvbRx700jKkjuHQ=
X-Google-Smtp-Source: ABdhPJwLsjwkYby/wStEihX4MzH3YM7ZxrN2jJXSxp77prBq+u6LEyULEWgBnYt4Ce+TLHehbH64UQ==
X-Received: by 2002:adf:eb82:: with SMTP id t2mr27682165wrn.337.1623237989350;
        Wed, 09 Jun 2021 04:26:29 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id g21sm24563892wrb.46.2021.06.09.04.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 04:26:28 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] memory: tegra: Add missing dependencies
Date:   Wed,  9 Jun 2021 13:28:05 +0200
Message-Id: <20210609112806.3565057-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609112806.3565057-1-thierry.reding@gmail.com>
References: <20210609112806.3565057-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

When enabling the COMPILE_TEST Kconfig option, the Tegra memory
controller can be built without ARCH_TEGRA being selected. However, the
driver implicitly depends on some symbols pulled in via ARCH_TEGRA,
which causes the build to break.

Add explicit dependencies for OF_EARLY_FLATTREE and OF_RESERVED_MEM to
the Tegra MC Kconfig option to make sure they are selected even if
ARCH_TEGRA is not.

Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/memory/tegra/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
index f9bae36c03a3..ecfb071fc4f4 100644
--- a/drivers/memory/tegra/Kconfig
+++ b/drivers/memory/tegra/Kconfig
@@ -48,6 +48,8 @@ config TEGRA124_EMC
 config TEGRA210_EMC_TABLE
 	bool
 	depends on ARCH_TEGRA_210_SOC || COMPILE_TEST
+	select OF_EARLY_FLATTREE
+	select OF_RESERVED_MEM
 
 config TEGRA210_EMC
 	tristate "NVIDIA Tegra210 External Memory Controller driver"
-- 
2.31.1

