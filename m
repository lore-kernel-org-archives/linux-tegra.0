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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D03FC07E96
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:55:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22F5861026
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:55:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231827AbhGKX56 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 11 Jul 2021 19:57:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231166AbhGKX55 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 11 Jul 2021 19:57:57 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C117C0613DD;
        Sun, 11 Jul 2021 16:55:10 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id z12so12588925qtj.3;
        Sun, 11 Jul 2021 16:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F8IeVJTr7i2bx9mvdVqSYgCa5mC3W+aMda3nWI0nED8=;
        b=E2Z+RVZPeX80geRp7lkg8n4G530jPxnRJGfY/Ksdv9qM8MkgEKy48VTJkxFOZsuilk
         2WZ6Ij/y5yKVmSy8sR5d4HwonC66IFH8w0+TWyX+wEN1RddxpAHgX8MQgI9QRs/fO1IJ
         53SCcRZNck1q18bDVwjmb/pk5Y5TmqeSnMzVJZL8BZ/wJGeiwY5RrtUSQqQT5WgONHEQ
         3Z2ga1LkHGAE4LIwLXI+8SZlAL11wxbACpgCYF3aIlplKNyHcT1UGSV658+YIwReSMmL
         zLdrX4inEYeC1W3Eu0rPDZ2GOF5VKLpLAsN25GFLrGkEBcL/CYqHlYoIZad6WBGb2gVj
         lD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F8IeVJTr7i2bx9mvdVqSYgCa5mC3W+aMda3nWI0nED8=;
        b=cxlhuOCdc+GclmvbbwNOXAsi78X4cN8NR/TkFoFyughEV9A1XBUlGgH20/nSApKTMV
         BwKXssl6qDetcmGbBf4PZgHvq0Plaepm9LOqBuWIxonv1Na0yIQu/wQK17Wg6aKHljhX
         TjCWKnBvmmFHwPoEhpc/Xii+NNquQ64yLe+MBkUIw16/xAp28HJlReASiOxvqtC0upZU
         dP44hSM5eq4NZAunICkQsgHaRFG3rsmfGNFOybiHE+yH+vdj4yL9KYkiSuvIfs65Se2C
         9t7BqB0sfYN0R9TLUw9+dZdjlMHXq9A+iWp0mq2FOWQg9CCxmOWy/h/muoKWFkXD1ucV
         BBzg==
X-Gm-Message-State: AOAM530f9vYkb74a44krqRDF2WFmmp8GL61mVdlcSCT3ko6WkOWcT/1/
        JSgKvZfpaYPC3IM8Uz7e60A=
X-Google-Smtp-Source: ABdhPJxfaM0FezJQXfFvchLsTBrCCHtqIJnuUO1hmh4vYezjh9eSThHD2lAjqsxJxVsDP/gifCPKgg==
X-Received: by 2002:ac8:7f02:: with SMTP id f2mr27183019qtk.213.1626047709585;
        Sun, 11 Jul 2021 16:55:09 -0700 (PDT)
Received: from localhost.localdomain (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.gmail.com with ESMTPSA id h10sm4963133qta.74.2021.07.11.16.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 16:55:09 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 1/5] ARM: tegra_defconfig: Enable CONFIG_TEGRA30_TSENSOR
Date:   Mon, 12 Jul 2021 02:54:31 +0300
Message-Id: <20210711235435.31165-2-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210711235435.31165-1-digetx@gmail.com>
References: <20210711235435.31165-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable NVIDIA Tegra30 SoC thermal sensor driver in tegra_defconfig.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/configs/tegra_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index 3d8d8af9524d..63e7f3261e6d 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -169,6 +169,7 @@ CONFIG_THERMAL_STATISTICS=y
 CONFIG_CPU_THERMAL=y
 CONFIG_DEVFREQ_THERMAL=y
 CONFIG_TEGRA_SOCTHERM=m
+CONFIG_TEGRA30_TSENSOR=m
 CONFIG_WATCHDOG=y
 CONFIG_MAX77620_WATCHDOG=y
 CONFIG_TEGRA_WATCHDOG=y
-- 
2.32.0

